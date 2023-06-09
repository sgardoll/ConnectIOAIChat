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
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'rowOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 260.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 260.ms,
          begin: Offset(0.0, 18.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: true,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 260.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 260.ms,
          begin: Offset(0.0, 18.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 350.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(64.0, 100.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 350.ms,
          begin: 1.0,
          end: 0.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Home'});
    _model.textController ??= TextEditingController();
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF09173A),
                  Color(0xFF732295),
                  Color(0xFFEFABAC)
                ],
                stops: [0.1, 0.5, 1.0],
                begin: AlignmentDirectional(1.0, 0.87),
                end: AlignmentDirectional(-1.0, -0.87),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 50.0),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        constraints: BoxConstraints(
                          maxWidth: 900.0,
                        ),
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 15.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 5.0,
                                                color: Color(0x00FFFFFF),
                                                offset: Offset(1.0, 2.0),
                                              )
                                            ],
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xDA25272D),
                                                Color(0x4231353C)
                                              ],
                                              stops: [0.0, 1.0],
                                              begin: AlignmentDirectional(
                                                  1.0, 0.87),
                                              end: AlignmentDirectional(
                                                  -1.0, -0.87),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color: Color(0x56FFFFFF),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 30.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'How can I help you today?',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0xFFB7BDC7),
                                                                fontSize: 13.0,
                                                              ),
                                                    ),
                                                  ],
                                                ).animateOnPageLoad(animationsMap[
                                                    'rowOnPageLoadAnimation']!),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 20.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  constraints: BoxConstraints(
                                                    maxWidth: 600.0,
                                                  ),
                                                  decoration: BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(15.0, 0.0,
                                                                15.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textController,
                                                        onFieldSubmitted:
                                                            (_) async {
                                                          logFirebaseEvent(
                                                              'HOME_TextField_ovagrpkj_ON_TEXTFIELD_SUB');
                                                          var _shouldSetState =
                                                              false;
                                                          logFirebaseEvent(
                                                              'TextField_backend_call');

                                                          final chatsCreateData =
                                                              createChatsRecordData(
                                                            uid:
                                                                currentUserReference,
                                                            timestamp:
                                                                getCurrentTimestamp,
                                                            title:
                                                                valueOrDefault<
                                                                    String>(
                                                              'Chat Title (${valueOrDefault<String>(
                                                                dateTimeFormat(
                                                                    'M/d h:mm a',
                                                                    getCurrentTimestamp),
                                                                'Chart Title',
                                                              )})',
                                                              'Chat Title',
                                                            ),
                                                          );
                                                          var chatsRecordReference =
                                                              ChatsRecord
                                                                  .collection
                                                                  .doc();
                                                          await chatsRecordReference
                                                              .set(
                                                                  chatsCreateData);
                                                          _model.chatRef = ChatsRecord
                                                              .getDocumentFromData(
                                                                  chatsCreateData,
                                                                  chatsRecordReference);
                                                          _shouldSetState =
                                                              true;
                                                          logFirebaseEvent(
                                                              'TextField_update_app_state');
                                                          FFAppState()
                                                              .update(() {
                                                            FFAppState()
                                                                    .awaitingReply =
                                                                true;
                                                            FFAppState()
                                                                    .prompt =
                                                                _model
                                                                    .textController
                                                                    .text;
                                                          });
                                                          logFirebaseEvent(
                                                              'TextField_widget_animation');
                                                          if (animationsMap[
                                                                  'containerOnActionTriggerAnimation'] !=
                                                              null) {
                                                            await animationsMap[
                                                                    'containerOnActionTriggerAnimation']!
                                                                .controller
                                                                .forward(
                                                                    from: 0.0);
                                                          }
                                                          logFirebaseEvent(
                                                              'TextField_backend_call');

                                                          final messagesCreateData1 =
                                                              createMessagesRecordData(
                                                            timestamp:
                                                                getCurrentTimestamp,
                                                            firstMessage: false,
                                                            message: FFAppState()
                                                                .systemMessage,
                                                            user: 'system',
                                                            uid:
                                                                currentUserReference,
                                                          );
                                                          var messagesRecordReference1 =
                                                              MessagesRecord
                                                                  .createDoc(_model
                                                                      .chatRef!
                                                                      .reference);
                                                          await messagesRecordReference1
                                                              .set(
                                                                  messagesCreateData1);
                                                          _model.msg1 = MessagesRecord
                                                              .getDocumentFromData(
                                                                  messagesCreateData1,
                                                                  messagesRecordReference1);
                                                          _shouldSetState =
                                                              true;
                                                          logFirebaseEvent(
                                                              'TextField_update_widget_state');
                                                          setState(() {
                                                            _model
                                                                .addToInitialMessages(
                                                                    _model
                                                                        .msg1!);
                                                          });
                                                          logFirebaseEvent(
                                                              'TextField_backend_call');

                                                          final messagesCreateData2 =
                                                              createMessagesRecordData(
                                                            timestamp:
                                                                getCurrentTimestamp,
                                                            firstMessage: true,
                                                            message: FFAppState()
                                                                .userReinforcement,
                                                            user: 'user',
                                                            uid:
                                                                currentUserReference,
                                                          );
                                                          var messagesRecordReference2 =
                                                              MessagesRecord
                                                                  .createDoc(_model
                                                                      .chatRef!
                                                                      .reference);
                                                          await messagesRecordReference2
                                                              .set(
                                                                  messagesCreateData2);
                                                          _model.msg2 = MessagesRecord
                                                              .getDocumentFromData(
                                                                  messagesCreateData2,
                                                                  messagesRecordReference2);
                                                          _shouldSetState =
                                                              true;
                                                          logFirebaseEvent(
                                                              'TextField_update_widget_state');
                                                          setState(() {
                                                            _model
                                                                .addToInitialMessages(
                                                                    _model
                                                                        .msg2!);
                                                          });
                                                          logFirebaseEvent(
                                                              'TextField_backend_call');

                                                          final messagesCreateData3 =
                                                              createMessagesRecordData(
                                                            timestamp:
                                                                getCurrentTimestamp,
                                                            firstMessage: false,
                                                            message:
                                                                FFAppState()
                                                                    .gptOpener,
                                                            user: 'gpt',
                                                            uid:
                                                                currentUserReference,
                                                          );
                                                          var messagesRecordReference3 =
                                                              MessagesRecord
                                                                  .createDoc(_model
                                                                      .chatRef!
                                                                      .reference);
                                                          await messagesRecordReference3
                                                              .set(
                                                                  messagesCreateData3);
                                                          _model.msg3 = MessagesRecord
                                                              .getDocumentFromData(
                                                                  messagesCreateData3,
                                                                  messagesRecordReference3);
                                                          _shouldSetState =
                                                              true;
                                                          logFirebaseEvent(
                                                              'TextField_update_widget_state');
                                                          setState(() {
                                                            _model
                                                                .addToInitialMessages(
                                                                    _model
                                                                        .msg3!);
                                                          });
                                                          logFirebaseEvent(
                                                              'TextField_backend_call');

                                                          final messagesCreateData4 =
                                                              createMessagesRecordData(
                                                            timestamp:
                                                                getCurrentTimestamp,
                                                            firstMessage: false,
                                                            message: _model
                                                                .textController
                                                                .text,
                                                            user: 'user',
                                                            uid:
                                                                currentUserReference,
                                                          );
                                                          var messagesRecordReference4 =
                                                              MessagesRecord
                                                                  .createDoc(_model
                                                                      .chatRef!
                                                                      .reference);
                                                          await messagesRecordReference4
                                                              .set(
                                                                  messagesCreateData4);
                                                          _model.msg4 = MessagesRecord
                                                              .getDocumentFromData(
                                                                  messagesCreateData4,
                                                                  messagesRecordReference4);
                                                          _shouldSetState =
                                                              true;
                                                          logFirebaseEvent(
                                                              'TextField_update_widget_state');
                                                          setState(() {
                                                            _model
                                                                .addToInitialMessages(
                                                                    _model
                                                                        .msg4!);
                                                          });
                                                          logFirebaseEvent(
                                                              'TextField_clear_text_fields');
                                                          setState(() {
                                                            _model
                                                                .textController
                                                                ?.clear();
                                                          });
                                                          logFirebaseEvent(
                                                              'TextField_navigate_to');

                                                          context.goNamed(
                                                            'Chat',
                                                            queryParameters: {
                                                              'chatRef':
                                                                  serializeParam(
                                                                _model.chatRef!
                                                                    .reference,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              kTransitionInfoKey:
                                                                  TransitionInfo(
                                                                hasTransition:
                                                                    true,
                                                                transitionType:
                                                                    PageTransitionType
                                                                        .fade,
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        0),
                                                              ),
                                                            },
                                                          );

                                                          logFirebaseEvent(
                                                              'TextField_backend_call');
                                                          _model.gptResponse =
                                                              await AIChatCall
                                                                  .call(
                                                            messages: functions
                                                                .generateMessages(
                                                                    _model
                                                                        .initialMessages
                                                                        .toList(),
                                                                    FFAppState()
                                                                        .prompt)
                                                                .toString(),
                                                          );
                                                          _shouldSetState =
                                                              true;
                                                          if ((_model
                                                                  .gptResponse
                                                                  ?.succeeded ??
                                                              true)) {
                                                            logFirebaseEvent(
                                                                'TextField_backend_call');

                                                            final messagesCreateData5 =
                                                                createMessagesRecordData(
                                                              timestamp:
                                                                  getCurrentTimestamp,
                                                              firstMessage:
                                                                  false,
                                                              message: AIChatCall
                                                                  .messageContent(
                                                                (_model.gptResponse
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ).toString().trim(),
                                                              user: 'gpt',
                                                              uid:
                                                                  currentUserReference,
                                                            );
                                                            await MessagesRecord
                                                                    .createDoc(_model
                                                                        .chatRef!
                                                                        .reference)
                                                                .set(
                                                                    messagesCreateData5);
                                                            logFirebaseEvent(
                                                                'TextField_update_app_state');
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState()
                                                                      .awaitingReply =
                                                                  false;
                                                            });
                                                            logFirebaseEvent(
                                                                'TextField_widget_animation');
                                                            if (animationsMap[
                                                                    'containerOnActionTriggerAnimation'] !=
                                                                null) {
                                                              await animationsMap[
                                                                      'containerOnActionTriggerAnimation']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0);
                                                            }
                                                            if (_shouldSetState)
                                                              setState(() {});
                                                            return;
                                                          } else {
                                                            logFirebaseEvent(
                                                                'TextField_show_snack_bar');
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .clearSnackBars();
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Oops, looks like that didn\'t go through. Let\'s try again!',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        3000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                            logFirebaseEvent(
                                                                'TextField_update_app_state');
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState()
                                                                      .awaitingReply =
                                                                  false;
                                                            });
                                                            if (_shouldSetState)
                                                              setState(() {});
                                                            return;
                                                          }

                                                          if (_shouldSetState)
                                                            setState(() {});
                                                        },
                                                        autofocus: true,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          isDense: true,
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: Color(
                                                                        0xFFA5AAB4),
                                                                    fontSize:
                                                                        11.0,
                                                                  ),
                                                          hintText:
                                                              'Ask me anything...',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: Color(
                                                                        0xFFA5AAB4),
                                                                    fontSize:
                                                                        11.0,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              width: 0.2,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 0.2,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 0.2,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 0.2,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          filled: true,
                                                          fillColor:
                                                              Color(0x0FFFFFFF),
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      15.0,
                                                                      20.0,
                                                                      15.0),
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: Color(
                                                                  0xFFA5AAB4),
                                                              fontSize: 11.0,
                                                            ),
                                                        keyboardType:
                                                            TextInputType
                                                                .emailAddress,
                                                        validator: _model
                                                            .textControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                                    .animateOnPageLoad(
                                                        animationsMap[
                                                            'containerOnPageLoadAnimation']!)
                                                    .animateOnActionTrigger(
                                                      animationsMap[
                                                          'containerOnActionTriggerAnimation']!,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
