import 'package:a2z/models/word.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dictionary.g.dart';

@JsonSerializable(nullable: false)
class Dictionary {
  final String title;
  final List<Word> words;

  Dictionary(this.title, this.words);

  factory Dictionary.fromJson(Map<String, dynamic> json) =>
      _$DictionaryFromJson(json);
  Map<String, dynamic> toJson() => _$DictionaryToJson(this);
}
