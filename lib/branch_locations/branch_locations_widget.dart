import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_static_map.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/lat_lng.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapbox_search/mapbox_search.dart';

class BranchLocationsWidget extends StatefulWidget {
  BranchLocationsWidget({
    Key key,
    this.branch,
  }) : super(key: key);

  final BranchRecord branch;

  @override
  _BranchLocationsWidgetState createState() => _BranchLocationsWidgetState();
}

class _BranchLocationsWidgetState extends State<BranchLocationsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment(0, 0),
              child: FlutterFlowStaticMap(
                location: LatLng(23.8247, 86.48126),
                apiKey:
                    'pk.eyJ1IjoidGVuc29mdHdhcmUiLCJhIjoiY2txMW9xMTBjMGdueTJ2bzR4YjdraWMzbSJ9.mGIUaPOZJhYpNeEtufbiYQ',
                style: MapBoxStyle.Streets,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1,
                fit: BoxFit.cover,
                borderRadius: BorderRadius.circular(0),
                markerColor: Color(0xFF84A9E0),
                zoom: 12,
                tilt: 0,
                rotation: 0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
