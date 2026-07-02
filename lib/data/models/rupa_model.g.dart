// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rupa_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RupaModelImpl _$$RupaModelImplFromJson(Map<String, dynamic> json) =>
    _$RupaModelImpl(
      id: json['id'] as String,
      namePali: json['namePali'] as String,
      nameVietnamese: json['nameVietnamese'] as String,
      nameShort: json['nameShort'] as String,
      type: $enumDecode(_$RupaTypeEnumMap, json['type']),
      subGroup: $enumDecode(_$RupaSubGroupEnumMap, json['subGroup']),
      traditionalOrder: (json['traditionalOrder'] as num).toInt(),
      causes: (json['causes'] as List<dynamic>)
          .map((e) => $enumDecode(_$RupaCauseEnumMap, e))
          .toList(),
      descriptionVi: json['descriptionVi'] as String,
      descriptionPali: json['descriptionPali'] as String? ?? '',
      trangThai: json['trangThai'] as String?,
      phanSu: json['phanSu'] as String?,
      thanhTuu: json['thanhTuu'] as String?,
      nhanGan: json['nhanGan'] as String?,
      presentInBhumi: (json['presentInBhumi'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const ['all'],
      doctrinalNote: json['doctrinalNote'] as String?,
    );

Map<String, dynamic> _$$RupaModelImplToJson(_$RupaModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'namePali': instance.namePali,
      'nameVietnamese': instance.nameVietnamese,
      'nameShort': instance.nameShort,
      'type': _$RupaTypeEnumMap[instance.type]!,
      'subGroup': _$RupaSubGroupEnumMap[instance.subGroup]!,
      'traditionalOrder': instance.traditionalOrder,
      'causes': instance.causes.map((e) => _$RupaCauseEnumMap[e]!).toList(),
      'descriptionVi': instance.descriptionVi,
      'descriptionPali': instance.descriptionPali,
      'trangThai': instance.trangThai,
      'phanSu': instance.phanSu,
      'thanhTuu': instance.thanhTuu,
      'nhanGan': instance.nhanGan,
      'presentInBhumi': instance.presentInBhumi,
      'doctrinalNote': instance.doctrinalNote,
    };

const _$RupaTypeEnumMap = {
  RupaType.mahaBhuta: 'maha_bhuta',
  RupaType.upada: 'upada',
};

const _$RupaSubGroupEnumMap = {
  RupaSubGroup.pasada: 'pasada',
  RupaSubGroup.gocara: 'gocara',
  RupaSubGroup.bhava: 'bhava',
  RupaSubGroup.hadaya: 'hadaya',
  RupaSubGroup.jivita: 'jivita',
  RupaSubGroup.ahara: 'ahara',
  RupaSubGroup.akasa: 'akasa',
  RupaSubGroup.vinnatti: 'vinnatti',
  RupaSubGroup.vikara: 'vikara',
  RupaSubGroup.lakkhana: 'lakkhana',
  RupaSubGroup.none: 'none',
};

const _$RupaCauseEnumMap = {
  RupaCause.kamma: 'kamma',
  RupaCause.citta: 'citta',
  RupaCause.utu: 'utu',
  RupaCause.ahara: 'ahara',
  RupaCause.none: 'none',
};
