import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class YyyyWidget extends StatefulWidget {
  const YyyyWidget({Key? key}) : super(key: key);

  @override
  _YyyyWidgetState createState() => _YyyyWidgetState();
}

class _YyyyWidgetState extends State<YyyyWidget> {
  PagingController<DocumentSnapshot?, TaskRecord>? _pagingController;
  Query? _pagingQuery;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).lineColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: AppBar(
          backgroundColor: Color(0xFF4A708B),
          automaticallyImplyLeading: false,
          actions: [],
          flexibleSpace: FlexibleSpaceBar(
            title: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 14),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(6, 20, 0, 22),
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
                              context.pushNamed('optionselect');
                            },
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(240, 20, 0, 22),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 60,
                            icon: Icon(
                              Icons.search,
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              size: 30,
                            ),
                            onPressed: () async {
                              context.pushNamed('search');
                            },
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
          elevation: 10,
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(22, 0, 23, 0),
                  child: PagedListView<DocumentSnapshot<Object?>?, TaskRecord>(
                    pagingController: () {
                      final Query<Object?> Function(Query<Object?>)
                          queryBuilder = (taskRecord) => taskRecord;
                      if (_pagingController != null) {
                        final query = queryBuilder(TaskRecord.collection());
                        if (query != _pagingQuery) {
                          // The query has changed
                          _pagingQuery = query;

                          _pagingController!.refresh();
                        }
                        return _pagingController!;
                      }

                      _pagingController = PagingController(firstPageKey: null);
                      _pagingQuery = queryBuilder(TaskRecord.collection());
                      _pagingController!
                          .addPageRequestListener((nextPageMarker) {
                        queryTaskRecordPage(
                          parent: currentUserReference,
                          queryBuilder: (taskRecord) => taskRecord,
                          nextPageMarker: nextPageMarker,
                          pageSize: 25,
                          isStream: false,
                        ).then((page) {
                          _pagingController!.appendPage(
                            page.data,
                            page.nextPageMarker,
                          );
                        });
                      });
                      return _pagingController!;
                    }(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    builderDelegate: PagedChildBuilderDelegate<TaskRecord>(
                      // Customize what your widget looks like when it's loading the first page.
                      firstPageProgressIndicatorBuilder: (_) => Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).primaryColor,
                          ),
                        ),
                      ),

                      itemBuilder: (context, _, listViewIndex) {
                        final listViewTaskRecord =
                            _pagingController!.itemList![listViewIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                          child: InkWell(
                            onTap: () async {
                              context.pushNamed(
                                'DETAILEDTASK',
                                queryParams: {
                                  'detail': serializeParam(
                                    listViewTaskRecord,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'detail': listViewTaskRecord,
                                },
                              );
                            },
                            child: Material(
                              color: Colors.transparent,
                              elevation: 12,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Container(
                                width: 100,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: Color(0xFF101213),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 0, 5, 0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 0, 0),
                                              child: Text(
                                                '#${dateTimeFormat('d/M/y', listViewTaskRecord.time)}-${listViewIndex.toString()}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ),
                                            SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                130, 0, 0, 0),
                                                    child: Text(
                                                      dateTimeFormat('d/M/y',
                                                          getCurrentTimestamp),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 0, 0),
                                                child: Text(
                                                  listViewTaskRecord.taskname!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title3
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w800,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 0, 0, 0),
                                              child: Text(
                                                listViewTaskRecord.type!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(210, 0, 0, 0),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  7, 0, 0, 0),
                                                      child: InkWell(
                                                        onDoubleTap: () async {
                                                          await listViewTaskRecord
                                                              .reference
                                                              .delete();
                                                        },
                                                        child:
                                                            FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 30,
                                                          borderWidth: 1,
                                                          buttonSize: 40,
                                                          icon: Icon(
                                                            Icons
                                                                .delete_forever,
                                                            color: Color(
                                                                0xFF153871),
                                                            size: 30,
                                                          ),
                                                          onPressed: () async {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      'Task - Deletion'),
                                                                  content: Text(
                                                                      'Double tap to delete the task'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
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
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 600, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 22,
                    child: Container(
                      width: 390,
                      height: 115,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x33000000),
                            offset: Offset(0, 2),
                          )
                        ],
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).lineColor,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(30, 22, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(
                                  'taskcreate',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              text: 'ADD NEW  TASK',
                              options: FFButtonOptions(
                                width: 310,
                                height: 60,
                                color: Color(0xFF153871),
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      fontWeight: FontWeight.bold,
                                    ),
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
