import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong/latlong.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'item_master_record.g.dart';

abstract class ItemMasterRecord
    implements Built<ItemMasterRecord, ItemMasterRecordBuilder> {
  static Serializer<ItemMasterRecord> get serializer =>
      _$itemMasterRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'item_name')
  String get itemName;

  @nullable
  DocumentReference get cid;

  @nullable
  @BuiltValueField(wireName: 'Rate')
  double get rate;

  @nullable
  double get mrp;

  @nullable
  double get disc;

  @nullable
  @BuiltValueField(wireName: 'is_active')
  bool get isActive;

  @nullable
  @BuiltValueField(wireName: 'item_img_url')
  String get itemImgUrl;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ItemMasterRecordBuilder builder) => builder
    ..itemName = ''
    ..rate = 0.0
    ..mrp = 0.0
    ..disc = 0.0
    ..isActive = false
    ..itemImgUrl = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('item_master');

  static Stream<ItemMasterRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ItemMasterRecord._();
  factory ItemMasterRecord([void Function(ItemMasterRecordBuilder) updates]) =
      _$ItemMasterRecord;
}

Map<String, dynamic> createItemMasterRecordData({
  String itemName,
  DocumentReference cid,
  double rate,
  double mrp,
  double disc,
  bool isActive,
  String itemImgUrl,
}) =>
    serializers.toFirestore(
        ItemMasterRecord.serializer,
        ItemMasterRecord((i) => i
          ..itemName = itemName
          ..cid = cid
          ..rate = rate
          ..mrp = mrp
          ..disc = disc
          ..isActive = isActive
          ..itemImgUrl = itemImgUrl));

ItemMasterRecord get dummyItemMasterRecord {
  final builder = ItemMasterRecordBuilder()
    ..itemName = dummyString
    ..rate = dummyDouble
    ..mrp = dummyDouble
    ..disc = dummyDouble
    ..isActive = dummyBoolean
    ..itemImgUrl = dummyImagePath;
  return builder.build();
}

List<ItemMasterRecord> createDummyItemMasterRecord({int count}) =>
    List.generate(count, (_) => dummyItemMasterRecord);
