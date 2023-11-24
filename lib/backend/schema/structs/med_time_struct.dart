// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedTimeStruct extends FFFirebaseStruct {
  MedTimeStruct({
    bool? monday,
    bool? tuesday,
    bool? wednesday,
    bool? thursday,
    bool? friday,
    bool? saturday,
    bool? sunday,
    DateTime? time,
    int? adherence,
    int? occurrences,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _monday = monday,
        _tuesday = tuesday,
        _wednesday = wednesday,
        _thursday = thursday,
        _friday = friday,
        _saturday = saturday,
        _sunday = sunday,
        _time = time,
        _adherence = adherence,
        _occurrences = occurrences,
        super(firestoreUtilData);

  // "monday" field.
  bool? _monday;
  bool get monday => _monday ?? false;
  set monday(bool? val) => _monday = val;
  bool hasMonday() => _monday != null;

  // "tuesday" field.
  bool? _tuesday;
  bool get tuesday => _tuesday ?? false;
  set tuesday(bool? val) => _tuesday = val;
  bool hasTuesday() => _tuesday != null;

  // "wednesday" field.
  bool? _wednesday;
  bool get wednesday => _wednesday ?? false;
  set wednesday(bool? val) => _wednesday = val;
  bool hasWednesday() => _wednesday != null;

  // "thursday" field.
  bool? _thursday;
  bool get thursday => _thursday ?? false;
  set thursday(bool? val) => _thursday = val;
  bool hasThursday() => _thursday != null;

  // "friday" field.
  bool? _friday;
  bool get friday => _friday ?? false;
  set friday(bool? val) => _friday = val;
  bool hasFriday() => _friday != null;

  // "saturday" field.
  bool? _saturday;
  bool get saturday => _saturday ?? false;
  set saturday(bool? val) => _saturday = val;
  bool hasSaturday() => _saturday != null;

  // "sunday" field.
  bool? _sunday;
  bool get sunday => _sunday ?? false;
  set sunday(bool? val) => _sunday = val;
  bool hasSunday() => _sunday != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  set time(DateTime? val) => _time = val;
  bool hasTime() => _time != null;

  // "adherence" field.
  int? _adherence;
  int get adherence => _adherence ?? 0;
  set adherence(int? val) => _adherence = val;
  void incrementAdherence(int amount) => _adherence = adherence + amount;
  bool hasAdherence() => _adherence != null;

  // "occurrences" field.
  int? _occurrences;
  int get occurrences => _occurrences ?? 0;
  set occurrences(int? val) => _occurrences = val;
  void incrementOccurrences(int amount) => _occurrences = occurrences + amount;
  bool hasOccurrences() => _occurrences != null;

  static MedTimeStruct fromMap(Map<String, dynamic> data) => MedTimeStruct(
        monday: data['monday'] as bool?,
        tuesday: data['tuesday'] as bool?,
        wednesday: data['wednesday'] as bool?,
        thursday: data['thursday'] as bool?,
        friday: data['friday'] as bool?,
        saturday: data['saturday'] as bool?,
        sunday: data['sunday'] as bool?,
        time: data['time'] as DateTime?,
        adherence: castToType<int>(data['adherence']),
        occurrences: castToType<int>(data['occurrences']),
      );

  static MedTimeStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? MedTimeStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'monday': _monday,
        'tuesday': _tuesday,
        'wednesday': _wednesday,
        'thursday': _thursday,
        'friday': _friday,
        'saturday': _saturday,
        'sunday': _sunday,
        'time': _time,
        'adherence': _adherence,
        'occurrences': _occurrences,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'monday': serializeParam(
          _monday,
          ParamType.bool,
        ),
        'tuesday': serializeParam(
          _tuesday,
          ParamType.bool,
        ),
        'wednesday': serializeParam(
          _wednesday,
          ParamType.bool,
        ),
        'thursday': serializeParam(
          _thursday,
          ParamType.bool,
        ),
        'friday': serializeParam(
          _friday,
          ParamType.bool,
        ),
        'saturday': serializeParam(
          _saturday,
          ParamType.bool,
        ),
        'sunday': serializeParam(
          _sunday,
          ParamType.bool,
        ),
        'time': serializeParam(
          _time,
          ParamType.DateTime,
        ),
        'adherence': serializeParam(
          _adherence,
          ParamType.int,
        ),
        'occurrences': serializeParam(
          _occurrences,
          ParamType.int,
        ),
      }.withoutNulls;

  static MedTimeStruct fromSerializableMap(Map<String, dynamic> data) =>
      MedTimeStruct(
        monday: deserializeParam(
          data['monday'],
          ParamType.bool,
          false,
        ),
        tuesday: deserializeParam(
          data['tuesday'],
          ParamType.bool,
          false,
        ),
        wednesday: deserializeParam(
          data['wednesday'],
          ParamType.bool,
          false,
        ),
        thursday: deserializeParam(
          data['thursday'],
          ParamType.bool,
          false,
        ),
        friday: deserializeParam(
          data['friday'],
          ParamType.bool,
          false,
        ),
        saturday: deserializeParam(
          data['saturday'],
          ParamType.bool,
          false,
        ),
        sunday: deserializeParam(
          data['sunday'],
          ParamType.bool,
          false,
        ),
        time: deserializeParam(
          data['time'],
          ParamType.DateTime,
          false,
        ),
        adherence: deserializeParam(
          data['adherence'],
          ParamType.int,
          false,
        ),
        occurrences: deserializeParam(
          data['occurrences'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'MedTimeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MedTimeStruct &&
        monday == other.monday &&
        tuesday == other.tuesday &&
        wednesday == other.wednesday &&
        thursday == other.thursday &&
        friday == other.friday &&
        saturday == other.saturday &&
        sunday == other.sunday &&
        time == other.time &&
        adherence == other.adherence &&
        occurrences == other.occurrences;
  }

  @override
  int get hashCode => const ListEquality().hash([
        monday,
        tuesday,
        wednesday,
        thursday,
        friday,
        saturday,
        sunday,
        time,
        adherence,
        occurrences
      ]);
}

MedTimeStruct createMedTimeStruct({
  bool? monday,
  bool? tuesday,
  bool? wednesday,
  bool? thursday,
  bool? friday,
  bool? saturday,
  bool? sunday,
  DateTime? time,
  int? adherence,
  int? occurrences,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MedTimeStruct(
      monday: monday,
      tuesday: tuesday,
      wednesday: wednesday,
      thursday: thursday,
      friday: friday,
      saturday: saturday,
      sunday: sunday,
      time: time,
      adherence: adherence,
      occurrences: occurrences,
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
