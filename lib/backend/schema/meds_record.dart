import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedsRecord extends FirestoreRecord {
  MedsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "medication_name" field.
  String? _medicationName;
  String get medicationName => _medicationName ?? '';
  bool hasMedicationName() => _medicationName != null;

  // "dosage_amount" field.
  int? _dosageAmount;
  int get dosageAmount => _dosageAmount ?? 0;
  bool hasDosageAmount() => _dosageAmount != null;

  // "pill_count" field.
  int? _pillCount;
  int get pillCount => _pillCount ?? 0;
  bool hasPillCount() => _pillCount != null;

  // "pill_dosage_count" field.
  int? _pillDosageCount;
  int get pillDosageCount => _pillDosageCount ?? 0;
  bool hasPillDosageCount() => _pillDosageCount != null;

  // "with_food" field.
  bool? _withFood;
  bool get withFood => _withFood ?? false;
  bool hasWithFood() => _withFood != null;

  // "userID" field.
  DocumentReference? _userID;
  DocumentReference? get userID => _userID;
  bool hasUserID() => _userID != null;

  // "pedestal_info" field.
  BTDeviceStruct? _pedestalInfo;
  BTDeviceStruct get pedestalInfo => _pedestalInfo ?? BTDeviceStruct();
  bool hasPedestalInfo() => _pedestalInfo != null;

  // "pill_weight" field.
  String? _pillWeight;
  String get pillWeight => _pillWeight ?? '';
  bool hasPillWeight() => _pillWeight != null;

  // "pill_weight_double" field.
  double? _pillWeightDouble;
  double get pillWeightDouble => _pillWeightDouble ?? 0.0;
  bool hasPillWeightDouble() => _pillWeightDouble != null;

  // "pill_bottle_weight" field.
  double? _pillBottleWeight;
  double get pillBottleWeight => _pillBottleWeight ?? 0.0;
  bool hasPillBottleWeight() => _pillBottleWeight != null;

  // "when_to_take" field.
  List<MedTimeStruct>? _whenToTake;
  List<MedTimeStruct> get whenToTake => _whenToTake ?? const [];
  bool hasWhenToTake() => _whenToTake != null;

  void _initializeFields() {
    _medicationName = snapshotData['medication_name'] as String?;
    _dosageAmount = castToType<int>(snapshotData['dosage_amount']);
    _pillCount = castToType<int>(snapshotData['pill_count']);
    _pillDosageCount = castToType<int>(snapshotData['pill_dosage_count']);
    _withFood = snapshotData['with_food'] as bool?;
    _userID = snapshotData['userID'] as DocumentReference?;
    _pedestalInfo = BTDeviceStruct.maybeFromMap(snapshotData['pedestal_info']);
    _pillWeight = snapshotData['pill_weight'] as String?;
    _pillWeightDouble = castToType<double>(snapshotData['pill_weight_double']);
    _pillBottleWeight = castToType<double>(snapshotData['pill_bottle_weight']);
    _whenToTake = getStructList(
      snapshotData['when_to_take'],
      MedTimeStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('meds');

  static Stream<MedsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MedsRecord.fromSnapshot(s));

  static Future<MedsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MedsRecord.fromSnapshot(s));

  static MedsRecord fromSnapshot(DocumentSnapshot snapshot) => MedsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MedsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MedsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MedsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MedsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMedsRecordData({
  String? medicationName,
  int? dosageAmount,
  int? pillCount,
  int? pillDosageCount,
  bool? withFood,
  DocumentReference? userID,
  BTDeviceStruct? pedestalInfo,
  String? pillWeight,
  double? pillWeightDouble,
  double? pillBottleWeight,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'medication_name': medicationName,
      'dosage_amount': dosageAmount,
      'pill_count': pillCount,
      'pill_dosage_count': pillDosageCount,
      'with_food': withFood,
      'userID': userID,
      'pedestal_info': BTDeviceStruct().toMap(),
      'pill_weight': pillWeight,
      'pill_weight_double': pillWeightDouble,
      'pill_bottle_weight': pillBottleWeight,
    }.withoutNulls,
  );

  // Handle nested data for "pedestal_info" field.
  addBTDeviceStructData(firestoreData, pedestalInfo, 'pedestal_info');

  return firestoreData;
}

class MedsRecordDocumentEquality implements Equality<MedsRecord> {
  const MedsRecordDocumentEquality();

  @override
  bool equals(MedsRecord? e1, MedsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.medicationName == e2?.medicationName &&
        e1?.dosageAmount == e2?.dosageAmount &&
        e1?.pillCount == e2?.pillCount &&
        e1?.pillDosageCount == e2?.pillDosageCount &&
        e1?.withFood == e2?.withFood &&
        e1?.userID == e2?.userID &&
        e1?.pedestalInfo == e2?.pedestalInfo &&
        e1?.pillWeight == e2?.pillWeight &&
        e1?.pillWeightDouble == e2?.pillWeightDouble &&
        e1?.pillBottleWeight == e2?.pillBottleWeight &&
        listEquality.equals(e1?.whenToTake, e2?.whenToTake);
  }

  @override
  int hash(MedsRecord? e) => const ListEquality().hash([
        e?.medicationName,
        e?.dosageAmount,
        e?.pillCount,
        e?.pillDosageCount,
        e?.withFood,
        e?.userID,
        e?.pedestalInfo,
        e?.pillWeight,
        e?.pillWeightDouble,
        e?.pillBottleWeight,
        e?.whenToTake
      ]);

  @override
  bool isValidKey(Object? o) => o is MedsRecord;
}
