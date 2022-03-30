// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      id: json['id'] as String?,
      titre: json['titre'] as String,
      description: json['description'] as String,
      date: json['date'] as String?,
      lieu: json['lieu'] as String,
      idCreateur: json['idCreateur'] as String,
      token: json['token'] as String?,
      createdAt: json['createdAt'] as String?,
      updateAt: json['updateAt'] as String?,
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'id': instance.id,
      'titre': instance.titre,
      'description': instance.description,
      'date': instance.date,
      'lieu': instance.lieu,
      'idCreateur': instance.idCreateur,
      'token': instance.token,
      'createdAt': instance.createdAt,
      'updateAt': instance.updateAt,
    };
