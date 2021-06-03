import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ProductCategoryRecordBuilder builder) =>
      builder
        ..categoryName = ''
        ..catImageUrl = ''
        ..isActive = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('product_category');

  static Stream<ProductCategoryRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ProductCategoryRecord._();
  factory ProductCategoryRecord(
          [void Function(ProductCategoryRecordBuilder) updates]) =
      _$ProductCategoryRecord;
}

Map<String, dynamic> createProductCategoryRecordData({
  String categoryName,
  String catImageUrl,
  bool isActive,
}) =>
    serializers.serializeWith(
        ProductCategoryRecord.serializer,
        ProductCategoryRecord((p) => p
          ..categoryName = categoryName
          ..catImageUrl = catImageUrl
          ..isActive = isActive));

ProductCategoryRecord get dummyProductCategoryRecord {
  final builder = ProductCategoryRecordBuilder()
    ..categoryName = dummyString
    ..catImageUrl = dummyImagePath
    ..isActive = dummyBoolean;
  return builder.build();
}

List<ProductCategoryRecord> createDummyProductCategoryRecord({int count}) =>
    List.generate(count, (_) => dummyProductCategoryRecord);
