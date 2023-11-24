// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedInfoStruct extends FFFirebaseStruct {
  MedInfoStruct({
    String? medicationName,
    int? dosageAmount,
    int? pillCount,
    int? pillDosageCount,
    bool? withFood,
    List<MedTimeStruct>? whenToTake,
    String? pillWeight,
    String? pillBottleWeight,
    BTDeviceStruct? pedestalInfo,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _medicationName = medicationName,
        _dosageAmount = dosageAmount,
        _pillCount = pillCount,
        _pillDosageCount = pillDosageCount,
        _withFood = withFood,
        _whenToTake = whenToTake,
        _pillWeight = pillWeight,
        _pillBottleWeight = pillBottleWeight,
        _pedestalInfo = pedestalInfo,
        super(firestoreUtilData);

  // "medication_name" field.
  String? _medicationName;
  String get medicationName => _medicationName ?? '';
  set medicationName(String? val) => _medicationName = val;
  bool hasMedicationName() => _medicationName != null;

  // "dosage_amount" field.
  int? _dosageAmount;
  int get dosageAmount => _dosageAmount ?? 0;
  set dosageAmount(int? val) => _dosageAmount = val;
  void incrementDosageAmount(int amount) =>
      _dosageAmount = dosageAmount + amount;
  bool hasDosageAmount() => _dosageAmount != null;

  // "pill_count" field.
  int? _pillCount;
  int get pillCount => _pillCount ?? 0;
  set pillCount(int? val) => _pillCount = val;
  void incrementPillCount(int amount) => _pillCount = pillCount + amount;
  bool hasPillCount() => _pillCount != null;

  // "pill_dosage_count" field.
  int? _pillDosageCount;
  int get pillDosageCount => _pillDosageCount ?? 0;
  set pillDosageCount(int? val) => _pillDosageCount = val;
  void incrementPillDosageCount(int amount) =>
      _pillDosageCount = pillDosageCount + amount;
  bool hasPillDosageCount() => _pillDosageCount != null;

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

  static MedInfoStruct fromMap(Map<String, dynamic> data) => MedInfoStruct(
        medicationName: data['medication_name'] as String?,
        dosageAmount: castToType<int>(data['dosage_amount']),
        pillCount: castToType<int>(data['pill_count']),
        pillDosageCount: castToType<int>(data['pill_dosage_count']),
        withFood: data['with_food'] as bool?,
        whenToTake: getStructList(
          data['when_to_take'],
          MedTimeStruct.fromMap,
        ),
        pillWeight: data['pill_weight'] as String?,
        pillBottleWeight: data['pill_bottle_weight'] as String?,
        pedestalInfo: BTDeviceStruct.maybeFromMap(data['pedestal_info']),
      );

  static MedInfoStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? MedInfoStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'medication_name': _medicationName,
        'dosage_amount': _dosageAmount,
        'pill_count': _pillCount,
        'pill_dosage_count': _pillDosageCount,
        'with_food': _withFood,
        'when_to_take': _whenToTake?.map((e) => e.toMap()).toList(),
        'pill_weight': _pillWeight,
        'pill_bottle_weight': _pillBottleWeight,
        'pedestal_info': _pedestalInfo?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'medication_name': serializeParam(
          _medicationName,
          ParamType.String,
        ),
        'dosage_amount': serializeParam(
          _dosageAmount,
          ParamType.int,
        ),
        'pill_count': serializeParam(
          _pillCount,
          ParamType.int,
        ),
        'pill_dosage_count': serializeParam(
          _pillDosageCount,
          ParamType.int,
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
      }.withoutNulls;

  static MedInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      MedInfoStruct(
        medicationName: deserializeParam(
          data['medication_name'],
          ParamType.String,
          false,
        ),
        dosageAmount: deserializeParam(
          data['dosage_amount'],
          ParamType.int,
          false,
        ),
        pillCount: deserializeParam(
          data['pill_count'],
          ParamType.int,
          false,
        ),
        pillDosageCount: deserializeParam(
          data['pill_dosage_count'],
          ParamType.int,
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
      );

  @override
  String toString() => 'MedInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MedInfoStruct &&
        medicationName == other.medicationName &&
        dosageAmount == other.dosageAmount &&
        pillCount == other.pillCount &&
        pillDosageCount == other.pillDosageCount &&
        withFood == other.withFood &&
        listEquality.equals(whenToTake, other.whenToTake) &&
        pillWeight == other.pillWeight &&
        pillBottleWeight == other.pillBottleWeight &&
        pedestalInfo == other.pedestalInfo;
  }

  @override
  int get hashCode => const ListEquality().hash([
        medicationName,
        dosageAmount,
        pillCount,
        pillDosageCount,
        withFood,
        whenToTake,
        pillWeight,
        pillBottleWeight,
        pedestalInfo
      ]);
}

MedInfoStruct createMedInfoStruct({
  String? medicationName,
  int? dosageAmount,
  int? pillCount,
  int? pillDosageCount,
  bool? withFood,
  String? pillWeight,
  String? pillBottleWeight,
  BTDeviceStruct? pedestalInfo,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MedInfoStruct(
      medicationName: medicationName,
      dosageAmount: dosageAmount,
      pillCount: pillCount,
      pillDosageCount: pillDosageCount,
      withFood: withFood,
      pillWeight: pillWeight,
      pillBottleWeight: pillBottleWeight,
      pedestalInfo:
          pedestalInfo ?? (clearUnsetFields ? BTDeviceStruct() : null),
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
