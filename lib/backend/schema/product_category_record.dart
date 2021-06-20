import 'dart:async';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong/latlong.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'product_category_record.g.dart';

abstract class ProductCategoryRecord
    implements Built<ProductCategoryRecord, ProductCategoryRecordBuilder> {
  static Serializer<ProductCategoryRecord> get serializer =>
      _$productCategoryRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'category_name')
  String get categoryName;

  @nullable
  @BuiltValueField(wireName: 'cat_image_url')
  String get catImageUrl;

  @nullable
  @BuiltValueField(wireName: 'is_active')
  bool get isActive;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ProductCategoryRecordBuilder builder) =>
      builder
        ..categoryName = ''
        ..catImageUrl = ''
        ..isActive = false
        ..email = ''
        ..displayName = ''
        ..photoUrl = ''
        ..uid = ''
        ..phoneNumber = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('product_category');

  static Stream<ProductCategoryRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ProductCategoryRecord._();
  factory ProductCategoryRecord(
          [void Function(ProductCategoryRecordBuilder) updates]) =
      _$ProductCategoryRecord;

  static ProductCategoryRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createProductCategoryRecordData({
  String categoryName,
  String catImageUrl,
  bool isActive,
  String email,
  String displayName,
  String photoUrl,
  String uid,
  DateTime createdTime,
  String phoneNumber,
}) =>
    serializers.toFirestore(
        ProductCategoryRecord.serializer,
        ProductCategoryRecord((p) => p
          ..categoryName = categoryName
          ..catImageUrl = catImageUrl
          ..isActive = isActive
          ..email = email
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..uid = uid
          ..createdTime = createdTime
          ..phoneNumber = phoneNumber));

ProductCategoryRecord get dummyProductCategoryRecord {
  final builder = ProductCategoryRecordBuilder()
    ..categoryName = dummyString
    ..catImageUrl = dummyImagePath
    ..isActive = dummyBoolean
    ..email = dummyString
    ..displayName = dummyString
    ..photoUrl = dummyImagePath
    ..uid = dummyString
    ..createdTime = dummyTimestamp
    ..phoneNumber = dummyString;
  return builder.build();
}

List<ProductCategoryRecord> createDummyProductCategoryRecord({int count}) =>
    List.generate(count, (_) => dummyProductCategoryRecord);
