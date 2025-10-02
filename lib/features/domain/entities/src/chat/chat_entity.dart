class ChatEntity {
  final String id;
  final String userId;
  final String questionId;
  final String quizId;
  final String username;
  final String message;
  final String? imageUrl;
  final int vote;
  final List<String> userLiked;

  const ChatEntity({
    required this.id,
    required this.userId,
    required this.questionId,
    required this.quizId,
    required this.username,
    required this.message,
    this.imageUrl,
    required this.vote,
    required this.userLiked,
  });

  ChatEntity copyWith({
    String? id,
    String? userId,
    String? questionId,
    String? quizId,
    String? username,
    String? message,
    String? imageUrl,
    int? vote,
    List<String>? userLiked,
  }) {
    return ChatEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      questionId: questionId ?? this.questionId,
      quizId: quizId ?? this.quizId,
      username: username ?? this.username,
      message: message ?? this.message,
      imageUrl: imageUrl ?? this.imageUrl,
      vote: vote ?? this.vote,
      userLiked: userLiked ?? this.userLiked,
    );
  }

  bool get isLikedByCurrentUser => userLiked.isNotEmpty;
}
