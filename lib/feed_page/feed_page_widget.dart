import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/upload_media.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class FeedPageWidget extends StatefulWidget {
  FeedPageWidget({Key key}) : super(key: key);

  @override
  _FeedPageWidgetState createState() => _FeedPageWidgetState();
}

class _FeedPageWidgetState extends State<FeedPageWidget> {
  String uploadedFileUrl = '';
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final selectedMedia = await selectMedia();
          if (selectedMedia != null &&
              validateFileFormat(selectedMedia.storagePath, context)) {
            showUploadMessage(context, 'Uploading file...', showLoading: true);
            final downloadUrl = await uploadData(
                selectedMedia.storagePath, selectedMedia.bytes);
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            if (downloadUrl != null) {
              setState(() => uploadedFileUrl = downloadUrl);
              showUploadMessage(context, 'Success!');
            } else {
              showUploadMessage(context, 'Failed to upload media');
            }
          }

          final postsCreateData = createPostsRecordData(
            imageUrl: uploadedFileUrl,
          );
          await PostsRecord.collection.doc().set(postsCreateData);
        },
        backgroundColor: Colors.black,
        elevation: 8,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(1, 0, 1, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                        child: InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                duration: Duration(milliseconds: 40),
                                reverseDuration: Duration(milliseconds: 40),
                                child: NavBarPage(initialPage: 'Profile'),
                              ),
                            );
                          },
                          child: Text(
                            'LoginApp',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Condiment',
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 14.5, 0, 14.5),
                      child: Container(
                        width: double.infinity,
                        height: 1,
                        decoration: BoxDecoration(
                          color: Color(0x55EEEEEE),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
