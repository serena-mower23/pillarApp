import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedicationTimesRecord extends FirestoreRecord {
  MedicationTimesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "monday" field.
  bool? _monday;
  bool get monday => _monday ?? false;
  bool hasMonday() => _monday != null;

  // "tuesday" field.
  bool? _tuesday;
  bool get tuesday => _tuesday ?? false;
  bool hasTuesday() => _tuesday != null;

  // "wednesday" field.
  bool? _wednesday;
  bool get wednesday => _wednesday ?? false;
  bool hasWednesday() => _wednesday != null;

  // "thursday" field.
  bool? _thursday;
  bool get thursday => _thursday ?? false;
  bool hasThursday() => _thursday != null;

  // "friday" field.
  bool? _friday;
  bool get friday => _friday ?? false;
  bool hasFriday() => _friday != null;

  // "saturday" field.
  bool? _saturday;
  bool get saturday => _saturday ?? false;
  bool hasSaturday() => _saturday != null;

  // "sunday" field.
  bool? _sunday;
  bool get sunday => _sunday ?? false;
  bool hasSunday() => _sunday != null;

  // "medID" field.
  DocumentReference? _medID;
  DocumentReference? get medID => _medID;
  bool hasMedID() => _medID != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _monday = snapshotData['monday'] as bool?;
    _tuesday = snapshotData['tuesday'] as bool?;
    _wednesday = snapshotData['wednesday'] as bool?;
    _thursday = snapshotData['thursday'] as bool?;
    _friday = snapshotData['friday'] as bool?;
    _saturday = snapshotData['saturday'] as bool?;
    _sunday = snapshotData['sunday'] as bool?;
    _medID = snapshotData['medID'] as DocumentReference?;
    _time = snapshotData['time'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('medicationTimes')
          : FirebaseFirestore.instance.collectionGroup('medicationTimes');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('medicationTimes').doc();

  static Stream<MedicationTimesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MedicationTimesRecord.fromSnapshot(s));

  static Future<MedicationTimesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MedicationTimesRecord.fromSnapshot(s));

  static MedicationTimesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MedicationTimesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MedicationTimesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MedicationTimesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MedicationTimesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MedicationTimesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMedicationTimesRecordData({
  bool? monday,
  bool? tuesday,
  bool? wednesday,
  bool? thursday,
  bool? friday,
  bool? saturday,
  bool? sunday,
  DocumentReference? medID,
  DateTime? time,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'monday': monday,
      'tuesday': tuesday,
      'wednesday': wednesday,
      'thursday': thursday,
      'friday': friday,
      'saturday': saturday,
      'sunday': sunday,
      'medID': medID,
      'time': time,
    }.withoutNulls,
  );

  return firestoreData;
}

class MedicationTimesRecordDocumentEquality
    implements Equality<MedicationTimesRecord> {
  const MedicationTimesRecordDocumentEquality();

  @override
  bool equals(MedicationTimesRecord? e1, MedicationTimesRecord? e2) {
    return e1?.monday == e2?.monday &&
        e1?.tuesday == e2?.tuesday &&
        e1?.wednesday == e2?.wednesday &&
        e1?.thursday == e2?.thursday &&
        e1?.friday == e2?.friday &&
        e1?.saturday == e2?.saturday &&
        e1?.sunday == e2?.sunday &&
        e1?.medID == e2?.medID &&
        e1?.time == e2?.time;
  }

  @override
  int hash(MedicationTimesRecord? e) => const ListEquality().hash([
        e?.monday,
        e?.tuesday,
        e?.wednesday,
        e?.thursday,
        e?.friday,
        e?.saturday,
        e?.sunday,
        e?.medID,
        e?.time
      ]);

  @override
  bool isValidKey(Object? o) => o is MedicationTimesRecord;
}
