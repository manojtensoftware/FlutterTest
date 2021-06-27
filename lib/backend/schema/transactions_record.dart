import 'dart:async';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong/latlong.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'transactions_record.g.dart';

abstract class TransactionsRecord
    implements Built<TransactionsRecord, TransactionsRecordBuilder> {
  static Serializer<TransactionsRecord> get serializer =>
      _$transactionsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'User_ref')
  DocumentReference get userRef;

  @nullable
  @BuiltValueField(wireName: 'bill_amount')
  double get billAmount;

  @nullable
  @BuiltValueField(wireName: 'voucher_no')
  String get voucherNo;

  @nullable
  @BuiltValueField(wireName: 'voucher_type')
  String get voucherType;

  @nullable
  @BuiltValueField(wireName: 'wallet_amount')
  double get walletAmount;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TransactionsRecordBuilder builder) => builder
    ..billAmount = 0.0
    ..voucherNo = ''
    ..voucherType = ''
    ..walletAmount = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Transactions');

  static Stream<TransactionsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  TransactionsRecord._();
  factory TransactionsRecord(
          [void Function(TransactionsRecordBuilder) updates]) =
      _$TransactionsRecord;

  static TransactionsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createTransactionsRecordData({
  DocumentReference userRef,
  double billAmount,
  String voucherNo,
  String voucherType,
  double walletAmount,
}) =>
    serializers.toFirestore(
        TransactionsRecord.serializer,
        TransactionsRecord((t) => t
          ..userRef = userRef
          ..billAmount = billAmount
          ..voucherNo = voucherNo
          ..voucherType = voucherType
          ..walletAmount = walletAmount));

TransactionsRecord get dummyTransactionsRecord {
  final builder = TransactionsRecordBuilder()
    ..billAmount = dummyDouble
    ..voucherNo = dummyString
    ..voucherType = dummyString
    ..walletAmount = dummyDouble;
  return builder.build();
}

List<TransactionsRecord> createDummyTransactionsRecord({int count}) =>
    List.generate(count, (_) => dummyTransactionsRecord);
