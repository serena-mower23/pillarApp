// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedTimeStruct extends FFFirebaseStruct {
  MedTimeStruct({
    int? hour,
    int? minute,
    bool? isAM,
    List<String>? daysOfTheWeek,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _hour = hour,
        _minute = minute,
        _isAM = isAM,
        _daysOfTheWeek = daysOfTheWeek,
        super(firestoreUtilData);

  // "hour" field.
  int? _hour;
  int get hour => _hour ?? 0;
  set hour(int? val) => _hour = val;
  void incrementHour(int amount) => _hour = hour + amount;
  bool hasHour() => _hour != null;

  // "minute" field.
  int? _minute;
  int get minute => _minute ?? 0;
  set minute(int? val) => _minute = val;
  void incrementMinute(int amount) => _minute = minute + amount;
  bool hasMinute() => _minute != null;

  // "isAM" field.
  bool? _isAM;
  bool get isAM => _isAM ?? false;
  set isAM(bool? val) => _isAM = val;
  bool hasIsAM() => _isAM != null;

  // "days_of_the_week" field.
  List<String>? _daysOfTheWeek;
  List<String> get daysOfTheWeek => _daysOfTheWeek ?? const [];
  set daysOfTheWeek(List<String>? val) => _daysOfTheWeek = val;
  void updateDaysOfTheWeek(Function(List<String>) updateFn) =>
      updateFn(_daysOfTheWeek ??= []);
  bool hasDaysOfTheWeek() => _daysOfTheWeek != null;

  static MedTimeStruct fromMap(Map<String, dynamic> data) => MedTimeStruct(
        hour: castToType<int>(data['hour']),
        minute: castToType<int>(data['minute']),
        isAM: data['isAM'] as bool?,
        daysOfTheWeek: getDataList(data['days_of_the_week']),
      );

  static MedTimeStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? MedTimeStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'hour': _hour,
        'minute': _minute,
        'isAM': _isAM,
        'days_of_the_week': _daysOfTheWeek,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'hour': serializeParam(
          _hour,
          ParamType.int,
        ),
        'minute': serializeParam(
          _minute,
          ParamType.int,
        ),
        'isAM': serializeParam(
          _isAM,
          ParamType.bool,
        ),
        'days_of_the_week': serializeParam(
          _daysOfTheWeek,
          ParamType.String,
          true,
        ),
      }.withoutNulls;

  static MedTimeStruct fromSerializableMap(Map<String, dynamic> data) =>
      MedTimeStruct(
        hour: deserializeParam(
          data['hour'],
          ParamType.int,
          false,
        ),
        minute: deserializeParam(
          data['minute'],
          ParamType.int,
          false,
        ),
        isAM: deserializeParam(
          data['isAM'],
          ParamType.bool,
          false,
        ),
        daysOfTheWeek: deserializeParam<String>(
          data['days_of_the_week'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'MedTimeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MedTimeStruct &&
        hour == other.hour &&
        minute == other.minute &&
        isAM == other.isAM &&
        listEquality.equals(daysOfTheWeek, other.daysOfTheWeek);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([hour, minute, isAM, daysOfTheWeek]);
}

MedTimeStruct createMedTimeStruct({
  int? hour,
  int? minute,
  bool? isAM,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MedTimeStruct(
      hour: hour,
      minute: minute,
      isAM: isAM,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MedTimeStruct? updateMedTimeStruct(
  MedTimeStruct? medTime, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    medTime
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMedTimeStructData(
  Map<String, dynamic> firestoreData,
  MedTimeStruct? medTime,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (medTime == null) {
    return;
  }
  if (medTime.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && medTime.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final medTimeData = getMedTimeFirestoreData(medTime, forFieldValue);
  final nestedData = medTimeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = medTime.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMedTimeFirestoreData(
  MedTimeStruct? medTime, [
  bool forFieldValue = false,
]) {
  if (medTime == null) {
    return {};
  }
  final firestoreData = mapToFirestore(medTime.toMap());

  // Add any Firestore field values
  medTime.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMedTimeListFirestoreData(
  List<MedTimeStruct>? medTimes,
) =>
    medTimes?.map((e) => getMedTimeFirestoreData(e, true)).toList() ?? [];
