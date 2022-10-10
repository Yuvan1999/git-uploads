import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  List<TaskRecord> simpleSearchResults = [];
  final searchBarKey = GlobalKey();
  TextEditingController? searchBarController;
  String? searchBarSelectedOption;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    searchBarController = TextEditingController();
  }

  @override
  void dispose() {
    searchBarController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TaskRecord>>(
      stream: queryTaskRecord(
        parent: currentUserReference,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        List<TaskRecord> searchTaskRecordList = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 380,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0xFF4A708B),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 60,
                              icon: Icon(
                                Icons.arrow_back_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 30,
                              ),
                              onPressed: () async {
                                context.pushNamed('yyyy');
                              },
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                child: Autocomplete<String>(
                                  initialValue: TextEditingValue(),
                                  optionsBuilder: (textEditingValue) {
                                    if (textEditingValue.text == '') {
                                      return const Iterable<String>.empty();
                                    }
                                    return searchTaskRecordList
                                        .map((e) => e.taskname!)
                                        .toList()
                                        .toList()
                                        .where((option) {
                                      final lowercaseOption =
                                          option.toLowerCase();
                                      return lowercaseOption.contains(
                                          textEditingValue.text.toLowerCase());
                                    });
                                  },
                                  optionsViewBuilder:
                                      (context, onSelected, options) {
                                    return AutocompleteOptionsList(
                                      textFieldKey: searchBarKey,
                                      textController: searchBarController!,
                                      options: options.toList(),
                                      onSelected: onSelected,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: Color(0xFF1D2429),
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      textHighlightStyle: TextStyle(),
                                      elevation: 4,
                                      optionBackgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                      optionHighlightColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      maxHeight: 200,
                                    );
                                  },
                                  onSelected: (String selection) {
                                    setState(() =>
                                        searchBarSelectedOption = selection);
                                    FocusScope.of(context).unfocus();
                                  },
                                  fieldViewBuilder: (
                                    context,
                                    textEditingController,
                                    focusNode,
                                    onEditingComplete,
                                  ) {
                                    searchBarController = textEditingController;
                                    return TextFormField(
                                      key: searchBarKey,
                                      controller: textEditingController,
                                      focusNode: focusNode,
                                      onEditingComplete: onEditingComplete,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        'searchBarController',
                                        Duration(milliseconds: 2000),
                                        () async {
                                          setState(() {
                                            simpleSearchResults = TextSearch(
                                              searchTaskRecordList
                                                  .map(
                                                    (record) => TextSearchItem(
                                                        record,
                                                        [record.taskname!]),
                                                  )
                                                  .toList(),
                                            )
                                                .search(
                                                    searchBarController!.text)
                                                .map((r) => r.object)
                                                .toList();
                                          });
                                          setState(() =>
                                              FFAppState().searchtask = true);
                                        },
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF57636C),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        hintText: 'Type the task name here...',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF57636C),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFE0E3E7),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(23),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFE0E3E7),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(23),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(23),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(23),
                                        ),
                                        filled: true,
                                        fillColor: Color(0xFFF1F4F8),
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                24, 24, 20, 24),
                                        prefixIcon: Icon(
                                          Icons.search,
                                          color: Color(0xFF57636C),
                                          size: 16,
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: Color(0xFF1D2429),
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 12, 12, 0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 50,
                                icon: Icon(
                                  Icons.clear,
                                  color: Color(0xFF1D2429),
                                  size: 30,
                                ),
                                onPressed: () async {
                                  setState(() {
                                    searchBarController?.clear();
                                  });
                                  setState(
                                      () => FFAppState().searchtask = false);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (!FFAppState().searchtask)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 11, 0, 0),
                      child: Builder(
                        builder: (context) {
                          final searchnotask = searchTaskRecordList.toList();
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: searchnotask.length,
                            itemBuilder: (context, searchnotaskIndex) {
                              final searchnotaskItem =
                                  searchnotask[searchnotaskIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    22, 0, 22, 12),
                                child: Container(
                                  width: 100,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(22),
                                    border: Border.all(
                                      color: Color(0xFF57636C),
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 32, 0, 0),
                                        child: Text(
                                          searchnotaskItem.taskname!,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 22,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 65, 0, 0),
                                        child: Text(
                                          searchnotaskItem.type!,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            270, 70, 0, 0),
                                        child: InkWell(
                                          onDoubleTap: () async {
                                            await searchnotaskItem.reference
                                                .delete();
                                          },
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30,
                                            borderWidth: 1,
                                            buttonSize: 40,
                                            icon: Icon(
                                              Icons.delete_forever,
                                              color: Color(0xFF153871),
                                              size: 30,
                                            ),
                                            onPressed: () async {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title:
                                                        Text('Task - Deletion'),
                                                    content: Text(
                                                        'Double tap to delete the task'),
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
                                            },
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 12, 0, 0),
                                        child: Text(
                                          '#${dateTimeFormat('d/M/y', searchnotaskItem.time)}-${searchnotaskIndex.toString()}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            240, 12, 0, 0),
                                        child: Text(
                                          dateTimeFormat(
                                              'yMMMd', searchnotaskItem.time!),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  if (FFAppState().searchtask)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 11, 0, 0),
                      child: Builder(
                        builder: (context) {
                          final searchnotask =
                              simpleSearchResults.map((e) => e).toList();
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: searchnotask.length,
                            itemBuilder: (context, searchnotaskIndex) {
                              final searchnotaskItem =
                                  searchnotask[searchnotaskIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    22, 12, 22, 0),
                                child: Container(
                                  width: 100,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(22),
                                    border: Border.all(
                                      color: Color(0xFF57636C),
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 32, 0, 0),
                                        child: Text(
                                          searchnotaskItem.taskname!,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 22,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 65, 0, 0),
                                        child: Text(
                                          searchnotaskItem.type!,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            270, 70, 0, 0),
                                        child: InkWell(
                                          onDoubleTap: () async {
                                            await searchnotaskItem.reference
                                                .delete();
                                          },
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30,
                                            borderWidth: 1,
                                            buttonSize: 40,
                                            icon: Icon(
                                              Icons.delete_forever,
                                              color: Color(0xFF153871),
                                              size: 30,
                                            ),
                                            onPressed: () async {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title:
                                                        Text('Task - Deletion'),
                                                    content: Text(
                                                        'Double tap to delete the task'),
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
                                            },
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            200, 12, 12, 0),
                                        child: Text(
                                          dateTimeFormat(
                                              'yMMMd', searchnotaskItem.time!),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 12, 0, 0),
                                        child: Text(
                                          '#${dateTimeFormat('d/M/y', searchnotaskItem.time)}-${searchnotaskIndex.toString()}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
