// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paticca_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaticcaLinkImpl _$$PaticcaLinkImplFromJson(Map<String, dynamic> json) =>
    _$PaticcaLinkImpl(
      causeId: json['causeId'] as String,
      effectId: json['effectId'] as String,
      relationType:
          $enumDecode(_$PaticcaRelationTypeEnumMap, json['relationType']),
      explanation: json['explanation'] as String? ?? '',
      explanationPali: json['explanationPali'] as String?,
    );

Map<String, dynamic> _$$PaticcaLinkImplToJson(_$PaticcaLinkImpl instance) =>
    <String, dynamic>{
      'causeId': instance.causeId,
      'effectId': instance.effectId,
      'relationType': _$PaticcaRelationTypeEnumMap[instance.relationType]!,
      'explanation': instance.explanation,
      'explanationPali': instance.explanationPali,
    };

const _$PaticcaRelationTypeEnumMap = {
  PaticcaRelationType.avijjaSankhara: 'avijja_sankhara',
  PaticcaRelationType.sankharaVinnana: 'sankhara_vinnana',
  PaticcaRelationType.vinnanaNamarupa: 'vinnana_namarupa',
  PaticcaRelationType.namarupaSalayatana: 'namarupa_salayatana',
  PaticcaRelationType.salayatanaPhassa: 'salayatana_phassa',
  PaticcaRelationType.phassaVedana: 'phassa_vedana',
  PaticcaRelationType.vedanaTanha: 'vedana_tanha',
  PaticcaRelationType.tanhaUpadana: 'tanha_upadana',
  PaticcaRelationType.upadanaBhava: 'upadana_bhava',
  PaticcaRelationType.bhavaJati: 'bhava_jati',
  PaticcaRelationType.jatiJaramarana: 'jati_jaramarana',
};

_$PaticcaModelImpl _$$PaticcaModelImplFromJson(Map<String, dynamic> json) =>
    _$PaticcaModelImpl(
      id: json['id'] as String,
      namePali: json['namePali'] as String,
      nameVietnamese: json['nameVietnamese'] as String,
      nameShort: json['nameShort'] as String,
      order: (json['order'] as num).toInt(),
      vatta: $enumDecode(_$PaticcaVattaEnumMap, json['vatta']),
      kiep: $enumDecode(_$PaticcaKiepEnumMap, json['kiep']),
      causeId: json['causeId'] as String?,
      effectId: json['effectId'] as String?,
      descriptionVi: json['descriptionVi'] as String,
      trangThai: json['trangThai'] as String?,
      phanSu: json['phanSu'] as String?,
      thanhTuu: json['thanhTuu'] as String?,
      nhanGan: json['nhanGan'] as String?,
      links: (json['links'] as List<dynamic>?)
              ?.map((e) => PaticcaLink.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      relatedCittaIds: (json['relatedCittaIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      relatedCetasikaIds: (json['relatedCetasikaIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      examples: (json['examples'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      doctrinalNote: json['doctrinalNote'] as String?,
    );

Map<String, dynamic> _$$PaticcaModelImplToJson(_$PaticcaModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'namePali': instance.namePali,
      'nameVietnamese': instance.nameVietnamese,
      'nameShort': instance.nameShort,
      'order': instance.order,
      'vatta': _$PaticcaVattaEnumMap[instance.vatta]!,
      'kiep': _$PaticcaKiepEnumMap[instance.kiep]!,
      'causeId': instance.causeId,
      'effectId': instance.effectId,
      'descriptionVi': instance.descriptionVi,
      'trangThai': instance.trangThai,
      'phanSu': instance.phanSu,
      'thanhTuu': instance.thanhTuu,
      'nhanGan': instance.nhanGan,
      'links': instance.links,
      'relatedCittaIds': instance.relatedCittaIds,
      'relatedCetasikaIds': instance.relatedCetasikaIds,
      'examples': instance.examples,
      'doctrinalNote': instance.doctrinalNote,
    };

const _$PaticcaVattaEnumMap = {
  PaticcaVatta.kilesa: 'kilesa',
  PaticcaVatta.kamma: 'kamma',
  PaticcaVatta.vipaka: 'vipaka',
};

const _$PaticcaKiepEnumMap = {
  PaticcaKiep.past: 'past',
  PaticcaKiep.present: 'present',
  PaticcaKiep.future: 'future',
};
