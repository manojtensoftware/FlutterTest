import 'dart:async';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong/latlong.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'latestvideos_record.g.dart';

abstract class LatestvideosRecord
    implements Built<LatestvideosRecord, LatestvideosRecordBuilder> {
  static Serializer<LatestvideosRecord> get serializer =>
      _$latestvideosRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Title_name')
  String get titleName;

  @nullable
  @BuiltValueField(wireName: 'Path')
  String get path;

  @nullable
  @BuiltValueField(wireName: 'Category')
  String get category;

  @nullable
  @BuiltValueField(wireName: 'Creation_date')
  DateTime get creationDate;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(LatestvideosRecordBuilder builder) => builder
    ..titleName = ''
    ..path = ''
    ..category = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Latestvideos');

  static Stream<LatestvideosRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  LatestvideosRecord._();
  factory LatestvideosRecord(
          [void Function(LatestvideosRecordBuilder) updates]) =
      _$LatestvideosRecord;

  static LatestvideosRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createLatestvideosRecordData({
  String titleName,
  String path,
  String category,
  DateTime creationDate,
}) =>
    serializers.toFirestore(
        LatestvideosRecord.serializer,
        LatestvideosRecord((l) => l
          ..titleName = titleName
          ..path = path
          ..category = category
          ..creationDate = creationDate));

LatestvideosRecord get dummyLatestvideosRecord {
  final builder = LatestvideosRecordBuilder()
    ..titleName = dummyString
    ..path = dummyVideoPath
    ..category = dummyString
    ..creationDate = dummyTimestamp;
  return builder.build();
}

List<LatestvideosRecord> createDummyLatestvideosRecord({int count}) =>
    List.generate(count, (_) => dummyLatestvideosRecord);
