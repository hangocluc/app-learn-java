class ProfileModelUI {
  final String id;
  final double mark;
  final String date;
  final String userId;

  const ProfileModelUI({
    required this.id,
    required this.mark,
    required this.date,
    required this.userId,
  });
}

class RankUserModelUI {
  final String id;
  final String name;
  final String email;
  final double mark;
  final String avatar;

  const RankUserModelUI({
    required this.id,
    required this.name,
    required this.email,
    required this.mark,
    required this.avatar,
  });
}
