// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'citta_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CetasikaAssociationImpl _$$CetasikaAssociationImplFromJson(
        Map<String, dynamic> json) =>
    _$CetasikaAssociationImpl(
      cetasikaId: json['cetasikaId'] as String,
      type: $enumDecode(_$AssociationTypeEnumMap, json['type']),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$CetasikaAssociationImplToJson(
        _$CetasikaAssociationImpl instance) =>
    <String, dynamic>{
      'cetasikaId': instance.cetasikaId,
      'type': _$AssociationTypeEnumMap[instance.type]!,
      'note': instance.note,
    };

const _$AssociationTypeEnumMap = {
  AssociationType.always: 'always',
  AssociationType.sometimes: 'sometimes',
  AssociationType.never: 'never',
};

_$VatthurSacaImpl _$$VatthurSacaImplFromJson(Map<String, dynamic> json) =>
    _$VatthurSacaImpl(
      vattuId: json['vattuId'] as String,
      rupaSampayutta: (json['rupaSampayutta'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$VatthurSacaImplToJson(_$VatthurSacaImpl instance) =>
    <String, dynamic>{
      'vattuId': instance.vattuId,
      'rupaSampayutta': instance.rupaSampayutta,
    };

_$CittaModelImpl _$$CittaModelImplFromJson(Map<String, dynamic> json) =>
    _$CittaModelImpl(
      id: json['id'] as String,
      namePali: json['namePali'] as String,
      nameVietnamese: json['nameVietnamese'] as String,
      bhumiGroup: $enumDecode(_$BhumiGroupEnumMap, json['bhumiGroup']),
      function: $enumDecode(_$CittaFunctionEnumMap, json['function']),
      vedana: $enumDecode(_$VedanaEnumMap, json['vedana']),
      cetasikaAssociations: (json['cetasikaAssociations'] as List<dynamic>)
          .map((e) => CetasikaAssociation.fromJson(e as Map<String, dynamic>))
          .toList(),
      kammaLinks: (json['kammaLinks'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      vatthurSaca: json['vatthurSaca'] == null
          ? null
          : VatthurSaca.fromJson(json['vatthurSaca'] as Map<String, dynamic>),
      moduleId: json['moduleId'] as String,
      orderIndex: (json['orderIndex'] as num).toInt(),
      doctrinalNote: json['doctrinalNote'] as String?,
      examples: (json['examples'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$CittaModelImplToJson(_$CittaModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'namePali': instance.namePali,
      'nameVietnamese': instance.nameVietnamese,
      'bhumiGroup': _$BhumiGroupEnumMap[instance.bhumiGroup]!,
      'function': _$CittaFunctionEnumMap[instance.function]!,
      'vedana': _$VedanaEnumMap[instance.vedana]!,
      'cetasikaAssociations': instance.cetasikaAssociations,
      'kammaLinks': instance.kammaLinks,
      'vatthurSaca': instance.vatthurSaca,
      'moduleId': instance.moduleId,
      'orderIndex': instance.orderIndex,
      'doctrinalNote': instance.doctrinalNote,
      'examples': instance.examples,
    };

const _$BhumiGroupEnumMap = {
  BhumiGroup.akusala: 'akusala',
  BhumiGroup.ahetuka: 'ahetuka',
  BhumiGroup.sobhanaKamavacara: 'sobhana_kamavacara',
  BhumiGroup.rupavacara: 'rupavacara',
  BhumiGroup.arupavacara: 'arupavacara',
  BhumiGroup.lokuttara: 'lokuttara',
};

const _$CittaFunctionEnumMap = {
  CittaFunction.vipaka: 'vipaka',
  CittaFunction.kiriya: 'kiriya',
  CittaFunction.kusala: 'kusala',
  CittaFunction.akusala: 'akusala',
};

const _$VedanaEnumMap = {
  Vedana.pleasant: 'pleasant',
  Vedana.unpleasant: 'unpleasant',
  Vedana.neutral: 'neutral',
  Vedana.joy: 'joy',
};
