import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
                            children: [
                              InkWell(
                                onTap: () async {
                                  final usersRecordData = {
                                    'coupon_apply': FieldValue.arrayUnion(
                                        [listViewCouponsRecord.reference]),
                                  };

                                  await currentUserReference
                                      .update(usersRecordData);
                                },
                                child: Text(
                                  'Click to Apply',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFFF9F8F8),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(0, 0),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 160, 10, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Code:',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFFF9F8F8),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Text(
                                  listViewCouponsRecord.couponCode,
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFFF9F8F8),
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
