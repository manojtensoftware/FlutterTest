import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_drop_down_template.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileWidget extends StatefulWidget {
  EditProfileWidget({
    Key key,
    this.cid,
  }) : super(key: key);

  final UsersRecord cid;

  @override
  _EditProfileWidgetState createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  String cmadayValue;
  String cmamonthValue;
  String cmbbmonthValue;
  String cmbdayValue;
  String uploadedFileUrl;
  TextEditingController txtemailController;
  TextEditingController txtnameController;
  TextEditingController txtphoneController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    cmadayValue = 'Day';
    cmamonthValue = 'Month';
    cmbbmonthValue = 'Month';
    cmbdayValue = 'Day';
    txtemailController = TextEditingController(text: widget.cid.email);
    txtnameController = TextEditingController(text: widget.cid.displayName);
    txtphoneController = TextEditingController(text: widget.cid.phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
            onPressed: () async {
              final email = txtemailController.text;
              final displayName = txtnameController.text;
              final photoUrl = uploadedFileUrl;
              final createdTime = getCurrentTimestamp;
              final phoneNumber = txtphoneController.text;
              final dobDay = cmbdayValue;
              final dobMonth = cmbbmonthValue;
              final doaDay = cmadayValue;
              final doaMonth = cmamonthValue;

              final usersRecordData = createUsersRecordData(
                email: email,
                displayName: displayName,
                photoUrl: photoUrl,
                createdTime: createdTime,
                phoneNumber: phoneNumber,
                dobDay: dobDay,
                dobMonth: dobMonth,
                doaDay: doaDay,
                doaMonth: doaMonth,
              );

              await widget.cid.reference.update(usersRecordData);
              Navigator.pop(context);
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
            Align(
              alignment: Alignment(0, 0),
              child: Container(
                width: 500,
                height: 100,
                child: Stack(
                  alignment: Alignment(0, 0),
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
                            showUploadMessage(
                                context, 'Failed to upload media');
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
                          widget.cid.photoUrl,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, 0),
                      child: Icon(
                        Icons.camera_alt,
                        color: Color(0x6D000000),
                        size: 36,
                      ),
                    )
                  ],
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(
                      'DOB',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
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
                          setState(() => cmbdayValue = value);
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
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 8, 0),
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
                          setState(() => cmbbmonthValue = value);
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
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(
                      'DOA',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
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
                          setState(() => cmadayValue = value);
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
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 8, 0),
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
                          setState(() => cmamonthValue = value);
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
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
