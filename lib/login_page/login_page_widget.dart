import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../reset_password/reset_password_widget.dart';
import '../signup/signup_widget.dart';
import '../smsverify/smsverify_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class LoginPageWidget extends StatefulWidget {
  LoginPageWidget({Key key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  TextEditingController passWordController;
  bool passwordVisibility;
  TextEditingController userNameController;
  TextEditingController phoneController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    passWordController = TextEditingController();
    passwordVisibility = false;
    userNameController = TextEditingController();
    phoneController = TextEditingController(text: '+91');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: Stack(
            children: [
              Align(
                alignment: Alignment(0, 0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment(0, 0),
                            child: FaIcon(
                              FontAwesomeIcons.user,
                              color: Colors.black,
                              size: 24,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Text(
                              'Login',
                              style: FlutterFlowTheme.title3.override(
                                fontFamily: 'Poppins',
                              ),
                            ),
                          )
                        ],
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              width: 1,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Container(
                                  width: 300,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                                    child: TextFormField(
                                      controller: phoneController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        hintText: 'Phone No',
                                        hintStyle:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Poppins',
                                          fontSize: 14,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF0C0101),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(4),
                                            bottomRight: Radius.circular(4),
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF0C0101),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(4),
                                            bottomRight: Radius.circular(4),
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.phone,
                                        ),
                                      ),
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                      ),
                                      keyboardType: TextInputType.phone,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                  ),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      if (phoneController.text.isEmpty ||
                                          !phoneController.text
                                              .startsWith('+')) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'Phone Number is required and has to start with +.'),
                                          ),
                                        );
                                        return;
                                      }
                                      await beginPhoneAuth(
                                        context: context,
                                        phoneNumber: phoneController.text,
                                        onCodeSent: () async {
                                          await Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SmsverifyWidget(),
                                            ),
                                            (r) => false,
                                          );
                                        },
                                      );
                                    },
                                    text: 'Sign-in',
                                    options: FFButtonOptions(
                                      width: 300,
                                      height: 50,
                                      color: FlutterFlowTheme.primaryColor,
                                      textStyle:
                                          FlutterFlowTheme.subtitle2.override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: 12,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'OR',
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Color(0xFF0C0101),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Container(
                            height: 300,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                width: 1,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Container(
                                    width: 300,
                                    height: 55,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEEEEEE),
                                    ),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 5, 10, 0),
                                      child: TextFormField(
                                        controller: userNameController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          hintText: 'E-mail',
                                          hintStyle: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Poppins',
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF0C0101),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(4),
                                              bottomRight: Radius.circular(4),
                                              topLeft: Radius.circular(4),
                                              topRight: Radius.circular(4),
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF0C0101),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(4),
                                              bottomRight: Radius.circular(4),
                                              topLeft: Radius.circular(4),
                                              topRight: Radius.circular(4),
                                            ),
                                          ),
                                          contentPadding:
                                              EdgeInsets.fromLTRB(0, 0, 0, 5),
                                          prefixIcon: Icon(
                                            Icons.email,
                                          ),
                                        ),
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Container(
                                    width: 300,
                                    height: 55,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEEEEEE),
                                    ),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      child: TextFormField(
                                        controller: passWordController,
                                        obscureText: !passwordVisibility,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          hintText: 'Password',
                                          hintStyle: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Poppins',
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF0C0101),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(4),
                                              bottomRight: Radius.circular(4),
                                              topLeft: Radius.circular(4),
                                              topRight: Radius.circular(4),
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF0C0101),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(4),
                                              bottomRight: Radius.circular(4),
                                              topLeft: Radius.circular(4),
                                              topRight: Radius.circular(4),
                                            ),
                                          ),
                                          contentPadding:
                                              EdgeInsets.fromLTRB(10, 0, 0, 5),
                                          suffixIcon: InkWell(
                                            onTap: () => setState(
                                              () => passwordVisibility =
                                                  !passwordVisibility,
                                            ),
                                            child: Icon(
                                              passwordVisibility
                                                  ? Icons.visibility_outlined
                                                  : Icons
                                                      .visibility_off_outlined,
                                              size: 22,
                                            ),
                                          ),
                                        ),
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                                  child: Container(
                                    width: 300,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEEEEEE),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          final user = await signInWithEmail(
                                            context,
                                            userNameController.text,
                                            passWordController.text,
                                          );
                                          if (user == null) {
                                            return;
                                          }

                                          await Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => NavBarPage(
                                                  initialPage: 'HomePage'),
                                            ),
                                            (r) => false,
                                          );
                                        },
                                        text: 'Login',
                                        options: FFButtonOptions(
                                          width: 130,
                                          height: 40,
                                          color: FlutterFlowTheme.primaryColor,
                                          textStyle: FlutterFlowTheme.subtitle2
                                              .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                          ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  child: Container(
                                    width: 300,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEEEEEE),
                                    ),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type:
                                                PageTransitionType.rightToLeft,
                                            duration:
                                                Duration(milliseconds: 300),
                                            reverseDuration:
                                                Duration(milliseconds: 300),
                                            child: SignupWidget(),
                                          ),
                                        );
                                      },
                                      text: 'Signup',
                                      options: FFButtonOptions(
                                        width: 130,
                                        height: 40,
                                        color: Color(0xFF0C0101),
                                        textStyle:
                                            FlutterFlowTheme.subtitle2.override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: 12,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Container(
                                      width: 300,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEEEEEE),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Forget Password ?',
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              await Navigator.push(
                                                context,
                                                PageTransition(
                                                  type: PageTransitionType
                                                      .rightToLeft,
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  reverseDuration: Duration(
                                                      milliseconds: 300),
                                                  child: ResetPasswordWidget(),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              'Click Here',
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFF119720),
                                                fontSize: 13,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
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
      ),
    );
  }
}
