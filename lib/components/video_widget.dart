import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoWidget extends StatefulWidget {
  VideoWidget({Key key}) : super(key: key);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 17, 0),
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.black,
                  size: 30,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 17, 0),
                child: Icon(
                  Icons.chat_bubble_outline,
                  color: Colors.black,
                  size: 30,
                ),
              ),
              Icon(
                Icons.send,
                color: Colors.black,
                size: 30,
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
            child: Icon(
              Icons.bookmark_border_outlined,
              color: Colors.black,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}
