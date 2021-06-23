import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final int index;
  final Map<String, dynamic> data;
  final bool hasPadding;

  const ChatMessage({
    Key? key,
    required this.index,
    required this.data,
    this.hasPadding = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 5,
        top: hasPadding == true ? 15 : 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: 300),
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(5),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 12,
            ),
            child: Text(
              data['value'],
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
