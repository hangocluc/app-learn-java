import 'package:flutter/material.dart';
import '../../../domain/entities/src/chat/chat_entity.dart';

class ChatItemWidget extends StatelessWidget {
  final ChatEntity chat;
  final VoidCallback? onLike;
  final bool isLiked;

  const ChatItemWidget({
    Key? key,
    required this.chat,
    this.onLike,
    this.isLiked = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundImage: chat.imageUrl != null
                      ? NetworkImage(chat.imageUrl!)
                      : null,
                  child: chat.imageUrl == null
                      ? Text(chat.username.isNotEmpty
                          ? chat.username[0].toUpperCase()
                          : '?')
                      : null,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        chat.username,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        _formatTime(
                            chat.id), // Using ID as timestamp placeholder
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: onLike,
                      icon: Icon(
                        isLiked ? Icons.thumb_up : Icons.thumb_up_outlined,
                        color: isLiked ? Colors.blue : Colors.grey,
                        size: 20,
                      ),
                    ),
                    Text(
                      '${chat.vote}',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              chat.message,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(String id) {
    // This is a placeholder - in real implementation, you'd parse actual timestamp
    return 'Just now';
  }
}
