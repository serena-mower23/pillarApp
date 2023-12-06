// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdherenceStatusStruct extends FFFirebaseStruct {
  AdherenceStatusStruct({
    String? status,
    String? newWeight,
    String? newPillCount,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _status = status,
        _newWeight = newWeight,
        _newPillCount = newPillCount,
        super(firestoreUtilData);

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;
  bool hasStatus() => _status != null;

  // "new_weight" field.
  String? _newWeight;
  String get newWeight => _newWeight ?? '';
  set newWeight(String? val) => _newWeight = val;
  bool hasNewWeight() => _newWeight != null;

  // "new_pill_count" field.
  String? _newPillCount;
  String get newPillCount => _newPillCount ?? '';
  set newPillCount(String? val) => _newPillCount = val;
  bool hasNewPillCount() => _newPillCount != null;

  static AdherenceStatusStruct fromMap(Map<String, dynamic> data) =>
      AdherenceStatusStruct(
        status: data['status'] as String?,
        newWeight: data['new_weight'] as String?,
        newPillCount: data['new_pill_count'] as String?,
      );

  static AdherenceStatusStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? AdherenceStatusStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'status': _status,
        'new_weight': _newWeight,
        'new_pill_count': _newPillCount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'new_weight': serializeParam(
          _newWeight,
          ParamType.String,
        ),
        'new_pill_count': serializeParam(
          _newPillCount,
          ParamType.String,
        ),
      }.withoutNulls;

  static AdherenceStatusStruct fromSerializableMap(Map<String, dynamic> data) =>
      AdherenceStatusStruct(
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        newWeight: deserializeParam(
          data['new_weight'],
          ParamType.String,
          false,
        ),
        newPillCount: deserializeParam(
          data['new_pill_count'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AdherenceStatusStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AdherenceStatusStruct &&
        status == other.status &&
        newWeight == other.newWeight &&
        newPillCount == other.newPillCount;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([status, newWeight, newPillCount]);
}

AdherenceStatusStruct createAdherenceStatusStruct({
  String? status,
  String? newWeight,
  String? newPillCount,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AdherenceStatusStruct(
      status: status,
      newWeight: newWeight,
      newPillCount: newPillCount,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AdherenceStatusStruct? updateAdherenceStatusStruct(
  AdherenceStatusStruct? adherenceStatus, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    adherenceStatus
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAdherenceStatusStructData(
  Map<String, dynamic> firestoreData,
  AdherenceStatusStruct? adherenceStatus,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (adherenceStatus == null) {
    return;
  }
  if (adherenceStatus.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && adherenceStatus.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final adherenceStatusData =
      getAdherenceStatusFirestoreData(adherenceStatus, forFieldValue);
  final nestedData =
      adherenceStatusData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = adherenceStatus.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAdherenceStatusFirestoreData(
  AdherenceStatusStruct? adherenceStatus, [
  bool forFieldValue = false,
]) {
  if (adherenceStatus == null) {
    return {};
  }
  final firestoreData = mapToFirestore(adherenceStatus.toMap());

  // Add any Firestore field values
  adherenceStatus.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAdherenceStatusListFirestoreData(
  List<AdherenceStatusStruct>? adherenceStatuss,
) =>
    adherenceStatuss
        ?.map((e) => getAdherenceStatusFirestoreData(e, true))
        .toList() ??
    [];
