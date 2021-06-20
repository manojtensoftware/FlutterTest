import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StorepageWidget extends StatefulWidget {
  StorepageWidget({Key key}) : super(key: key);

  @override
  _StorepageWidgetState createState() => _StorepageWidgetState();
}

class _StorepageWidgetState extends State<StorepageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
    );
  }
}
