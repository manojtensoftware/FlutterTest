import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong/latlong.dart';

import 'schema_util.dart';
import 'serializers.dart';

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

BannersRecord get dummyBannersRecord {
  final builder = BannersRecordBuilder()
    ..firstBanner = dummyImagePath
    ..secondBanner = dummyImagePath
    ..thirdBanner = dummyImagePath;
  return builder.build();
}

List<BannersRecord> createDummyBannersRecord({int count}) =>
    List.generate(count, (_) => dummyBannersRecord);
