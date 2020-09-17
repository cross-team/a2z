// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dictionary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dictionary _$DictionaryFromJson(Map<String, dynamic> json) {
  return Dictionary(
    json['title'] as String,
    (json['words'] as List)
        .map((e) => Word.fromJson(Map<String, String>.from(e as Map)))
        .toList(),
  );
}

Map<String, dynamic> _$DictionaryToJson(Dictionary instance) =>
    <String, dynamic>{
      'title': instance.title,
      'words': instance.words,
    };
