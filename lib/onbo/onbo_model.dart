import '/flutter_flow/flutter_flow_util.dart';
import 'onbo_widget.dart' show OnboWidget;
import 'package:flutter/material.dart';

class OnboModel extends FlutterFlowModel<OnboWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
