import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CouponPageWidget extends StatefulWidget {
  CouponPageWidget({Key key}) : super(key: key);

  @override
  _CouponPageWidgetState createState() => _CouponPageWidgetState();
}

class _CouponPageWidgetState extends State<CouponPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: StreamBuilder<List<CouponsRecord>>(
        stream: queryCouponsRecord(
          queryBuilder: (couponsRecord) =>
              couponsRecord.orderBy('creation_date', descending: true),
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          List<CouponsRecord> listViewCouponsRecordList = snapshot.data;
          // Customize what your widget looks like with no query results.
          if (snapshot.data.isEmpty) {
            // return Container();
            // For now, we'll just include some dummy data.
            listViewCouponsRecordList = createDummyCouponsRecord(count: 4);
          }
          return ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            itemCount: listViewCouponsRecordList.length,
            itemBuilder: (context, listViewIndex) {
              final listViewCouponsRecord =
                  listViewCouponsRecordList[listViewIndex];
              return Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Color(0xFFF5F5F5),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment(0, 0),
                        child: Image.network(
                          listViewCouponsRecord.imagePath,
                          width: MediaQuery.of(context).size.width,
                          height: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: Alignment(-5.17, 0.96),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 200, 10, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(4.5, 0.82),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 180, 10, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 150,
                                height: 56,
                                decoration: BoxDecoration(
                                  color: Color(0xFF0C0101),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    width: 1,
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                      child: Text(
                                        'CODE',
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFFF9F8F8),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                      child: Text(
                                        listViewCouponsRecord.couponCode,
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFFF9F8F8),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment(0.9, 0),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF0C0101),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Align(
                                      alignment: Alignment(0, 0),
                                      child: ToggleIcon(
                                        onPressed: () async {
                                          final likedbyElement =
                                              currentUserReference;
                                          final likedbyUpdate =
                                              listViewCouponsRecord.likedby
                                                      .contains(likedbyElement)
                                                  ? FieldValue.arrayRemove(
                                                      [likedbyElement])
                                                  : FieldValue.arrayUnion(
                                                      [likedbyElement]);
                                          final couponsRecordData = {
                                            'Likedby': likedbyUpdate,
                                          };

                                          await listViewCouponsRecord.reference
                                              .update(couponsRecordData);
                                        },
                                        value: listViewCouponsRecord.likedby
                                            .contains(currentUserReference),
                                        onIcon: Icon(
                                          Icons.favorite_outlined,
                                          color: Color(0xFFE62F66),
                                          size: 25,
                                        ),
                                        offIcon: Icon(
                                          Icons.favorite_outlined,
                                          color: Color(0xFFF9F8F8),
                                          size: 25,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
