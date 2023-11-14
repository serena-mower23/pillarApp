// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedInfoStruct extends FFFirebaseStruct {
  MedInfoStruct({
    String? medicationName,
    DocumentReference? medID,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _medicationName = medicationName,
        _medID = medID,
        super(firestoreUtilData);

  // "medication_name" field.
  String? _medicationName;
  String get medicationName => _medicationName ?? '';
  set medicationName(String? val) => _medicationName = val;
  bool hasMedicationName() => _medicationName != null;

  // "medID" field.
  DocumentReference? _medID;
  DocumentReference? get medID => _medID;
  set medID(DocumentReference? val) => _medID = val;
  bool hasMedID() => _medID != null;

  static MedInfoStruct fromMap(Map<String, dynamic> data) => MedInfoStruct(
        medicationName: data['medication_name'] as String?,
        medID: data['medID'] as DocumentReference?,
      );

  static MedInfoStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? MedInfoStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'medication_name': _medicationName,
        'medID': _medID,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'medication_name': serializeParam(
          _medicationName,
          ParamType.String,
        ),
        'medID': serializeParam(
          _medID,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static MedInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      MedInfoStruct(
        medicationName: deserializeParam(
          data['medication_name'],
          ParamType.String,
          false,
        ),
        medID: deserializeParam(
          data['medID'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users', 'medications'],
        ),
      );

  @override
  String toString() => 'MedInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MedInfoStruct &&
        medicationName == other.medicationName &&
        medID == other.medID;
  }

  @override
  int get hashCode => const ListEquality().hash([medicationName, medID]);
}

MedInfoStruct createMedInfoStruct({
  String? medicationName,
  DocumentReference? medID,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MedInfoStruct(
      medicationName: medicationName,
      medID: medID,
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

  // Add any Firestore field values
  medInfo.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMedInfoListFirestoreData(
  List<MedInfoStruct>? medInfos,
) =>
    medInfos?.map((e) => getMedInfoFirestoreData(e, true)).toList() ?? [];
