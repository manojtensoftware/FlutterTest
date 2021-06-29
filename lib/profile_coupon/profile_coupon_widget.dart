import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileCouponWidget extends StatefulWidget {
  ProfileCouponWidget({Key key}) : super(key: key);

  @override
  _ProfileCouponWidgetState createState() => _ProfileCouponWidgetState();
}

class _ProfileCouponWidgetState extends State<ProfileCouponWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Column(
          children: [
            TabBar(
              labelColor: FlutterFlowTheme.primaryColor,
              indicatorColor: FlutterFlowTheme.secondaryColor,
              tabs: [
                Tab(
                  text: 'Privilage',
                  icon: FaIcon(
                    FontAwesomeIcons.sketch,
                  ),
                ),
                Tab(
                  text: 'Standard',
                  icon: Icon(
                    Icons.favorite,
                    color: Color(0xFFE62F66),
                  ),
                )
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  StreamBuilder<List<SpecialCouponRecord>>(
                    stream: querySpecialCouponRecord(
                      queryBuilder: (specialCouponRecord) => specialCouponRecord
                          .where('expiry_date',
                              isGreaterThan: getCurrentTimestamp)
                          .orderBy('expiry_date'),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      List<SpecialCouponRecord>
                          listViewSpecialCouponRecordList = snapshot.data;
                      // Customize what your widget looks like with no query results.
                      if (snapshot.data.isEmpty) {
                        return Container(
                          height: 100,
                          child: Center(
                            child: Text('No results.'),
                          ),
                        );
                      }
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewSpecialCouponRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewSpecialCouponRecord =
                              listViewSpecialCouponRecordList[listViewIndex];
                          return Padding(
                            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Color(0xFF64B5F6),
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 500,
                                    height: 200,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment(0, 0),
                                          child: Image.network(
                                            'https://firebasestorage.googleapis.com/v0/b/fireonflutter-b2fde.appspot.com/o/appimages%2FBackground%2Fpremiumoffer.jpg?alt=media&token=50adea2e-adb3-480e-a2c3-ce5af351e955',
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                1,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment(0, -0.76),
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 0, 10, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Coupon Code:',
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    color: Color(0xFFF9F8F8),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      10, 0, 0, 0),
                                                  child: Text(
                                                    listViewSpecialCouponRecord
                                                        .couponCode,
                                                    style: FlutterFlowTheme
                                                        .bodyText1
                                                        .override(
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
                                          alignment: Alignment(14.61, -0.06),
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 10, 10, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Discount of  ${listViewSpecialCouponRecord.couponPercent.toString()}% On Next Visit at Salon T&C Apply',
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    color: Color(0xFFF9F8F8),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment(0.06, -0.46),
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 10, 10, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Discount of Rs. ${listViewSpecialCouponRecord.couponValue.toString()}On Next Visit at Salon ',
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    color: Color(0xFFF9F8F8),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment(0, 0),
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 100, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'Expiry Date:',
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    color: Color(0xFFF9F8F8),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      10, 0, 0, 0),
                                                  child: Text(
                                                    dateTimeFormat(
                                                        'yMMMd',
                                                        listViewSpecialCouponRecord
                                                            .expiryDate),
                                                    style: FlutterFlowTheme
                                                        .bodyText1
                                                        .override(
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
                                            padding: EdgeInsets.fromLTRB(
                                                10, 160, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  '# Term & Condition apply',
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    color: Color(0xFFF9F8F8),
                                                    fontWeight: FontWeight.w200,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
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
                  StreamBuilder<List<CouponsRecord>>(
                    stream: queryCouponsRecord(
                      queryBuilder: (couponsRecord) => couponsRecord.where(
                          'Likedby',
                          arrayContains: currentUserReference),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      List<CouponsRecord> listViewCouponsRecordList =
                          snapshot.data;
                      // Customize what your widget looks like with no query results.
                      if (snapshot.data.isEmpty) {
                        return Container(
                          height: 100,
                          child: Center(
                            child: Text('No results.'),
                          ),
                        );
                      }
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewCouponsRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewCouponsRecord =
                              listViewCouponsRecordList[listViewIndex];
                          return ListView(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: Color(0xFFF5F5F5),
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 250,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment(0, 0),
                                          child: Image.network(
                                            listViewCouponsRecord.imagePath,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 250,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment(-5.06, 0.61),
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 0, 10, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Material(
                                                  color: Colors.transparent,
                                                  elevation: 4,
                                                  child: Container(
                                                    width: 100,
                                                    height: 80,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF0C0101),
                                                      border: Border.all(
                                                        width: 2,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 10, 0, 0),
                                                          child: Text(
                                                            'Code',
                                                            style:
                                                                FlutterFlowTheme
                                                                    .bodyText1
                                                                    .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: Color(
                                                                  0xFFF9F8F8),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 10, 0, 0),
                                                          child: Text(
                                                            listViewCouponsRecord
                                                                .couponCode,
                                                            style:
                                                                FlutterFlowTheme
                                                                    .bodyText1
                                                                    .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: Color(
                                                                  0xFF1BE1E4),
                                                              fontSize: 12,
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
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
