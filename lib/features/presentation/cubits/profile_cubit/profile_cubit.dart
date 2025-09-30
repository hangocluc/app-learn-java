import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/src/profile/profile_entity.dart';
import '../../../domain/entities/src/profile/rank_user_entity.dart';
import '../../../domain/usecases/src/profile/profile_usecase.dart'
    as profile_uc;
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final profile_uc.ProfileUsecase usecase;

  ProfileCubit({required this.usecase}) : super(ProfileStateInitial());

  Future<void> loadProfileData(String userId) async {
    try {
      emit(ProfileStateLoading());

      // Load profile scores and rank data in parallel
      final results = await Future.wait([
        usecase.call(userId),
        usecase.getProfileRank(),
      ]);

      final profileResult = results[0];
      final rankResult = results[1];

      List<ProfileEntity> profileScores = [];
      List<RankUserEntity> rankUsers = [];
      int userRank = 0;
      double userScore = 0.0;

      profileResult.fold(
        (exception) {
          emit(ProfileStateFailure(message: exception.toString()));
          return;
        },
        (data) {
          profileScores = (data as List<ProfileEntity>)
              .reversed
              .toList(); // Reverse to show latest first
        },
      );

      rankResult.fold(
        (exception) {
          emit(ProfileStateFailure(message: exception.toString()));
          return;
        },
        (data) {
          rankUsers = data as List<RankUserEntity>;
          final userRankAndScore = _findUserRankAndScore(rankUsers, userId);
          userRank = userRankAndScore['rank'] as int;
          userScore = userRankAndScore['score'] as double;
        },
      );

      emit(ProfileStateSuccess(
        profileScores: profileScores,
        rankUsers: rankUsers,
        userRank: userRank,
        userScore: userScore,
      ));
    } catch (e) {
      log('ProfileCubit error: $e');
      emit(ProfileStateFailure(message: 'Error loading profile data: $e'));
    }
  }

  Map<String, dynamic> _findUserRankAndScore(
      List<RankUserEntity> rankUsers, String userId) {
    for (int i = 0; i < rankUsers.length; i++) {
      if (rankUsers[i].id == userId) {
        return {
          'rank': i + 1,
          'score': rankUsers[i].mark,
        };
      }
    }
    return {'rank': 0, 'score': 0.0};
  }

  Future<void> refreshData(String userId) async {
    await loadProfileData(userId);
  }
}
