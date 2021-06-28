import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'banners_record.g.dart';

abstract class BannersRecord
    implements Built<BannersRecord, BannersRecordBuilder> {
  static Serializer<BannersRecord> get serializer => _$bannersRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'first_banner')
  String get firstBanner;

  @nullable
  @BuiltValueField(wireName: 'second_banner')
  String get secondBanner;

  @nullable
  @BuiltValueField(wireName: 'third_banner')
  String get thirdBanner;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(BannersRecordBuilder builder) => builder
    ..firstBanner = ''
    ..secondBanner = ''
    ..thirdBanner = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('banners');

  static Stream<BannersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  BannersRecord._();
  factory BannersRecord([void Function(BannersRecordBuilder) updates]) =
      _$BannersRecord;

  static BannersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createBannersRecordData({
  String firstBanner,
  String secondBanner,
  String thirdBanner,
}) =>
    serializers.toFirestore(
        BannersRecord.serializer,
        BannersRecord((b) => b
          ..firstBanner = firstBanner
          ..secondBanner = secondBanner
          ..thirdBanner = thirdBanner));
