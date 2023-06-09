import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<MessagesRecord> initialMessages = [];
  void addToInitialMessages(MessagesRecord item) => initialMessages.add(item);
  void removeFromInitialMessages(MessagesRecord item) =>
      initialMessages.remove(item);
  void removeAtIndexFromInitialMessages(int index) =>
      initialMessages.removeAt(index);
  void updateInitialMessagesAtIndex(
          int index, Function(MessagesRecord) updateFn) =>
      initialMessages[index] = updateFn(initialMessages[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in TextField widget.
  ChatsRecord? chatRef;
  // Stores action output result for [Backend Call - Create Document] action in TextField widget.
  MessagesRecord? msg1;
  // Stores action output result for [Backend Call - Create Document] action in TextField widget.
  MessagesRecord? msg2;
  // Stores action output result for [Backend Call - Create Document] action in TextField widget.
  MessagesRecord? msg3;
  // Stores action output result for [Backend Call - Create Document] action in TextField widget.
  MessagesRecord? msg4;
  // Stores action output result for [Backend Call - API (AI Chat)] action in TextField widget.
  ApiCallResponse? gptResponse;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
