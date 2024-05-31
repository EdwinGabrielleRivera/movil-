import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'googlemaps_model.dart';
export 'googlemaps_model.dart';

class GooglemapsWidget extends StatefulWidget {
  const GooglemapsWidget({
    super.key,
    this.local,
  });

  final List<LatLng>? local;

  @override
  State<GooglemapsWidget> createState() => _GooglemapsWidgetState();
}

class _GooglemapsWidgetState extends State<GooglemapsWidget> {
  late GooglemapsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GooglemapsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'vista mapa de guanajuato ',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed('Dashboard');
              },
              child: Icon(
                Icons.keyboard_return_rounded,
                color: FlutterFlowTheme.of(context).secondary,
                size: 24.0,
              ),
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(12.0, 20.0, 12.0, 20.0),
                  child: StreamBuilder<List<LocalidadesRecord>>(
                    stream: queryLocalidadesRecord(
                      queryBuilder: (localidadesRecord) =>
                          localidadesRecord.orderBy('ciudad'),
                      singleRecord: true,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<LocalidadesRecord> googleMapLocalidadesRecordList =
                          snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final googleMapLocalidadesRecord =
                          googleMapLocalidadesRecordList.isNotEmpty
                              ? googleMapLocalidadesRecordList.first
                              : null;
                      return FlutterFlowGoogleMap(
                        controller: _model.googleMapsController,
                        onCameraIdle: (latLng) =>
                            _model.googleMapsCenter = latLng,
                        initialLocation: _model.googleMapsCenter ??=
                            const LatLng(21.0187971, -101.2578347),
                        markers: (widget.local?.take(5).toList() ?? [])
                            .map(
                              (marker) => FlutterFlowMarker(
                                marker.serialize(),
                                marker,
                              ),
                            )
                            .toList(),
                        markerColor: GoogleMarkerColor.azure,
                        mapType: MapType.normal,
                        style: GoogleMapStyle.night,
                        initialZoom: 14.0,
                        allowInteraction: true,
                        allowZoom: true,
                        showZoomControls: true,
                        showLocation: true,
                        showCompass: false,
                        showMapToolbar: false,
                        showTraffic: false,
                        centerMapOnMarkerTap: true,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
