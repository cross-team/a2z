import 'package:json_annotation/json_annotation.dart';

part 'word.g.dart';

@JsonSerializable(nullable: false)
class Word {
  final String name;
  final String letter;
  final String definition;
  final String question;

  Word(this.name, this.letter, this.definition, this.question);

  factory Word.fromJson(Map<String, dynamic> json) => _$WordFromJson(json);
  Map<String, String> toJson() => _$WordToJson(this);
}
