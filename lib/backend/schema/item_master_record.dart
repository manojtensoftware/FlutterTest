import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

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

  static ItemMasterRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
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
