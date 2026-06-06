// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cetasika_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConflictRuleImpl _$$ConflictRuleImplFromJson(Map<String, dynamic> json) =>
    _$ConflictRuleImpl(
      ruleId: json['ruleId'] as String,
      type: $enumDecode(_$ConflictTypeEnumMap, json['type']),
      conflictingIds: (json['conflictingIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      explanation: json['explanation'] as String,
      explanationPali: json['explanationPali'] as String?,
    );

Map<String, dynamic> _$$ConflictRuleImplToJson(_$ConflictRuleImpl instance) =>
    <String, dynamic>{
      'ruleId': instance.ruleId,
      'type': _$ConflictTypeEnumMap[instance.type]!,
      'conflictingIds': instance.conflictingIds,
      'explanation': instance.explanation,
      'explanationPali': instance.explanationPali,
    };

const _$ConflictTypeEnumMap = {
  ConflictType.pair: 'pair',
  ConflictType.triple: 'triple',
  ConflictType.bhumi: 'bhumi',
  ConflictType.causal: 'causal',
};

_$CetasikaModelImpl _$$CetasikaModelImplFromJson(Map<String, dynamic> json) =>
    _$CetasikaModelImpl(
      id: json['id'] as String,
      namePali: json['namePali'] as String,
      nameVietnamese: json['nameVietnamese'] as String,
      nameShort: json['nameShort'] as String,
      group: $enumDecode(_$CetasikaGroupEnumMap, json['group']),
      akusalaSubGroup: $enumDecodeNullable(
          _$AkusalaSubGroupEnumMap, json['akusalaSubGroup']),
      sobhanaSubGroup: $enumDecodeNullable(
          _$SobhanaSubGroupEnumMap, json['sobhanaSubGroup']),
      traditionalOrder: (json['traditionalOrder'] as num).toInt(),
      ipaTranscription: json['ipaTranscription'] as String?,
      audioPronunciation: json['audioPronunciation'] as String?,
      descriptionVi: json['descriptionVi'] as String,
      descriptionPali: json['descriptionPali'] as String?,
      conflictRules: (json['conflictRules'] as List<dynamic>?)
              ?.map((e) => ConflictRule.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      symbol: json['symbol'] as String,
      colorCode: (json['colorCode'] as num).toInt(),
    );

Map<String, dynamic> _$$CetasikaModelImplToJson(_$CetasikaModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'namePali': instance.namePali,
      'nameVietnamese': instance.nameVietnamese,
      'nameShort': instance.nameShort,
      'group': _$CetasikaGroupEnumMap[instance.group]!,
      'akusalaSubGroup': _$AkusalaSubGroupEnumMap[instance.akusalaSubGroup],
      'sobhanaSubGroup': _$SobhanaSubGroupEnumMap[instance.sobhanaSubGroup],
      'traditionalOrder': instance.traditionalOrder,
      'ipaTranscription': instance.ipaTranscription,
      'audioPronunciation': instance.audioPronunciation,
      'descriptionVi': instance.descriptionVi,
      'descriptionPali': instance.descriptionPali,
      'conflictRules': instance.conflictRules,
      'symbol': instance.symbol,
      'colorCode': instance.colorCode,
    };

const _$CetasikaGroupEnumMap = {
  CetasikaGroup.sabbacittasadharana: 'sabbacittasadharana',
  CetasikaGroup.pakinnaka: 'pakinnaka',
  CetasikaGroup.akusala: 'akusala',
  CetasikaGroup.sobhana: 'sobhana',
};

const _$AkusalaSubGroupEnumMap = {
  AkusalaSubGroup.mohaGroup: 'moha_group',
  AkusalaSubGroup.lobhaGroup: 'lobha_group',
  AkusalaSubGroup.dosaGroup: 'dosa_group',
  AkusalaSubGroup.thinaGroup: 'thina_group',
  AkusalaSubGroup.vicikiccha: 'vicikiccha',
};

const _$SobhanaSubGroupEnumMap = {
  SobhanaSubGroup.sobhanaSadharana: 'sobhana_sadharana',
  SobhanaSubGroup.viriyaGroup: 'viriya_group',
  SobhanaSubGroup.appamanna: 'appamanna',
  SobhanaSubGroup.panna: 'panna',
};
