import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class LocalidadesRecord extends FirestoreRecord {
  LocalidadesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "ciudad" field.
  LatLng? _ciudad;
  LatLng? get ciudad => _ciudad;
  bool hasCiudad() => _ciudad != null;

  void _initializeFields() {
    _ciudad = snapshotData['ciudad'] as LatLng?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('localidades');

  static Stream<LocalidadesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LocalidadesRecord.fromSnapshot(s));

  static Future<LocalidadesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LocalidadesRecord.fromSnapshot(s));

  static LocalidadesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LocalidadesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LocalidadesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LocalidadesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LocalidadesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LocalidadesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLocalidadesRecordData({
  LatLng? ciudad,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ciudad': ciudad,
    }.withoutNulls,
  );

  return firestoreData;
}

class LocalidadesRecordDocumentEquality implements Equality<LocalidadesRecord> {
  const LocalidadesRecordDocumentEquality();

  @override
  bool equals(LocalidadesRecord? e1, LocalidadesRecord? e2) {
    return e1?.ciudad == e2?.ciudad;
  }

  @override
  int hash(LocalidadesRecord? e) => const ListEquality().hash([e?.ciudad]);

  @override
  bool isValidKey(Object? o) => o is LocalidadesRecord;
}
