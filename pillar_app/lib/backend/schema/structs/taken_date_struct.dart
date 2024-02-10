// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TakenDateStruct extends FFFirebaseStruct {
  TakenDateStruct({
    DateTime? takenDate,
    bool? manualSubmission,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _takenDate = takenDate,
        _manualSubmission = manualSubmission,
        super(firestoreUtilData);

  // "taken_date" field.
  DateTime? _takenDate;
  DateTime? get takenDate => _takenDate;
  set takenDate(DateTime? val) => _takenDate = val;
  bool hasTakenDate() => _takenDate != null;

  // "manual_submission" field.
  bool? _manualSubmission;
  bool get manualSubmission => _manualSubmission ?? false;
  set manualSubmission(bool? val) => _manualSubmission = val;
  bool hasManualSubmission() => _manualSubmission != null;

  static TakenDateStruct fromMap(Map<String, dynamic> data) => TakenDateStruct(
        takenDate: data['taken_date'] as DateTime?,
        manualSubmission: data['manual_submission'] as bool?,
      );

  static TakenDateStruct? maybeFromMap(dynamic data) => data is Map
      ? TakenDateStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'taken_date': _takenDate,
        'manual_submission': _manualSubmission,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'taken_date': serializeParam(
          _takenDate,
          ParamType.DateTime,
        ),
        'manual_submission': serializeParam(
          _manualSubmission,
          ParamType.bool,
        ),
      }.withoutNulls;

  static TakenDateStruct fromSerializableMap(Map<String, dynamic> data) =>
      TakenDateStruct(
        takenDate: deserializeParam(
          data['taken_date'],
          ParamType.DateTime,
          false,
        ),
        manualSubmission: deserializeParam(
          data['manual_submission'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'TakenDateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TakenDateStruct &&
        takenDate == other.takenDate &&
        manualSubmission == other.manualSubmission;
  }

  @override
  int get hashCode => const ListEquality().hash([takenDate, manualSubmission]);
}

TakenDateStruct createTakenDateStruct({
  DateTime? takenDate,
  bool? manualSubmission,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TakenDateStruct(
      takenDate: takenDate,
      manualSubmission: manualSubmission,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TakenDateStruct? updateTakenDateStruct(
  TakenDateStruct? takenDateStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    takenDateStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTakenDateStructData(
  Map<String, dynamic> firestoreData,
  TakenDateStruct? takenDateStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (takenDateStruct == null) {
    return;
  }
  if (takenDateStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && takenDateStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final takenDateStructData =
      getTakenDateFirestoreData(takenDateStruct, forFieldValue);
  final nestedData =
      takenDateStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = takenDateStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTakenDateFirestoreData(
  TakenDateStruct? takenDateStruct, [
  bool forFieldValue = false,
]) {
  if (takenDateStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(takenDateStruct.toMap());

  // Add any Firestore field values
  takenDateStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTakenDateListFirestoreData(
  List<TakenDateStruct>? takenDateStructs,
) =>
    takenDateStructs?.map((e) => getTakenDateFirestoreData(e, true)).toList() ??
    [];
