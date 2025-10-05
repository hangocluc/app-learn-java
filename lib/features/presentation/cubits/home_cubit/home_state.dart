abstract class HomeState {}

class HomeStateInitial extends HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateSuccess extends HomeState {
  final int completedLessons;
  final int totalLessons;
  final int exploredPrograms;
  final int totalPrograms;
  final double userScore;
  final int userRank;
  final List<Map<String, dynamic>> recentActivities;

  HomeStateSuccess({
    required this.completedLessons,
    required this.totalLessons,
    required this.exploredPrograms,
    required this.totalPrograms,
    required this.userScore,
    required this.userRank,
    required this.recentActivities,
  });
}

class HomeStateFailure extends HomeState {
  final String message;

  HomeStateFailure({required this.message});
}
