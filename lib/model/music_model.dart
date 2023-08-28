import 'package:json_annotation/json_annotation.dart';
part 'music_model.g.dart';

@JsonSerializable()
class MusicModel {
  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'title')
  String? title;

  MusicModel();

  factory MusicModel.fromJson(Map<String, dynamic> json) =>
      _$MusicModelFromJson(json);

  Map<String, dynamic> toJson() => _$MusicModelToJson(this);
}
