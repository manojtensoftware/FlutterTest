import 'dart:async';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong/latlong.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'branch_record.g.dart';

abstract class BranchRecord
    implements Built<BranchRecord, BranchRecordBuilder> {
  static Serializer<BranchRecord> get serializer => _$branchRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Branch_name')
  String get branchName;

  @nullable
  @BuiltValueField(wireName: 'Branch_image')
  String get branchImage;

  @nullable
  @BuiltValueField(wireName: 'Branch_city')
  String get branchCity;

  @nullable
  @BuiltValueField(wireName: 'Branch_contact')
  String get branchContact;

  @nullable
  @BuiltValueField(wireName: 'Branch_closed')
  bool get branchClosed;

  @nullable
  @BuiltValueField(wireName: 'Branch_lat')
  LatLng get branchLat;

  @nullable
  @BuiltValueField(wireName: 'Branch_lng')
  LatLng get branchLng;

  @nullable
  @BuiltValueField(wireName: 'Branch_timing')
  String get branchTiming;

  @nullable
  @BuiltValueField(wireName: 'Branch_address')
  String get branchAddress;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(BranchRecordBuilder builder) => builder
    ..branchName = ''
    ..branchImage = ''
    ..branchCity = ''
    ..branchContact = ''
    ..branchClosed = false
    ..branchTiming = ''
    ..branchAddress = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Branch');

  static Stream<BranchRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  BranchRecord._();
  factory BranchRecord([void Function(BranchRecordBuilder) updates]) =
      _$BranchRecord;

  static BranchRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createBranchRecordData({
  String branchName,
  String branchImage,
  String branchCity,
  String branchContact,
  bool branchClosed,
  LatLng branchLat,
  LatLng branchLng,
  String branchTiming,
  String branchAddress,
}) =>
    serializers.toFirestore(
        BranchRecord.serializer,
        BranchRecord((b) => b
          ..branchName = branchName
          ..branchImage = branchImage
          ..branchCity = branchCity
          ..branchContact = branchContact
          ..branchClosed = branchClosed
          ..branchLat = branchLat
          ..branchLng = branchLng
          ..branchTiming = branchTiming
          ..branchAddress = branchAddress));

BranchRecord get dummyBranchRecord {
  final builder = BranchRecordBuilder()
    ..branchName = dummyString
    ..branchImage = dummyImagePath
    ..branchCity = dummyString
    ..branchContact = dummyString
    ..branchClosed = dummyBoolean
    ..branchLat = dummyLatLng
    ..branchLng = dummyLatLng
    ..branchTiming = dummyString
    ..branchAddress = dummyString;
  return builder.build();
}

List<BranchRecord> createDummyBranchRecord({int count}) =>
    List.generate(count, (_) => dummyBranchRecord);
