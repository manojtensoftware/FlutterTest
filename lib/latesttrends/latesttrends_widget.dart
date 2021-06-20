import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_youtube_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LatesttrendsWidget extends StatefulWidget {
  LatesttrendsWidget({Key key}) : super(key: key);

  @override
  _LatesttrendsWidgetState createState() => _LatesttrendsWidgetState();
}

class _LatesttrendsWidgetState extends State<LatesttrendsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: StreamBuilder<List<LatestvideosRecord>>(
          stream: queryLatestvideosRecord(
            queryBuilder: (latestvideosRecord) =>
                latestvideosRecord.orderBy('Creation_date', descending: true),
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            List<LatestvideosRecord> listViewLatestvideosRecordList =
                snapshot.data;
            // Customize what your widget looks like with no query results.
            if (snapshot.data.isEmpty) {
              // return Container();
              // For now, we'll just include some dummy data.
              listViewLatestvideosRecordList =
                  createDummyLatestvideosRecord(count: 4);
            }
            return ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: listViewLatestvideosRecordList.length,
              itemBuilder: (context, listViewIndex) {
                final listViewLatestvideosRecord =
                    listViewLatestvideosRecordList[listViewIndex];
                return Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              listViewLatestvideosRecord.titleName,
                              style: FlutterFlowTheme.subtitle2.override(
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: FlutterFlowYoutubePlayer(
                              url: listViewLatestvideosRecord.path,
                              autoPlay: false,
                              looping: true,
                              mute: false,
                              showControls: true,
                              showFullScreen: true,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
