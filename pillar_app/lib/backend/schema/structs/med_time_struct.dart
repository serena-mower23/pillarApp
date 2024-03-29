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
    String? medName,
    DateTime? creationDate,
    bool? takenToday,
    List<TakenDateStruct>? takenDates,
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
        _medName = medName,
        _creationDate = creationDate,
        _takenToday = takenToday,
        _takenDates = takenDates,
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

  // "med_name" field.
  String? _medName;
  String get medName => _medName ?? '';
  set medName(String? val) => _medName = val;
  bool hasMedName() => _medName != null;

  // "creation_date" field.
  DateTime? _creationDate;
  DateTime? get creationDate => _creationDate;
  set creationDate(DateTime? val) => _creationDate = val;
  bool hasCreationDate() => _creationDate != null;

  // "takenToday" field.
  bool? _takenToday;
  bool get takenToday => _takenToday ?? false;
  set takenToday(bool? val) => _takenToday = val;
  bool hasTakenToday() => _takenToday != null;

  // "taken_dates" field.
  List<TakenDateStruct>? _takenDates;
  List<TakenDateStruct> get takenDates => _takenDates ?? const [];
  set takenDates(List<TakenDateStruct>? val) => _takenDates = val;
  void updateTakenDates(Function(List<TakenDateStruct>) updateFn) =>
      updateFn(_takenDates ??= []);
  bool hasTakenDates() => _takenDates != null;

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
        medName: data['med_name'] as String?,
        creationDate: data['creation_date'] as DateTime?,
        takenToday: data['takenToday'] as bool?,
        takenDates: getStructList(
          data['taken_dates'],
          TakenDateStruct.fromMap,
        ),
      );

  static MedTimeStruct? maybeFromMap(dynamic data) =>
      data is Map ? MedTimeStruct.fromMap(data.cast<String, dynamic>()) : null;

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
        'med_name': _medName,
        'creation_date': _creationDate,
        'takenToday': _takenToday,
        'taken_dates': _takenDates?.map((e) => e.toMap()).toList(),
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
        'med_name': serializeParam(
          _medName,
          ParamType.String,
        ),
        'creation_date': serializeParam(
          _creationDate,
          ParamType.DateTime,
        ),
        'takenToday': serializeParam(
          _takenToday,
          ParamType.bool,
        ),
        'taken_dates': serializeParam(
          _takenDates,
          ParamType.DataStruct,
          true,
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
        medName: deserializeParam(
          data['med_name'],
          ParamType.String,
          false,
        ),
        creationDate: deserializeParam(
          data['creation_date'],
          ParamType.DateTime,
          false,
        ),
        takenToday: deserializeParam(
          data['takenToday'],
          ParamType.bool,
          false,
        ),
        takenDates: deserializeStructParam<TakenDateStruct>(
          data['taken_dates'],
          ParamType.DataStruct,
          true,
          structBuilder: TakenDateStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'MedTimeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
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
        occurrences == other.occurrences &&
        medName == other.medName &&
        creationDate == other.creationDate &&
        takenToday == other.takenToday &&
        listEquality.equals(takenDates, other.takenDates);
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
        occurrences,
        medName,
        creationDate,
        takenToday,
        takenDates
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
  String? medName,
  DateTime? creationDate,
  bool? takenToday,
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
      medName: medName,
      creationDate: creationDate,
      takenToday: takenToday,
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
