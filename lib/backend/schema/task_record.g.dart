// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TaskRecord> _$taskRecordSerializer = new _$TaskRecordSerializer();

class _$TaskRecordSerializer implements StructuredSerializer<TaskRecord> {
  @override
  final Iterable<Type> types = const [TaskRecord, _$TaskRecord];
  @override
  final String wireName = 'TaskRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, TaskRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.taskname;
    if (value != null) {
      result
        ..add('taskname')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.desc;
    if (value != null) {
      result
        ..add('desc')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.time;
    if (value != null) {
      result
        ..add('time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  TaskRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TaskRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'taskname':
          result.taskname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'desc':
          result.desc = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$TaskRecord extends TaskRecord {
  @override
  final String? taskname;
  @override
  final String? type;
  @override
  final String? desc;
  @override
  final DateTime? time;
  @override
  final String? id;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TaskRecord([void Function(TaskRecordBuilder)? updates]) =>
      (new TaskRecordBuilder()..update(updates))._build();

  _$TaskRecord._(
      {this.taskname, this.type, this.desc, this.time, this.id, this.ffRef})
      : super._();

  @override
  TaskRecord rebuild(void Function(TaskRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TaskRecordBuilder toBuilder() => new TaskRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TaskRecord &&
        taskname == other.taskname &&
        type == other.type &&
        desc == other.desc &&
        time == other.time &&
        id == other.id &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, taskname.hashCode), type.hashCode),
                    desc.hashCode),
                time.hashCode),
            id.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TaskRecord')
          ..add('taskname', taskname)
          ..add('type', type)
          ..add('desc', desc)
          ..add('time', time)
          ..add('id', id)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TaskRecordBuilder implements Builder<TaskRecord, TaskRecordBuilder> {
  _$TaskRecord? _$v;

  String? _taskname;
  String? get taskname => _$this._taskname;
  set taskname(String? taskname) => _$this._taskname = taskname;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _desc;
  String? get desc => _$this._desc;
  set desc(String? desc) => _$this._desc = desc;

  DateTime? _time;
  DateTime? get time => _$this._time;
  set time(DateTime? time) => _$this._time = time;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TaskRecordBuilder() {
    TaskRecord._initializeBuilder(this);
  }

  TaskRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _taskname = $v.taskname;
      _type = $v.type;
      _desc = $v.desc;
      _time = $v.time;
      _id = $v.id;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TaskRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TaskRecord;
  }

  @override
  void update(void Function(TaskRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TaskRecord build() => _build();

  _$TaskRecord _build() {
    final _$result = _$v ??
        new _$TaskRecord._(
            taskname: taskname,
            type: type,
            desc: desc,
            time: time,
            id: id,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
