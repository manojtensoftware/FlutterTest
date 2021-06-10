import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_drop_down_template.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/upload_media.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileWidget extends StatefulWidget {
  EditProfileWidget({Key key}) : super(key: key);

  @override
  _EditProfileWidgetState createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  String dropDownValue1;
  String dropDownValue2;
  String uploadedFileUrl;
  TextEditingController txtemailController;
  TextEditingController txtnameController;
  TextEditingController txtphoneController;
  TextEditingController txtdateController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    dropDownValue1 = 'Day';
    dropDownValue2 = 'Month';
    txtemailController = TextEditingController();
    txtnameController = TextEditingController();
    txtphoneController = TextEditingController();
    txtdateController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final editProfileUsersRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.primaryColor,
            automaticallyImplyLeading: true,
            actions: [
              IconButton(
                onPressed: () {
                  print('Saveicon pressed ...');
                },
                icon: Icon(
                  Icons.done,
                  color: Colors.black,
                  size: 30,
                ),
                iconSize: 30,
              )
            ],
            centerTitle: true,
            elevation: 4,
          ),
          body: Align(
            alignment: Alignment(0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  onDoubleTap: () async {
                    final selectedMedia = await selectMedia();
                    if (selectedMedia != null &&
                        validateFileFormat(
                            selectedMedia.storagePath, context)) {
                      showUploadMessage(context, 'Uploading file...',
                          showLoading: true);
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
                  },
                  child: Container(
                    width: 120,
                    height: 120,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      currentUserPhoto,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  child: TextFormField(
                    controller: txtemailController,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'E-Mail ID',
                      hintStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF84A9E0),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF84A9E0),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    ),
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  child: TextFormField(
                    controller: txtnameController,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Display Name',
                      hintStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF84A9E0),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF84A9E0),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    ),
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  child: TextFormField(
                    controller: txtphoneController,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Phone No',
                      hintStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF84A9E0),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF84A9E0),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    ),
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: FaIcon(
                          FontAwesomeIcons.birthdayCake,
                          color: Color(0xFFDD4A4A),
                          size: 24,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: FlutterFlowDropDown(
                          options: [
                            'Day',
                            '1',
                            '2',
                            '3',
                            '4',
                            '5',
                            '6',
                            '7',
                            '8',
                            '9',
                            '10',
                            '11',
                            '12',
                            '13',
                            '14',
                            '15',
                            '16',
                            '17',
                            '18',
                            '19',
                            '20',
                            '21',
                            '22',
                            '23',
                            '24',
                            '25',
                            '26',
                            '27',
                            '28',
                            '29',
                            '30',
                            '31'
                          ],
                          onChanged: (value) {
                            setState(() => dropDownValue1 = value);
                          },
                          width: 130,
                          height: 40,
                          textStyle: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                          ),
                          fillColor: Color(0xFFF9F8F8),
                          elevation: 2,
                          borderColor: Color(0xFF84A9E0),
                          borderWidth: 1,
                          borderRadius: 4,
                          margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 80, 0),
                        child: FlutterFlowDropDown(
                          options: [
                            'Month',
                            '1',
                            '2',
                            '3',
                            '4',
                            '5',
                            '6',
                            '7',
                            '8',
                            '9',
                            '10',
                            '11',
                            '12'
                          ],
                          onChanged: (value) {
                            setState(() => dropDownValue2 = value);
                          },
                          width: 130,
                          height: 40,
                          textStyle: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                          ),
                          fillColor: Color(0xFFF9F8F8),
                          elevation: 2,
                          borderColor: Color(0xFF84A9E0),
                          borderWidth: 1,
                          borderRadius: 4,
                          margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  child: TextFormField(
                    onChanged: (_) => setState(() {}),
                    controller: txtdateController,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'DOB',
                      hintStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF84A9E0),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF84A9E0),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      prefixIcon: Icon(
                        Icons.date_range,
                      ),
                      suffixIcon: txtdateController.text.isNotEmpty
                          ? InkWell(
                              onTap: () => setState(
                                () => txtdateController.clear(),
                              ),
                              child: Icon(
                                Icons.clear,
                                size: 22,
                              ),
                            )
                          : null,
                    ),
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                    ),
                    keyboardType: TextInputType.datetime,
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
