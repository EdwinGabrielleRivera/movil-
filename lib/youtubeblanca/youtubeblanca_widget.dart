import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import 'package:flutter/material.dart';
import 'youtubeblanca_model.dart';
export 'youtubeblanca_model.dart';

class YoutubeblancaWidget extends StatefulWidget {
  const YoutubeblancaWidget({super.key});

  @override
  State<YoutubeblancaWidget> createState() => _YoutubeblancaWidgetState();
}

class _YoutubeblancaWidgetState extends State<YoutubeblancaWidget> {
  late YoutubeblancaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => YoutubeblancaModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubeFullScreenWrapper(
      child: GestureDetector(
        onTap: () => _model.unfocusNode.canRequestFocus
            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
            : FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: const Color(0x71596BFF),
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: false,
            title: Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Text(
                'youtube ',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            actions: const [],
            centerTitle: false,
            elevation: 2.0,
          ),
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const FlutterFlowYoutubePlayer(
                  url: 'https://www.youtube.com/watch?v=XBWjp8HIy3g',
                  autoPlay: false,
                  looping: true,
                  mute: false,
                  showControls: true,
                  showFullScreen: true,
                  strictRelatedVideos: false,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 200.0, 0.0, 0.0),
                  child: Container(
                    width: 120.0,
                    height: 120.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      'https://imgv3.fotor.com/images/share/fotor-ai-generate-a-lifelike-dragon.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('blanca_dashboard');
                      },
                      child: Icon(
                        Icons.restart_alt,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
