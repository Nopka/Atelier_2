// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      id: json['id'] as int?,
      titre: json['titre'] as String,
      description: json['description'] as String,
      date: DateTime.parse(json['date'] as String),
      lieu: json['lieu'] as String,
      idCreateur: json['idCreateur'] as String,
      token: json['token'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updateAt: json['updateAt'] == null
          ? null
          : DateTime.parse(json['updateAt'] as String),
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'id': instance.id,
      'titre': instance.titre,
      'description': instance.description,
      'date': instance.date?.toIso8601String(),
      'lieu': instance.lieu,
      'idCreateur': instance.idCreateur,
      'token': instance.token,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updateAt': instance.updateAt?.toIso8601String(),
    };
