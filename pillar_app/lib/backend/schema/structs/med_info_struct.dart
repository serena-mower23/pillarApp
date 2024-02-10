// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedInfoStruct extends FFFirebaseStruct {
  MedInfoStruct({
    String? medicationName,
    bool? withFood,
    List<MedTimeStruct>? whenToTake,
    String? pillWeight,
    String? pillBottleWeight,
    BTDeviceStruct? pedestalInfo,
    String? dosageAmount,
    String? pillCount,
    String? pillCountDosage,
    List<TakenDateStruct>? takenDates,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _medicationName = medicationName,
        _withFood = withFood,
        _whenToTake = whenToTake,
        _pillWeight = pillWeight,
        _pillBottleWeight = pillBottleWeight,
        _pedestalInfo = pedestalInfo,
        _dosageAmount = dosageAmount,
        _pillCount = pillCount,
        _pillCountDosage = pillCountDosage,
        _takenDates = takenDates,
        super(firestoreUtilData);

  // "medication_name" field.
  String? _medicationName;
  String get medicationName => _medicationName ?? '';
  set medicationName(String? val) => _medicationName = val;
  bool hasMedicationName() => _medicationName != null;

  // "with_food" field.
  bool? _withFood;
  bool get withFood => _withFood ?? false;
  set withFood(bool? val) => _withFood = val;
  bool hasWithFood() => _withFood != null;

  // "when_to_take" field.
  List<MedTimeStruct>? _whenToTake;
  List<MedTimeStruct> get whenToTake => _whenToTake ?? const [];
  set whenToTake(List<MedTimeStruct>? val) => _whenToTake = val;
  void updateWhenToTake(Function(List<MedTimeStruct>) updateFn) =>
      updateFn(_whenToTake ??= []);
  bool hasWhenToTake() => _whenToTake != null;

  // "pill_weight" field.
  String? _pillWeight;
  String get pillWeight => _pillWeight ?? '';
  set pillWeight(String? val) => _pillWeight = val;
  bool hasPillWeight() => _pillWeight != null;

  // "pill_bottle_weight" field.
  String? _pillBottleWeight;
  String get pillBottleWeight => _pillBottleWeight ?? '';
  set pillBottleWeight(String? val) => _pillBottleWeight = val;
  bool hasPillBottleWeight() => _pillBottleWeight != null;

  // "pedestal_info" field.
  BTDeviceStruct? _pedestalInfo;
  BTDeviceStruct get pedestalInfo => _pedestalInfo ?? BTDeviceStruct();
  set pedestalInfo(BTDeviceStruct? val) => _pedestalInfo = val;
  void updatePedestalInfo(Function(BTDeviceStruct) updateFn) =>
      updateFn(_pedestalInfo ??= BTDeviceStruct());
  bool hasPedestalInfo() => _pedestalInfo != null;

  // "dosage_amount" field.
  String? _dosageAmount;
  String get dosageAmount => _dosageAmount ?? '';
  set dosageAmount(String? val) => _dosageAmount = val;
  bool hasDosageAmount() => _dosageAmount != null;

  // "pill_count" field.
  String? _pillCount;
  String get pillCount => _pillCount ?? '';
  set pillCount(String? val) => _pillCount = val;
  bool hasPillCount() => _pillCount != null;

  // "pill_count_dosage" field.
  String? _pillCountDosage;
  String get pillCountDosage => _pillCountDosage ?? '';
  set pillCountDosage(String? val) => _pillCountDosage = val;
  bool hasPillCountDosage() => _pillCountDosage != null;

  // "taken_dates" field.
  List<TakenDateStruct>? _takenDates;
  List<TakenDateStruct> get takenDates => _takenDates ?? const [];
  set takenDates(List<TakenDateStruct>? val) => _takenDates = val;
  void updateTakenDates(Function(List<TakenDateStruct>) updateFn) =>
      updateFn(_takenDates ??= []);
  bool hasTakenDates() => _takenDates != null;

  static MedInfoStruct fromMap(Map<String, dynamic> data) => MedInfoStruct(
        medicationName: data['medication_name'] as String?,
        withFood: data['with_food'] as bool?,
        whenToTake: getStructList(
          data['when_to_take'],
          MedTimeStruct.fromMap,
        ),
        pillWeight: data['pill_weight'] as String?,
        pillBottleWeight: data['pill_bottle_weight'] as String?,
        pedestalInfo: BTDeviceStruct.maybeFromMap(data['pedestal_info']),
        dosageAmount: data['dosage_amount'] as String?,
        pillCount: data['pill_count'] as String?,
        pillCountDosage: data['pill_count_dosage'] as String?,
        takenDates: getStructList(
          data['taken_dates'],
          TakenDateStruct.fromMap,
        ),
      );

  static MedInfoStruct? maybeFromMap(dynamic data) =>
      data is Map ? MedInfoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'medication_name': _medicationName,
        'with_food': _withFood,
        'when_to_take': _whenToTake?.map((e) => e.toMap()).toList(),
        'pill_weight': _pillWeight,
        'pill_bottle_weight': _pillBottleWeight,
        'pedestal_info': _pedestalInfo?.toMap(),
        'dosage_amount': _dosageAmount,
        'pill_count': _pillCount,
        'pill_count_dosage': _pillCountDosage,
        'taken_dates': _takenDates?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'medication_name': serializeParam(
          _medicationName,
          ParamType.String,
        ),
        'with_food': serializeParam(
          _withFood,
          ParamType.bool,
        ),
        'when_to_take': serializeParam(
          _whenToTake,
          ParamType.DataStruct,
          true,
        ),
        'pill_weight': serializeParam(
          _pillWeight,
          ParamType.String,
        ),
        'pill_bottle_weight': serializeParam(
          _pillBottleWeight,
          ParamType.String,
        ),
        'pedestal_info': serializeParam(
          _pedestalInfo,
          ParamType.DataStruct,
        ),
        'dosage_amount': serializeParam(
          _dosageAmount,
          ParamType.String,
        ),
        'pill_count': serializeParam(
          _pillCount,
          ParamType.String,
        ),
        'pill_count_dosage': serializeParam(
          _pillCountDosage,
          ParamType.String,
        ),
        'taken_dates': serializeParam(
          _takenDates,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static MedInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      MedInfoStruct(
        medicationName: deserializeParam(
          data['medication_name'],
          ParamType.String,
          false,
        ),
        withFood: deserializeParam(
          data['with_food'],
          ParamType.bool,
          false,
        ),
        whenToTake: deserializeStructParam<MedTimeStruct>(
          data['when_to_take'],
          ParamType.DataStruct,
          true,
          structBuilder: MedTimeStruct.fromSerializableMap,
        ),
        pillWeight: deserializeParam(
          data['pill_weight'],
          ParamType.String,
          false,
        ),
        pillBottleWeight: deserializeParam(
          data['pill_bottle_weight'],
          ParamType.String,
          false,
        ),
        pedestalInfo: deserializeStructParam(
          data['pedestal_info'],
          ParamType.DataStruct,
          false,
          structBuilder: BTDeviceStruct.fromSerializableMap,
        ),
        dosageAmount: deserializeParam(
          data['dosage_amount'],
          ParamType.String,
          false,
        ),
        pillCount: deserializeParam(
          data['pill_count'],
          ParamType.String,
          false,
        ),
        pillCountDosage: deserializeParam(
          data['pill_count_dosage'],
          ParamType.String,
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
  String toString() => 'MedInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MedInfoStruct &&
        medicationName == other.medicationName &&
        withFood == other.withFood &&
        listEquality.equals(whenToTake, other.whenToTake) &&
        pillWeight == other.pillWeight &&
        pillBottleWeight == other.pillBottleWeight &&
        pedestalInfo == other.pedestalInfo &&
        dosageAmount == other.dosageAmount &&
        pillCount == other.pillCount &&
        pillCountDosage == other.pillCountDosage &&
        listEquality.equals(takenDates, other.takenDates);
  }

  @override
  int get hashCode => const ListEquality().hash([
        medicationName,
        withFood,
        whenToTake,
        pillWeight,
        pillBottleWeight,
        pedestalInfo,
        dosageAmount,
        pillCount,
        pillCountDosage,
        takenDates
      ]);
}

MedInfoStruct createMedInfoStruct({
  String? medicationName,
  bool? withFood,
  String? pillWeight,
  String? pillBottleWeight,
  BTDeviceStruct? pedestalInfo,
  String? dosageAmount,
  String? pillCount,
  String? pillCountDosage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MedInfoStruct(
      medicationName: medicationName,
      withFood: withFood,
      pillWeight: pillWeight,
      pillBottleWeight: pillBottleWeight,
      pedestalInfo:
          pedestalInfo ?? (clearUnsetFields ? BTDeviceStruct() : null),
      dosageAmount: dosageAmount,
      pillCount: pillCount,
      pillCountDosage: pillCountDosage,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MedInfoStruct? updateMedInfoStruct(
  MedInfoStruct? medInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    medInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMedInfoStructData(
  Map<String, dynamic> firestoreData,
  MedInfoStruct? medInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (medInfo == null) {
    return;
  }
  if (medInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && medInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final medInfoData = getMedInfoFirestoreData(medInfo, forFieldValue);
  final nestedData = medInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = medInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMedInfoFirestoreData(
  MedInfoStruct? medInfo, [
  bool forFieldValue = false,
]) {
  if (medInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(medInfo.toMap());

  // Handle nested data for "pedestal_info" field.
  addBTDeviceStructData(
    firestoreData,
    medInfo.hasPedestalInfo() ? medInfo.pedestalInfo : null,
    'pedestal_info',
    forFieldValue,
  );

  // Add any Firestore field values
  medInfo.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMedInfoListFirestoreData(
  List<MedInfoStruct>? medInfos,
) =>
    medInfos?.map((e) => getMedInfoFirestoreData(e, true)).toList() ?? [];
