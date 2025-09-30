import '../../domain/entities/src/profile/profile_entity.dart';
import '../../domain/entities/src/profile/rank_user_entity.dart';

import '../model/profile_model_ui.dart';

class ProfileMapper {
  static ProfileModelUI mapProfileEntityToUI(ProfileEntity entity) {
    return ProfileModelUI(
      id: entity.id,
      mark: entity.mark,
      date: entity.date,
      userId: entity.userId,
    );
  }

  static RankUserModelUI mapRankUserEntityToUI(RankUserEntity entity) {
    return RankUserModelUI(
      id: entity.id,
      name: entity.name,
      email: entity.email,
      mark: entity.mark,
      avatar: entity.avatar,
    );
  }

  static List<ProfileModelUI> mapProfileEntitiesToUI(
      List<ProfileEntity> entities) {
    return entities.map((entity) => mapProfileEntityToUI(entity)).toList();
  }

  static List<RankUserModelUI> mapRankUserEntitiesToUI(
      List<RankUserEntity> entities) {
    return entities.map((entity) => mapRankUserEntityToUI(entity)).toList();
  }
}
