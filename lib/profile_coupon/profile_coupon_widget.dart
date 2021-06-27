import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
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
      body: StreamBuilder<List<CouponsRecord>>(
        stream: queryCouponsRecord(
          queryBuilder: (couponsRecord) => couponsRecord
              .where('Likedby', arrayContains: currentUserReference)
              .orderBy('creation_date'),
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
                padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: ListTile(
                    leading: Icon(
                      Icons.shield,
                      color: Color(0xFF119720),
                    ),
                    title: Text(
                      listViewCouponsRecord.couponCategory,
                      style: FlutterFlowTheme.title3.override(
                        fontFamily: 'Poppins',
                      ),
                    ),
                    subtitle: Text(
                      listViewCouponsRecord.couponCode,
                      style: FlutterFlowTheme.subtitle2.override(
                        fontFamily: 'Poppins',
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF303030),
                      size: 20,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    dense: false,
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
