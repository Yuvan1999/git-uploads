import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskcreateWidget extends StatefulWidget {
  const TaskcreateWidget({Key? key}) : super(key: key);

  @override
  _TaskcreateWidgetState createState() => _TaskcreateWidgetState();
}

class _TaskcreateWidgetState extends State<TaskcreateWidget> {
  String? teamSelectValue;
  TextEditingController? userNameController;
  TextEditingController? shortBioController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    shortBioController = TextEditingController();
    userNameController = TextEditingController();
  }

  @override
  void dispose() {
    shortBioController?.dispose();
    userNameController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Color(0xFF4A708B),
          automaticallyImplyLeading: false,
          actions: [],
          flexibleSpace: FlexibleSpaceBar(
            title: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 14),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 66),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 22, 0, 0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 50,
                            icon: Icon(
                              Icons.arrow_back_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () async {
                              context.pushNamed('yyyy');
                            },
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(250, 22, 0, 0),
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
                              buttonSize: 60,
                              icon: Icon(
                                Icons.logout,
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
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
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
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
            centerTitle: true,
            expandedTitleScale: 1.0,
          ),
          elevation: 2,
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Align(
            alignment: AlignmentDirectional(-0.1, -0.5),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(22, 28, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 0, 0),
                                  child: Text(
                                    'NAME',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 16,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(26, 8, 30, 0),
                            child: TextFormField(
                              controller: userNameController,
                              onFieldSubmitted: (_) async {
                                final taskCreateData = createTaskRecordData(
                                  taskname: userNameController!.text,
                                  type: teamSelectValue,
                                  desc: shortBioController!.text,
                                );
                                await TaskRecord.createDoc(
                                        currentUserReference!)
                                    .set(taskCreateData);
                              },
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: Color(0xFF57636C),
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                    ),
                                hintText: 'ADD NAME HERE',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFFF0000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFFF0000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                contentPadding:
                                    EdgeInsetsDirectional.fromSTEB(8, 0, 20, 0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal,
                                  ),
                              textAlign: TextAlign.start,
                              maxLines: 1,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(22, 18, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 0, 0),
                                  child: Text(
                                    'TYPE',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 16,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(26, 12, 30, 0),
                            child: FlutterFlowDropDown(
                              options: [
                                'Type 1',
                                'Type 2',
                                'Type 3',
                                'Type 4',
                                'Type 5'
                              ],
                              onChanged: (val) =>
                                  setState(() => teamSelectValue = val),
                              width: double.infinity,
                              height: 50,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                              hintText: 'SELECT ONE',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Color(0xFF57636C),
                                size: 15,
                              ),
                              fillColor: Colors.white,
                              elevation: 1,
                              borderColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              borderWidth: 0,
                              borderRadius: 12,
                              margin:
                                  EdgeInsetsDirectional.fromSTEB(6, 2, 6, 2),
                              hidesUnderline: true,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(22, 18, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 0, 0),
                                  child: Text(
                                    'DESCRIPTION',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 16,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(26, 16, 26, 0),
                            child: TextFormField(
                              controller: shortBioController,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Enter description here...',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontWeight: FontWeight.normal,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF57636C),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF57636C),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    8, 22, 20, 0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontWeight: FontWeight.w500,
                                  ),
                              textAlign: TextAlign.start,
                              maxLines: 16,
                              keyboardType: TextInputType.multiline,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 77, 0, 0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 22,
                    child: Container(
                      width: 600,
                      height: 100,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(26, 22, 26, 22),
                        child: FFButtonWidget(
                          onPressed: () async {
                            final taskCreateData = createTaskRecordData(
                              taskname: userNameController!.text,
                              type: teamSelectValue,
                              desc: shortBioController!.text,
                              time: getCurrentTimestamp,
                              id: '#${dateTimeFormat('d/M/y', getCurrentTimestamp)} - ${userNameController!.text}',
                            );
                            await TaskRecord.createDoc(currentUserReference!)
                                .set(taskCreateData);

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
                          text: 'Save Task',
                          options: FFButtonOptions(
                            width: 270,
                            color: Color(0xFF153871),
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle1.override(
                                      fontFamily: 'Outfit',
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                    ),
                            elevation: 3,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
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
