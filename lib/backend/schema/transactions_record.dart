import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'transactions_record.g.dart';

abstract class TransactionsRecord
    implements Built<TransactionsRecord, TransactionsRecordBuilder> {
  static Serializer<TransactionsRecord> get serializer =>
      _$transactionsRecordSerializer;

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
  @BuiltValueField(wireName: 'User_ref')
  DocumentReference get userRef;

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
  double billAmount,
  String voucherNo,
  String voucherType,
  double walletAmount,
  DocumentReference userRef,
}) =>
    serializers.toFirestore(
        TransactionsRecord.serializer,
        TransactionsRecord((t) => t
          ..billAmount = billAmount
          ..voucherNo = voucherNo
          ..voucherType = voucherType
          ..walletAmount = walletAmount
          ..userRef = userRef));
