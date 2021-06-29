import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'special_coupon_record.g.dart';

abstract class SpecialCouponRecord
    implements Built<SpecialCouponRecord, SpecialCouponRecordBuilder> {
  static Serializer<SpecialCouponRecord> get serializer =>
      _$specialCouponRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'user_ref')
  DocumentReference get userRef;

  @nullable
  @BuiltValueField(wireName: 'coupon_code')
  String get couponCode;

  @nullable
  @BuiltValueField(wireName: 'coupon_value')
  int get couponValue;

  @nullable
  @BuiltValueField(wireName: 'coupon_percent')
  int get couponPercent;

  @nullable
  @BuiltValueField(wireName: 'expiry_date')
  DateTime get expiryDate;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(SpecialCouponRecordBuilder builder) => builder
    ..couponCode = ''
    ..couponValue = 0
    ..couponPercent = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Special_coupon');

  static Stream<SpecialCouponRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  SpecialCouponRecord._();
  factory SpecialCouponRecord(
          [void Function(SpecialCouponRecordBuilder) updates]) =
      _$SpecialCouponRecord;

  static SpecialCouponRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createSpecialCouponRecordData({
  DocumentReference userRef,
  String couponCode,
  int couponValue,
  int couponPercent,
  DateTime expiryDate,
}) =>
    serializers.toFirestore(
        SpecialCouponRecord.serializer,
        SpecialCouponRecord((s) => s
          ..userRef = userRef
          ..couponCode = couponCode
          ..couponValue = couponValue
          ..couponPercent = couponPercent
          ..expiryDate = expiryDate));
