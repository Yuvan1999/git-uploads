import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerificationWidget extends StatefulWidget {
  const VerificationWidget({Key? key}) : super(key: key);

  @override
  _VerificationWidgetState createState() => _VerificationWidgetState();
}

class _VerificationWidgetState extends State<VerificationWidget> {
  TextEditingController? pinCodeController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    pinCodeController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Enter the Code Below',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Outfit',
                color: Color(0xFF101213),
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Confirm your Code',
                    style: FlutterFlowTheme.of(context).title3.override(
                          fontFamily: 'Outfit',
                          color: Color(0xFF101213),
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(44, 8, 44, 0),
                    child: Text(
                      'This code helps keep your account safe and secure.',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Outfit',
                            color: Color(0xFF57636C),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 32, 0, 0),
                    child: PinCodeTextField(
                      appContext: context,
                      length: 6,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Outfit',
                                color: Color(0xFF4B39EF),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                      mainAxisAlignment: MainAxisAlignment.start,
                      enableActiveFill: false,
                      autoFocus: true,
                      showCursor: true,
                      cursorColor: Color(0xFF4B39EF),
                      obscureText: false,
                      hintCharacter: '-',
                      pinTheme: PinTheme(
                        fieldHeight: 60,
                        fieldWidth: 60,
                        borderWidth: 5,
                        borderRadius: BorderRadius.circular(12),
                        shape: PinCodeFieldShape.box,
                        activeColor: Color(0xFF4B39EF),
                        inactiveColor: Color(0xFFF1F4F8),
                        selectedColor: Color(0xFF57636C),
                        activeFillColor: Color(0xFF4B39EF),
                        inactiveFillColor: Color(0xFFF1F4F8),
                        selectedFillColor: Color(0xFF57636C),
                      ),
                      controller: pinCodeController,
                      onChanged: (_) => {},
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 44),
              child: FFButtonWidget(
                onPressed: () async {
                  GoRouter.of(context).prepareAuthEvent();
                  final smsCodeVal = pinCodeController!.text;
                  if (smsCodeVal == null || smsCodeVal.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Enter SMS verification code.'),
                      ),
                    );
                    return;
                  }
                  final phoneVerifiedUser = await verifySmsCode(
                    context: context,
                    smsCode: smsCodeVal,
                  );
                  if (phoneVerifiedUser == null) {
                    return;
                  }

                  context.pushNamedAuth('optionselect', mounted);
                },
                text: 'Confirm & Continue',
                options: FFButtonOptions(
                  width: 270,
                  height: 50,
                  color: Color(0xFF101213),
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Outfit',
                        color: Color(0xFFF1F4F8),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                  elevation: 2,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
