import 'package:json_annotation/json_annotation.dart';
import 'package:musicapi_flutter/model/music_model.dart';

part 'music_response.g.dart';

@JsonSerializable()
class MusicResponse {
  @JsonKey(name: 'music')
  List<MusicModel>? listData;

  MusicResponse();

  factory MusicResponse.fromJson(Map<String, dynamic> json) =>
      _$MusicResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MusicResponseToJson(this);
}
