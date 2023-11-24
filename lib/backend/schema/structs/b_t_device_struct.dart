// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BTDeviceStruct extends FFFirebaseStruct {
  BTDeviceStruct({
    String? name,
    String? id,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _id = id,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  static BTDeviceStruct fromMap(Map<String, dynamic> data) => BTDeviceStruct(
        name: data['name'] as String?,
        id: data['id'] as String?,
      );

  static BTDeviceStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? BTDeviceStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
      }.withoutNulls;

  static BTDeviceStruct fromSerializableMap(Map<String, dynamic> data) =>
      BTDeviceStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BTDeviceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BTDeviceStruct && name == other.name && id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([name, id]);
}

BTDeviceStruct createBTDeviceStruct({
  String? name,
  String? id,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BTDeviceStruct(
      name: name,
      id: id,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BTDeviceStruct? updateBTDeviceStruct(
  BTDeviceStruct? bTDevice, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    bTDevice
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBTDeviceStructData(
  Map<String, dynamic> firestoreData,
  BTDeviceStruct? bTDevice,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (bTDevice == null) {
    return;
  }
  if (bTDevice.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && bTDevice.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final bTDeviceData = getBTDeviceFirestoreData(bTDevice, forFieldValue);
  final nestedData = bTDeviceData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = bTDevice.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBTDeviceFirestoreData(
  BTDeviceStruct? bTDevice, [
  bool forFieldValue = false,
]) {
  if (bTDevice == null) {
    return {};
  }
  final firestoreData = mapToFirestore(bTDevice.toMap());

  // Add any Firestore field values
  bTDevice.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBTDeviceListFirestoreData(
  List<BTDeviceStruct>? bTDevices,
) =>
    bTDevices?.map((e) => getBTDeviceFirestoreData(e, true)).toList() ?? [];
