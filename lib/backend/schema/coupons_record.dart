import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'coupons_record.g.dart';

abstract class CouponsRecord
    implements Built<CouponsRecord, CouponsRecordBuilder> {
  static Serializer<CouponsRecord> get serializer => _$couponsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'coupon_category')
  String get couponCategory;

  @nullable
  @BuiltValueField(wireName: 'image_path')
  String get imagePath;

  @nullable
  @BuiltValueField(wireName: 'creation_date')
  DateTime get creationDate;

  @nullable
  @BuiltValueField(wireName: 'coupon_code')
  String get couponCode;

  @nullable
  @BuiltValueField(wireName: 'Likedby')
  BuiltList<DocumentReference> get likedby;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CouponsRecordBuilder builder) => builder
    ..couponCategory = ''
    ..imagePath = ''
    ..couponCode = ''
    ..likedby = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Coupons');

  static Stream<CouponsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  CouponsRecord._();
  factory CouponsRecord([void Function(CouponsRecordBuilder) updates]) =
      _$CouponsRecord;

  static CouponsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createCouponsRecordData({
  String couponCategory,
  String imagePath,
  DateTime creationDate,
  String couponCode,
}) =>
    serializers.toFirestore(
        CouponsRecord.serializer,
        CouponsRecord((c) => c
          ..couponCategory = couponCategory
          ..imagePath = imagePath
          ..creationDate = creationDate
          ..couponCode = couponCode
          ..likedby = null));
