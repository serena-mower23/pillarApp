// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TimeListStruct extends FFFirebaseStruct {
  TimeListStruct({
    DateTime? monday,
    DateTime? tuesday,
    DateTime? wednesday,
    DateTime? thursday,
    DateTime? friday,
    DateTime? saturday,
    DateTime? sunday,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _monday = monday,
        _tuesday = tuesday,
        _wednesday = wednesday,
        _thursday = thursday,
        _friday = friday,
        _saturday = saturday,
        _sunday = sunday,
        super(firestoreUtilData);

  // "Monday" field.
  DateTime? _monday;
  DateTime? get monday => _monday;
  set monday(DateTime? val) => _monday = val;
  bool hasMonday() => _monday != null;

  // "Tuesday" field.
  DateTime? _tuesday;
  DateTime? get tuesday => _tuesday;
  set tuesday(DateTime? val) => _tuesday = val;
  bool hasTuesday() => _tuesday != null;

  // "Wednesday" field.
  DateTime? _wednesday;
  DateTime? get wednesday => _wednesday;
  set wednesday(DateTime? val) => _wednesday = val;
  bool hasWednesday() => _wednesday != null;

  // "Thursday" field.
  DateTime? _thursday;
  DateTime? get thursday => _thursday;
  set thursday(DateTime? val) => _thursday = val;
  bool hasThursday() => _thursday != null;

  // "Friday" field.
  DateTime? _friday;
  DateTime? get friday => _friday;
  set friday(DateTime? val) => _friday = val;
  bool hasFriday() => _friday != null;

  // "Saturday" field.
  DateTime? _saturday;
  DateTime? get saturday => _saturday;
  set saturday(DateTime? val) => _saturday = val;
  bool hasSaturday() => _saturday != null;

  // "Sunday" field.
  DateTime? _sunday;
  DateTime? get sunday => _sunday;
  set sunday(DateTime? val) => _sunday = val;
  bool hasSunday() => _sunday != null;

  static TimeListStruct fromMap(Map<String, dynamic> data) => TimeListStruct(
        monday: data['Monday'] as DateTime?,
        tuesday: data['Tuesday'] as DateTime?,
        wednesday: data['Wednesday'] as DateTime?,
        thursday: data['Thursday'] as DateTime?,
        friday: data['Friday'] as DateTime?,
        saturday: data['Saturday'] as DateTime?,
        sunday: data['Sunday'] as DateTime?,
      );

  static TimeListStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? TimeListStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'Monday': _monday,
        'Tuesday': _tuesday,
        'Wednesday': _wednesday,
        'Thursday': _thursday,
        'Friday': _friday,
        'Saturday': _saturday,
        'Sunday': _sunday,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Monday': serializeParam(
          _monday,
          ParamType.DateTime,
        ),
        'Tuesday': serializeParam(
          _tuesday,
          ParamType.DateTime,
        ),
        'Wednesday': serializeParam(
          _wednesday,
          ParamType.DateTime,
        ),
        'Thursday': serializeParam(
          _thursday,
          ParamType.DateTime,
        ),
        'Friday': serializeParam(
          _friday,
          ParamType.DateTime,
        ),
        'Saturday': serializeParam(
          _saturday,
          ParamType.DateTime,
        ),
        'Sunday': serializeParam(
          _sunday,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static TimeListStruct fromSerializableMap(Map<String, dynamic> data) =>
      TimeListStruct(
        monday: deserializeParam(
          data['Monday'],
          ParamType.DateTime,
          false,
        ),
        tuesday: deserializeParam(
          data['Tuesday'],
          ParamType.DateTime,
          false,
        ),
        wednesday: deserializeParam(
          data['Wednesday'],
          ParamType.DateTime,
          false,
        ),
        thursday: deserializeParam(
          data['Thursday'],
          ParamType.DateTime,
          false,
        ),
        friday: deserializeParam(
          data['Friday'],
          ParamType.DateTime,
          false,
        ),
        saturday: deserializeParam(
          data['Saturday'],
          ParamType.DateTime,
          false,
        ),
        sunday: deserializeParam(
          data['Sunday'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'TimeListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TimeListStruct &&
        monday == other.monday &&
        tuesday == other.tuesday &&
        wednesday == other.wednesday &&
        thursday == other.thursday &&
        friday == other.friday &&
        saturday == other.saturday &&
        sunday == other.sunday;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([monday, tuesday, wednesday, thursday, friday, saturday, sunday]);
}

TimeListStruct createTimeListStruct({
  DateTime? monday,
  DateTime? tuesday,
  DateTime? wednesday,
  DateTime? thursday,
  DateTime? friday,
  DateTime? saturday,
  DateTime? sunday,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TimeListStruct(
      monday: monday,
      tuesday: tuesday,
      wednesday: wednesday,
      thursday: thursday,
      friday: friday,
      saturday: saturday,
      sunday: sunday,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TimeListStruct? updateTimeListStruct(
  TimeListStruct? timeList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    timeList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTimeListStructData(
  Map<String, dynamic> firestoreData,
  TimeListStruct? timeList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (timeList == null) {
    return;
  }
  if (timeList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && timeList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final timeListData = getTimeListFirestoreData(timeList, forFieldValue);
  final nestedData = timeListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = timeList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTimeListFirestoreData(
  TimeListStruct? timeList, [
  bool forFieldValue = false,
]) {
  if (timeList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(timeList.toMap());

  // Add any Firestore field values
  timeList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTimeListListFirestoreData(
  List<TimeListStruct>? timeLists,
) =>
    timeLists?.map((e) => getTimeListFirestoreData(e, true)).toList() ?? [];
