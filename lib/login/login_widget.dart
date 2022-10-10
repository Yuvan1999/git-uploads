import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 200.ms),
        FadeEffect(
          curve: Curves.easeIn,
          delay: 200.ms,
          duration: 1240.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 400.ms),
        FadeEffect(
          curve: Curves.easeIn,
          delay: 400.ms,
          duration: 1340.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'tabBarOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 90.ms),
        FadeEffect(
          curve: Curves.linear,
          delay: 90.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
  };
  TextEditingController? emailAddressController;
  TextEditingController? passwordController;

  late bool passwordVisibility;
  TextEditingController? passwordConfirmController;

  late bool passwordConfirmVisibility;
  TextEditingController? emailAddressLoginController;
  TextEditingController? passwordLoginController;

  late bool passwordLoginVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    emailAddressController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
    passwordConfirmController = TextEditingController();
    passwordConfirmVisibility = false;
    emailAddressLoginController = TextEditingController();
    passwordLoginController = TextEditingController();
    passwordLoginVisibility = false;
  }

  @override
  void dispose() {
    emailAddressController?.dispose();
    passwordController?.dispose();
    passwordConfirmController?.dispose();
    emailAddressLoginController?.dispose();
    passwordLoginController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF14181B),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            color: Color(0xFF14181B),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.network(
                'https://images.unsplash.com/photo-1525824236856-8c0a31dfe3be?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8d2F0ZXJmYWxsfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
              ).image,
            ),
          ),
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  FlutterFlowTheme.of(context).primaryColor,
                  FlutterFlowTheme.of(context).secondaryColor,
                  Color(0xFF673AB7)
                ],
                stops: [0, 1, 1],
                begin: AlignmentDirectional(0, -1),
                end: AlignmentDirectional(0, 1),
              ),
              shape: BoxShape.rectangle,
            ),
            alignment:
                AlignmentDirectional(0.44999999999999996, 0.3500000000000001),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 60, 0),
                        child: Image.asset(
                          'assets/images/to_do.png',
                          width: 100,
                          height: 150,
                          fit: BoxFit.cover,
                        ).animateOnPageLoad(
                            animationsMap['imageOnPageLoadAnimation']!),
                      ),
                      Text(
                        'DAILY TASK',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                      ).animateOnPageLoad(
                          animationsMap['textOnPageLoadAnimation']!),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                    child: DefaultTabController(
                      length: 2,
                      initialIndex: 0,
                      child: Column(
                        children: [
                          TabBar(
                            isScrollable: true,
                            labelColor: Colors.white,
                            labelStyle:
                                FlutterFlowTheme.of(context).subtitle1.override(
                                      fontFamily: 'Outfit',
                                      color: Color(0xFF0F1113),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                            indicatorColor: Colors.white,
                            tabs: [
                              Tab(
                                text: 'Login',
                              ),
                              Tab(
                                text: 'Sign Up',
                              ),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      44, 0, 44, 0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 20, 0, 0),
                                          child: TextFormField(
                                            controller:
                                                emailAddressLoginController,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Email Address',
                                              labelStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0xFF95A1AC),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                              hintStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0xFF95A1AC),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(20, 24, 20, 24),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle2
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: Color(0xFF0F1113),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 12, 0, 0),
                                          child: TextFormField(
                                            controller: passwordLoginController,
                                            obscureText:
                                                !passwordLoginVisibility,
                                            decoration: InputDecoration(
                                              labelText: 'Password',
                                              labelStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0xFF95A1AC),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                              hintStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0xFF95A1AC),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(20, 24, 20, 24),
                                              suffixIcon: InkWell(
                                                onTap: () => setState(
                                                  () => passwordLoginVisibility =
                                                      !passwordLoginVisibility,
                                                ),
                                                focusNode: FocusNode(
                                                    skipTraversal: true),
                                                child: Icon(
                                                  passwordLoginVisibility
                                                      ? Icons
                                                          .visibility_outlined
                                                      : Icons
                                                          .visibility_off_outlined,
                                                  color: Color(0xFF95A1AC),
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle2
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: Color(0xFF0F1113),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 24, 0, 0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              GoRouter.of(context)
                                                  .prepareAuthEvent();

                                              final user =
                                                  await signInWithEmail(
                                                context,
                                                emailAddressLoginController!
                                                    .text,
                                                passwordLoginController!.text,
                                              );
                                              if (user == null) {
                                                return;
                                              }

                                              context.goNamedAuth(
                                                  'optionselect', mounted);
                                            },
                                            text: 'Login',
                                            options: FFButtonOptions(
                                              width: 230,
                                              height: 50,
                                              color: Color(0xFF153871),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              elevation: 3,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 24, 0, 12),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              AutoSizeText(
                                                'Use a social platform to continue',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 8, 8, 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  GoRouter.of(context)
                                                      .prepareAuthEvent();
                                                  final user =
                                                      await signInWithGoogle(
                                                          context);
                                                  if (user == null) {
                                                    return;
                                                  }

                                                  context.goNamedAuth(
                                                      'optionselect', mounted);
                                                },
                                                child: Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF0F1113),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 5,
                                                        color:
                                                            Color(0x3314181B),
                                                        offset: Offset(0, 2),
                                                      )
                                                    ],
                                                    shape: BoxShape.circle,
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: FaIcon(
                                                    FontAwesomeIcons.google,
                                                    color: Colors.white,
                                                    size: 24,
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  context
                                                      .pushNamed('phonesignin');
                                                },
                                                child: Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF0F1113),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 5,
                                                        color:
                                                            Color(0x3314181B),
                                                        offset: Offset(0, 2),
                                                      )
                                                    ],
                                                    shape: BoxShape.circle,
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Icon(
                                                    Icons.phone_sharp,
                                                    color: Colors.white,
                                                    size: 24,
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      44, 0, 44, 0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 20, 0, 0),
                                          child: TextFormField(
                                            controller: emailAddressController,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Email Address',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF57636C),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              hintStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0xFF95A1AC),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(20, 24, 20, 24),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Color(0xFF14181B),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 12, 0, 0),
                                          child: TextFormField(
                                            controller: passwordController,
                                            obscureText: !passwordVisibility,
                                            decoration: InputDecoration(
                                              labelText: 'Password',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF57636C),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              hintStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0xFF95A1AC),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(20, 24, 20, 24),
                                              suffixIcon: InkWell(
                                                onTap: () => setState(
                                                  () => passwordVisibility =
                                                      !passwordVisibility,
                                                ),
                                                focusNode: FocusNode(
                                                    skipTraversal: true),
                                                child: Icon(
                                                  passwordVisibility
                                                      ? Icons
                                                          .visibility_outlined
                                                      : Icons
                                                          .visibility_off_outlined,
                                                  color: Color(0xFF95A1AC),
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Color(0xFF14181B),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 12, 0, 0),
                                          child: TextFormField(
                                            controller:
                                                passwordConfirmController,
                                            obscureText:
                                                !passwordConfirmVisibility,
                                            decoration: InputDecoration(
                                              labelText: 'Confirm Password',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF57636C),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              hintStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0xFF95A1AC),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(20, 24, 20, 24),
                                              suffixIcon: InkWell(
                                                onTap: () => setState(
                                                  () => passwordConfirmVisibility =
                                                      !passwordConfirmVisibility,
                                                ),
                                                focusNode: FocusNode(
                                                    skipTraversal: true),
                                                child: Icon(
                                                  passwordConfirmVisibility
                                                      ? Icons
                                                          .visibility_outlined
                                                      : Icons
                                                          .visibility_off_outlined,
                                                  color: Color(0xFF95A1AC),
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Color(0xFF14181B),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 24, 0, 0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              GoRouter.of(context)
                                                  .prepareAuthEvent();
                                              if (passwordController?.text !=
                                                  passwordConfirmController
                                                      ?.text) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Passwords don\'t match!',
                                                    ),
                                                  ),
                                                );
                                                return;
                                              }

                                              final user =
                                                  await createAccountWithEmail(
                                                context,
                                                emailAddressController!.text,
                                                passwordController!.text,
                                              );
                                              if (user == null) {
                                                return;
                                              }

                                              final usersCreateData =
                                                  createUsersRecordData(
                                                email: emailAddressController!
                                                    .text,
                                                createdTime:
                                                    getCurrentTimestamp,
                                                password:
                                                    passwordController!.text,
                                                confirmpassword:
                                                    passwordConfirmController!
                                                        .text,
                                              );
                                              await UsersRecord.collection
                                                  .doc(user.uid)
                                                  .update(usersCreateData);

                                              if (passwordController!.text ==
                                                  passwordConfirmController!
                                                      .text) {
                                                context.goNamedAuth(
                                                    'login', mounted);
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'password mismatch'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child: Text('Ok'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              }

                                              setState(() {
                                                emailAddressController?.clear();
                                                passwordController?.clear();
                                                passwordConfirmController
                                                    ?.clear();
                                              });
                                            },
                                            text: 'Create Account',
                                            options: FFButtonOptions(
                                              width: 230,
                                              height: 50,
                                              color: Color(0xFF39D2C0),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              elevation: 3,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 0),
                                          child: AutoSizeText(
                                            'Use a social platform to continue',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText2
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 8, 8, 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  GoRouter.of(context)
                                                      .prepareAuthEvent();
                                                  final user =
                                                      await signInWithGoogle(
                                                          context);
                                                  if (user == null) {
                                                    return;
                                                  }

                                                  context.goNamedAuth(
                                                      'optionselect', mounted);
                                                },
                                                child: Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF0F1113),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 5,
                                                        color:
                                                            Color(0x3314181B),
                                                        offset: Offset(0, 2),
                                                      )
                                                    ],
                                                    shape: BoxShape.circle,
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: FaIcon(
                                                    FontAwesomeIcons.google,
                                                    color: Colors.white,
                                                    size: 24,
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  context
                                                      .pushNamed('phonesignin');
                                                },
                                                child: Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF0F1113),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 5,
                                                        color:
                                                            Color(0x3314181B),
                                                        offset: Offset(0, 2),
                                                      )
                                                    ],
                                                    shape: BoxShape.circle,
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Icon(
                                                    Icons.phone_sharp,
                                                    color: Colors.white,
                                                    size: 24,
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ).animateOnPageLoad(
                        animationsMap['tabBarOnPageLoadAnimation']!),
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
