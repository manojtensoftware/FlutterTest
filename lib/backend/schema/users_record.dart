import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong/latlong.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'pass_word')
  String get passWord;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  @BuiltValueField(wireName: 'dob_day')
  String get dobDay;

  @nullable
  @BuiltValueField(wireName: 'dob_month')
  String get dobMonth;

  @nullable
  @BuiltValueField(wireName: 'doa_day')
  String get doaDay;

  @nullable
  @BuiltValueField(wireName: 'doa_month')
  String get doaMonth;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..passWord = ''
    ..uid = ''
    ..phoneNumber = ''
    ..dobDay = ''
    ..dobMonth = ''
    ..doaDay = ''
    ..doaMonth = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;
}

Map<String, dynamic> createUsersRecordData({
  String email,
  String displayName,
  String photoUrl,
  DateTime createdTime,
  String passWord,
  String uid,
  String phoneNumber,
  String dobDay,
  String dobMonth,
  String doaDay,
  String doaMonth,
}) =>
    serializers.toFirestore(
        UsersRecord.serializer,
        UsersRecord((u) => u
          ..email = email
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..createdTime = createdTime
          ..passWord = passWord
          ..uid = uid
          ..phoneNumber = phoneNumber
          ..dobDay = dobDay
          ..dobMonth = dobMonth
          ..doaDay = doaDay
          ..doaMonth = doaMonth));

UsersRecord get dummyUsersRecord {
  final builder = UsersRecordBuilder()
    ..email = dummyString
    ..displayName = dummyString
    ..photoUrl = dummyImagePath
    ..createdTime = dummyTimestamp
    ..passWord = dummyString
    ..uid = dummyString
    ..phoneNumber = dummyString
    ..dobDay = dummyString
    ..dobMonth = dummyString
    ..doaDay = dummyString
    ..doaMonth = dummyString;
  return builder.build();
}

List<UsersRecord> createDummyUsersRecord({int count}) =>
    List.generate(count, (_) => dummyUsersRecord);
