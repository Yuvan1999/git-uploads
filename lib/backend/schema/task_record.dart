import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'task_record.g.dart';

abstract class TaskRecord implements Built<TaskRecord, TaskRecordBuilder> {
  static Serializer<TaskRecord> get serializer => _$taskRecordSerializer;

  String? get taskname;

  String? get type;

  String? get desc;

  DateTime? get time;

  String? get id;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(TaskRecordBuilder builder) => builder
    ..taskname = ''
    ..type = ''
    ..desc = ''
    ..id = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('task')
          : FirebaseFirestore.instance.collectionGroup('task');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('task').doc();

  static Stream<TaskRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TaskRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TaskRecord._();
  factory TaskRecord([void Function(TaskRecordBuilder) updates]) = _$TaskRecord;

  static TaskRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTaskRecordData({
  String? taskname,
  String? type,
  String? desc,
  DateTime? time,
  String? id,
}) {
  final firestoreData = serializers.toFirestore(
    TaskRecord.serializer,
    TaskRecord(
      (t) => t
        ..taskname = taskname
        ..type = type
        ..desc = desc
        ..time = time
        ..id = id,
    ),
  );

  return firestoreData;
}
