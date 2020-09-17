// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Word _$WordFromJson(Map<String, dynamic> json) {
  return Word(
    json['name'] as String,
    json['letter'] as String,
    json['definition'] as String,
    json['question'] as String,
  );
}

Map<String, dynamic> _$WordToJson(Word instance) => <String, dynamic>{
      'name': instance.name,
      'letter': instance.letter,
      'definition': instance.definition,
      'question': instance.question,
    };
