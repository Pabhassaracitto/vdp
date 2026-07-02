// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kamma_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KammaModelImpl _$$KammaModelImplFromJson(Map<String, dynamic> json) =>
    _$KammaModelImpl(
      id: json['id'] as String,
      namePali: json['namePali'] as String,
      nameVietnamese: json['nameVietnamese'] as String,
      nameShort: json['nameShort'] as String,
      byTime: $enumDecodeNullable(_$KammaByTimeEnumMap, json['byTime']),
      byFunction:
          $enumDecodeNullable(_$KammaByFunctionEnumMap, json['byFunction']),
      byPriority:
          $enumDecodeNullable(_$KammaByPriorityEnumMap, json['byPriority']),
      byResult: $enumDecodeNullable(_$KammaByResultEnumMap, json['byResult']),
      orderIndex: (json['orderIndex'] as num).toInt(),
      descriptionVi: json['descriptionVi'] as String,
      examples: (json['examples'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      relatedCittaIds: (json['relatedCittaIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      doctrinalNote: json['doctrinalNote'] as String?,
    );

Map<String, dynamic> _$$KammaModelImplToJson(_$KammaModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'namePali': instance.namePali,
      'nameVietnamese': instance.nameVietnamese,
      'nameShort': instance.nameShort,
      'byTime': _$KammaByTimeEnumMap[instance.byTime],
      'byFunction': _$KammaByFunctionEnumMap[instance.byFunction],
      'byPriority': _$KammaByPriorityEnumMap[instance.byPriority],
      'byResult': _$KammaByResultEnumMap[instance.byResult],
      'orderIndex': instance.orderIndex,
      'descriptionVi': instance.descriptionVi,
      'examples': instance.examples,
      'relatedCittaIds': instance.relatedCittaIds,
      'doctrinalNote': instance.doctrinalNote,
    };

const _$KammaByTimeEnumMap = {
  KammaByTime.ditthadhammavedaniya: 'ditthadhammavedaniya',
  KammaByTime.upapajjavedaniya: 'upapajjavedaniya',
  KammaByTime.aparapariyavedaniya: 'aparapariyavedaniya',
  KammaByTime.ahosi: 'ahosi',
};

const _$KammaByFunctionEnumMap = {
  KammaByFunction.janaka: 'janaka',
  KammaByFunction.upatthambhaka: 'upatthambhaka',
  KammaByFunction.upapilaka: 'upapilaka',
  KammaByFunction.upaghataka: 'upaghataka',
};

const _$KammaByPriorityEnumMap = {
  KammaByPriority.garuka: 'garuka',
  KammaByPriority.asanna: 'asanna',
  KammaByPriority.acinna: 'acinna',
  KammaByPriority.katatta: 'katatta',
};

const _$KammaByResultEnumMap = {
  KammaByResult.akusala: 'akusala',
  KammaByResult.kusalaDuggati: 'kusala_duggati',
  KammaByResult.kusalaUggata: 'kusala_uggata',
  KammaByResult.lokuttara: 'lokuttara',
};
