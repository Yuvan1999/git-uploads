import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

class OptionselectWidget extends StatefulWidget {
  const OptionselectWidget({Key? key}) : super(key: key);

  @override
  _OptionselectWidgetState createState() => _OptionselectWidgetState();
}

class _OptionselectWidgetState extends State<OptionselectWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'buttonOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'buttonOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 500.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 500.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
  };
  AudioPlayer? soundPlayer;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      soundPlayer ??= AudioPlayer();
      if (soundPlayer!.playing) {
        await soundPlayer!.stop();
      }
      soundPlayer!.setVolume(1);
      await soundPlayer!
          .setAsset('assets/audios/WhatsApp_Ptt_2022-09-20_at_4.24.32_PM.ogg')
          .then((_) => soundPlayer!.play());
    });

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Color(0xFF40708B),
          automaticallyImplyLeading: false,
          actions: [],
          flexibleSpace: FlexibleSpaceBar(
            title: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 14),
              child: InkWell(
                onTap: () async {
                  context.pop();
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(290, 7, 0, 0),
                            child: InkWell(
                              onDoubleTap: () async {
                                GoRouter.of(context).prepareAuthEvent();
                                await signOut();

                                context.goNamedAuth('login', mounted);
                              },
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 50,
                                icon: Icon(
                                  Icons.logout,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  size: 30,
                                ),
                                onPressed: () async {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Logout'),
                                        content: Text('Double tap to logout'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            centerTitle: true,
            expandedTitleScale: 1.0,
          ),
          elevation: 10,
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 700,
                    height: 500,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).lineColor,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 30, 0, 20),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed(
                          'yyyy',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.scale,
                              alignment: Alignment.bottomCenter,
                              duration: Duration(milliseconds: 880),
                            ),
                          },
                        );
                      },
                      text: 'MY TASKS',
                      options: FFButtonOptions(
                        width: 310,
                        height: 75,
                        color: Color(0xFF153871),
                        textStyle: FlutterFlowTheme.of(context).title1.override(
                              fontFamily: 'Poppins',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                            ),
                        elevation: 33,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['buttonOnPageLoadAnimation1']!),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 12, 0, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed('forgotpasswordCopy');
                      },
                      text: 'POSTAL SEARCH',
                      options: FFButtonOptions(
                        width: 310,
                        height: 75,
                        color: Color(0xFF153871),
                        textStyle: FlutterFlowTheme.of(context).title1.override(
                              fontFamily: 'Poppins',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              fontWeight: FontWeight.w600,
                            ),
                        elevation: 18,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['buttonOnPageLoadAnimation2']!),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
