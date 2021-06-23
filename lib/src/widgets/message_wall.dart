import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'chat_message_other.dart';
import 'chat_message.dart';

class MessageWall extends StatelessWidget {
  final ValueChanged<String> onDelete;

  final List<QueryDocumentSnapshot> messages;
  const MessageWall({Key? key, required this.messages, required this.onDelete})
      : super(key: key);
  bool shouldDisplay(int idx) {
    if (idx == 0) return true;
    final previousId = messages[idx - 1].data;
    final authorId = messages[idx].data;
    return authorId != previousId;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final data = messages[index].data();
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          return Dismissible(
              key: ValueKey(data),
              onDismissed: (_) {
                onDelete(messages[index].id);
              },
              child: ChatMessageOther(
                index: index,
                data: data as Map<String, dynamic>,
                showAvatar: shouldDisplay(index),
              ));
        }
        return ChatMessageOther(
          index: index,
          data: data as Map<String, dynamic>,
          showAvatar: shouldDisplay(index),
        );
      },
      itemCount: messages.length,
    );
  }
}
