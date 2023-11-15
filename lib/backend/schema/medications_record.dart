import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedicationsRecord extends FirestoreRecord {
  MedicationsRecord._(
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

  // "medID" field.
  String? _medID;
  String get medID => _medID ?? '';
  bool hasMedID() => _medID != null;

  // "pedestalInfo" field.
  BTDeviceStruct? _pedestalInfo;
  BTDeviceStruct get pedestalInfo => _pedestalInfo ?? BTDeviceStruct();
  bool hasPedestalInfo() => _pedestalInfo != null;

  // "pill_weight" field.
  String? _pillWeight;
  String get pillWeight => _pillWeight ?? '';
  bool hasPillWeight() => _pillWeight != null;

  // "pill_bottle_weight" field.
  String? _pillBottleWeight;
  String get pillBottleWeight => _pillBottleWeight ?? '';
  bool hasPillBottleWeight() => _pillBottleWeight != null;

  // "when_to_take" field.
  List<MedTimeStruct>? _whenToTake;
  List<MedTimeStruct> get whenToTake => _whenToTake ?? const [];
  bool hasWhenToTake() => _whenToTake != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _medicationName = snapshotData['medication_name'] as String?;
    _dosageAmount = castToType<int>(snapshotData['dosage_amount']);
    _pillCount = castToType<int>(snapshotData['pill_count']);
    _pillDosageCount = castToType<int>(snapshotData['pill_dosage_count']);
    _withFood = snapshotData['with_food'] as bool?;
    _userID = snapshotData['userID'] as DocumentReference?;
    _medID = snapshotData['medID'] as String?;
    _pedestalInfo = BTDeviceStruct.maybeFromMap(snapshotData['pedestalInfo']);
    _pillWeight = snapshotData['pill_weight'] as String?;
    _pillBottleWeight = snapshotData['pill_bottle_weight'] as String?;
    _whenToTake = getStructList(
      snapshotData['when_to_take'],
      MedTimeStruct.fromMap,
    );
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('medications')
          : FirebaseFirestore.instance.collectionGroup('medications');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('medications').doc();

  static Stream<MedicationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MedicationsRecord.fromSnapshot(s));

  static Future<MedicationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MedicationsRecord.fromSnapshot(s));

  static MedicationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MedicationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MedicationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MedicationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MedicationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MedicationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMedicationsRecordData({
  String? medicationName,
  int? dosageAmount,
  int? pillCount,
  int? pillDosageCount,
  bool? withFood,
  DocumentReference? userID,
  String? medID,
  BTDeviceStruct? pedestalInfo,
  String? pillWeight,
  String? pillBottleWeight,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'medication_name': medicationName,
      'dosage_amount': dosageAmount,
      'pill_count': pillCount,
      'pill_dosage_count': pillDosageCount,
      'with_food': withFood,
      'userID': userID,
      'medID': medID,
      'pedestalInfo': BTDeviceStruct().toMap(),
      'pill_weight': pillWeight,
      'pill_bottle_weight': pillBottleWeight,
    }.withoutNulls,
  );

  // Handle nested data for "pedestalInfo" field.
  addBTDeviceStructData(firestoreData, pedestalInfo, 'pedestalInfo');

  return firestoreData;
}

class MedicationsRecordDocumentEquality implements Equality<MedicationsRecord> {
  const MedicationsRecordDocumentEquality();

  @override
  bool equals(MedicationsRecord? e1, MedicationsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.medicationName == e2?.medicationName &&
        e1?.dosageAmount == e2?.dosageAmount &&
        e1?.pillCount == e2?.pillCount &&
        e1?.pillDosageCount == e2?.pillDosageCount &&
        e1?.withFood == e2?.withFood &&
        e1?.userID == e2?.userID &&
        e1?.medID == e2?.medID &&
        e1?.pedestalInfo == e2?.pedestalInfo &&
        e1?.pillWeight == e2?.pillWeight &&
        e1?.pillBottleWeight == e2?.pillBottleWeight &&
        listEquality.equals(e1?.whenToTake, e2?.whenToTake);
  }

  @override
  int hash(MedicationsRecord? e) => const ListEquality().hash([
        e?.medicationName,
        e?.dosageAmount,
        e?.pillCount,
        e?.pillDosageCount,
        e?.withFood,
        e?.userID,
        e?.medID,
        e?.pedestalInfo,
        e?.pillWeight,
        e?.pillBottleWeight,
        e?.whenToTake
      ]);

  @override
  bool isValidKey(Object? o) => o is MedicationsRecord;
}
