// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MusicResponse _$MusicResponseFromJson(Map<String, dynamic> json) =>
    MusicResponse()
      ..listData = (json['music'] as List<dynamic>?)
          ?.map((e) => MusicModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$MusicResponseToJson(MusicResponse instance) =>
    <String, dynamic>{
      'music': instance.listData,
    };
