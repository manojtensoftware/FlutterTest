import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../edit_profile/edit_profile_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class ProfilepageWidget extends StatefulWidget {
  ProfilepageWidget({Key key}) : super(key: key);

  @override
  _ProfilepageWidgetState createState() => _ProfilepageWidgetState();
}

class _ProfilepageWidgetState extends State<ProfilepageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final profilepageUsersRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          body: Align(
            alignment: Alignment(0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment(0, 0),
                        child: Image.network(
                          'https://picsum.photos/id/115/1500/1000.jpg?blur=4300.jpg?blur=4300?blur=5300',
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 1,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: Alignment(0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Container(
                                width: 90,
                                height: 90,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  profilepageUsersRecord.photoUrl,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Text(
                                profilepageUsersRecord.displayName,
                                style: FlutterFlowTheme.title3.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFFF9F8F8),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Text(
                                profilepageUsersRecord.email,
                                style: FlutterFlowTheme.subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFFF9F8F8),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    'My ACCOUNT',
                    style: FlutterFlowTheme.title3.override(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        duration: Duration(milliseconds: 300),
                        reverseDuration: Duration(milliseconds: 300),
                        child: EditProfileWidget(
                          cid: profilepageUsersRecord,
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.user,
                      color: Color(0xFF0C0101),
                      size: 20,
                    ),
                    title: Text(
                      'Profile',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                      ),
                    ),
                    trailing: FaIcon(
                      FontAwesomeIcons.greaterThan,
                      color: Color(0xE3303030),
                      size: 10,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    dense: false,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                  child: ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.ticketAlt,
                      color: Color(0xFF0C0101),
                      size: 20,
                    ),
                    title: Text(
                      'My Booking',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                      ),
                    ),
                    trailing: FaIcon(
                      FontAwesomeIcons.greaterThan,
                      color: Color(0xE3303030),
                      size: 10,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    dense: false,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                  child: ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.wallet,
                      color: Color(0xFF0C0101),
                      size: 20,
                    ),
                    title: Text(
                      'Wallet',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                      ),
                    ),
                    trailing: FaIcon(
                      FontAwesomeIcons.greaterThan,
                      color: Color(0xE3303030),
                      size: 10,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    dense: false,
                  ),
                ),
                Divider(),
                Text(
                  'Need Help?',
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                  child: ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.phoneAlt,
                      color: Color(0xFF0C0101),
                      size: 20,
                    ),
                    title: Text(
                      'Contact No',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                      ),
                    ),
                    trailing: FaIcon(
                      FontAwesomeIcons.greaterThan,
                      color: Color(0xE3303030),
                      size: 10,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    dense: false,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                  child: ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.key,
                      color: Color(0xFF0C0101),
                      size: 20,
                    ),
                    title: Text(
                      'Password',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                      ),
                    ),
                    trailing: FaIcon(
                      FontAwesomeIcons.greaterThan,
                      color: Color(0xE3303030),
                      size: 10,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    dense: false,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                  child: ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.star,
                      color: Color(0xFF0C0101),
                      size: 20,
                    ),
                    title: Text(
                      'Rate Us',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                      ),
                    ),
                    trailing: FaIcon(
                      FontAwesomeIcons.greaterThan,
                      color: Color(0xE3303030),
                      size: 10,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    dense: false,
                  ),
                ),
                FFButtonWidget(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  text: 'Log Out',
                  options: FFButtonOptions(
                    width: 200,
                    height: 40,
                    color: Color(0xFF0C0101),
                    textStyle: FlutterFlowTheme.subtitle2.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 12,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
