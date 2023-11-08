// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedicationStruct extends FFFirebaseStruct {
  MedicationStruct({
    String? medicationName,
    String? dosageAmount,
    String? pillCount,
    String? pillDosageCount,
    bool? withFood,
    String? pedestalID,
    List<DateTime>? whenToTake,
    double? pillWeight,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _medicationName = medicationName,
        _dosageAmount = dosageAmount,
        _pillCount = pillCount,
        _pillDosageCount = pillDosageCount,
        _withFood = withFood,
        _pedestalID = pedestalID,
        _whenToTake = whenToTake,
        _pillWeight = pillWeight,
        super(firestoreUtilData);

  // "medication_name" field.
  String? _medicationName;
  String get medicationName => _medicationName ?? '';
  set medicationName(String? val) => _medicationName = val;
  bool hasMedicationName() => _medicationName != null;

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

  // "pill_dosage_count" field.
  String? _pillDosageCount;
  String get pillDosageCount => _pillDosageCount ?? '';
  set pillDosageCount(String? val) => _pillDosageCount = val;
  bool hasPillDosageCount() => _pillDosageCount != null;

  // "with_food" field.
  bool? _withFood;
  bool get withFood => _withFood ?? false;
  set withFood(bool? val) => _withFood = val;
  bool hasWithFood() => _withFood != null;

  // "pedestalID" field.
  String? _pedestalID;
  String get pedestalID => _pedestalID ?? '';
  set pedestalID(String? val) => _pedestalID = val;
  bool hasPedestalID() => _pedestalID != null;

  // "when_to_take" field.
  List<DateTime>? _whenToTake;
  List<DateTime> get whenToTake => _whenToTake ?? const [];
  set whenToTake(List<DateTime>? val) => _whenToTake = val;
  void updateWhenToTake(Function(List<DateTime>) updateFn) =>
      updateFn(_whenToTake ??= []);
  bool hasWhenToTake() => _whenToTake != null;

  // "pill_weight" field.
  double? _pillWeight;
  double get pillWeight => _pillWeight ?? 0.0;
  set pillWeight(double? val) => _pillWeight = val;
  void incrementPillWeight(double amount) => _pillWeight = pillWeight + amount;
  bool hasPillWeight() => _pillWeight != null;

  static MedicationStruct fromMap(Map<String, dynamic> data) =>
      MedicationStruct(
        medicationName: data['medication_name'] as String?,
        dosageAmount: data['dosage_amount'] as String?,
        pillCount: data['pill_count'] as String?,
        pillDosageCount: data['pill_dosage_count'] as String?,
        withFood: data['with_food'] as bool?,
        pedestalID: data['pedestalID'] as String?,
        whenToTake: getDataList(data['when_to_take']),
        pillWeight: castToType<double>(data['pill_weight']),
      );

  static MedicationStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? MedicationStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'medication_name': _medicationName,
        'dosage_amount': _dosageAmount,
        'pill_count': _pillCount,
        'pill_dosage_count': _pillDosageCount,
        'with_food': _withFood,
        'pedestalID': _pedestalID,
        'when_to_take': _whenToTake,
        'pill_weight': _pillWeight,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'medication_name': serializeParam(
          _medicationName,
          ParamType.String,
        ),
        'dosage_amount': serializeParam(
          _dosageAmount,
          ParamType.String,
        ),
        'pill_count': serializeParam(
          _pillCount,
          ParamType.String,
        ),
        'pill_dosage_count': serializeParam(
          _pillDosageCount,
          ParamType.String,
        ),
        'with_food': serializeParam(
          _withFood,
          ParamType.bool,
        ),
        'pedestalID': serializeParam(
          _pedestalID,
          ParamType.String,
        ),
        'when_to_take': serializeParam(
          _whenToTake,
          ParamType.DateTime,
          true,
        ),
        'pill_weight': serializeParam(
          _pillWeight,
          ParamType.double,
        ),
      }.withoutNulls;

  static MedicationStruct fromSerializableMap(Map<String, dynamic> data) =>
      MedicationStruct(
        medicationName: deserializeParam(
          data['medication_name'],
          ParamType.String,
          false,
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
        pillDosageCount: deserializeParam(
          data['pill_dosage_count'],
          ParamType.String,
          false,
        ),
        withFood: deserializeParam(
          data['with_food'],
          ParamType.bool,
          false,
        ),
        pedestalID: deserializeParam(
          data['pedestalID'],
          ParamType.String,
          false,
        ),
        whenToTake: deserializeParam<DateTime>(
          data['when_to_take'],
          ParamType.DateTime,
          true,
        ),
        pillWeight: deserializeParam(
          data['pill_weight'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'MedicationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MedicationStruct &&
        medicationName == other.medicationName &&
        dosageAmount == other.dosageAmount &&
        pillCount == other.pillCount &&
        pillDosageCount == other.pillDosageCount &&
        withFood == other.withFood &&
        pedestalID == other.pedestalID &&
        listEquality.equals(whenToTake, other.whenToTake) &&
        pillWeight == other.pillWeight;
  }

  @override
  int get hashCode => const ListEquality().hash([
        medicationName,
        dosageAmount,
        pillCount,
        pillDosageCount,
        withFood,
        pedestalID,
        whenToTake,
        pillWeight
      ]);
}

MedicationStruct createMedicationStruct({
  String? medicationName,
  String? dosageAmount,
  String? pillCount,
  String? pillDosageCount,
  bool? withFood,
  String? pedestalID,
  double? pillWeight,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MedicationStruct(
      medicationName: medicationName,
      dosageAmount: dosageAmount,
      pillCount: pillCount,
      pillDosageCount: pillDosageCount,
      withFood: withFood,
      pedestalID: pedestalID,
      pillWeight: pillWeight,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MedicationStruct? updateMedicationStruct(
  MedicationStruct? medication, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    medication
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMedicationStructData(
  Map<String, dynamic> firestoreData,
  MedicationStruct? medication,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (medication == null) {
    return;
  }
  if (medication.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && medication.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final medicationData = getMedicationFirestoreData(medication, forFieldValue);
  final nestedData = medicationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = medication.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMedicationFirestoreData(
  MedicationStruct? medication, [
  bool forFieldValue = false,
]) {
  if (medication == null) {
    return {};
  }
  final firestoreData = mapToFirestore(medication.toMap());

  // Add any Firestore field values
  medication.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMedicationListFirestoreData(
  List<MedicationStruct>? medications,
) =>
    medications?.map((e) => getMedicationFirestoreData(e, true)).toList() ?? [];