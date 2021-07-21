import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'follows_record.g.dart';

abstract class FollowsRecord
    implements Built<FollowsRecord, FollowsRecordBuilder> {
  static Serializer<FollowsRecord> get serializer => _$followsRecordSerializer;

  @nullable
  DocumentReference get follower;

  @nullable
  DocumentReference get following;

  @nullable
  @BuiltValueField(wireName: 'follower_profile_pic')
  String get followerProfilePic;

  @nullable
  @BuiltValueField(wireName: 'following_profile_pic')
  String get followingProfilePic;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(FollowsRecordBuilder builder) => builder
    ..followerProfilePic = ''
    ..followingProfilePic = ''
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('follows');

  static Stream<FollowsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  FollowsRecord._();
  factory FollowsRecord([void Function(FollowsRecordBuilder) updates]) =
      _$FollowsRecord;

  static FollowsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createFollowsRecordData({
  DocumentReference follower,
  DocumentReference following,
  String followerProfilePic,
  String followingProfilePic,
  String email,
  String displayName,
  String photoUrl,
  String uid,
  DateTime createdTime,
  String phoneNumber,
}) =>
    serializers.toFirestore(
        FollowsRecord.serializer,
        FollowsRecord((f) => f
          ..follower = follower
          ..following = following
          ..followerProfilePic = followerProfilePic
          ..followingProfilePic = followingProfilePic
          ..email = email
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..uid = uid
          ..createdTime = createdTime
          ..phoneNumber = phoneNumber));
