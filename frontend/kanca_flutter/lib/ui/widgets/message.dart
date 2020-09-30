import 'package:chill/models/message.dart';
import 'package:chill/repositories/messaging.dart';
import 'package:chill/ui/constants.dart';
import 'package:chill/ui/widgets/photo.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class MessageWidget extends StatefulWidget {
  final String messageId, currentUserId;

  const MessageWidget({this.messageId, this.currentUserId});

  @override
  _MessageWidgetState createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {
  MessagingRepository _messagingRepository = MessageRepository();

  Message _message;

  Future getDetails() async {
    _message = await _messagingRepository.getMessageDetail(
      messageId: widget.messageId);

    return _message;
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return FutureBuilder(
      future: getDetails(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        } else {
          _message = snapshot.data;
          return Column(
            crossAxisAlignment: _message.senderId == widget.currentUserId
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: <Widget>[
              _message.text != null
                  ? Wrap(
                    
                  )
          )
        }
      }
    )
  }
}
