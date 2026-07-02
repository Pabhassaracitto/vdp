// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vithi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VithiStepImpl _$$VithiStepImplFromJson(Map<String, dynamic> json) =>
    _$VithiStepImpl(
      stepNumber: (json['stepNumber'] as num).toInt(),
      role: $enumDecode(_$VithiStepRoleEnumMap, json['role']),
      namePali: json['namePali'] as String,
      nameVietnamese: json['nameVietnamese'] as String,
      description: json['description'] as String,
      allowedCittaIds: (json['allowedCittaIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      repeatCount: (json['repeatCount'] as num?)?.toInt() ?? 1,
      isOptional: json['isOptional'] as bool? ?? false,
      doctrinalNote: json['doctrinalNote'] as String?,
    );

Map<String, dynamic> _$$VithiStepImplToJson(_$VithiStepImpl instance) =>
    <String, dynamic>{
      'stepNumber': instance.stepNumber,
      'role': _$VithiStepRoleEnumMap[instance.role]!,
      'namePali': instance.namePali,
      'nameVietnamese': instance.nameVietnamese,
      'description': instance.description,
      'allowedCittaIds': instance.allowedCittaIds,
      'repeatCount': instance.repeatCount,
      'isOptional': instance.isOptional,
      'doctrinalNote': instance.doctrinalNote,
    };

const _$VithiStepRoleEnumMap = {
  VithiStepRole.bhavangaSota: 'bhavanga_sota',
  VithiStepRole.bhavangaCalana: 'bhavanga_calana',
  VithiStepRole.bhavangupaccheda: 'bhavangupaccheda',
  VithiStepRole.pancaDvaravajjana: 'panca_dvaravajjana',
  VithiStepRole.dvipancaVinnana: 'dvipanca_vinnana',
  VithiStepRole.sampatiCchana: 'sampati_cchana',
  VithiStepRole.santiRana: 'santi_rana',
  VithiStepRole.vottHapana: 'vott_hapana',
  VithiStepRole.javana: 'javana',
  VithiStepRole.tadAramana: 'tada_aramana',
  VithiStepRole.manoDvaravajjana: 'mano_dvaravajjana',
  VithiStepRole.patisandhi: 'patisandhi',
  VithiStepRole.cuti: 'cuti',
};

_$VithiModelImpl _$$VithiModelImplFromJson(Map<String, dynamic> json) =>
    _$VithiModelImpl(
      id: json['id'] as String,
      namePali: json['namePali'] as String,
      nameVietnamese: json['nameVietnamese'] as String,
      nameShort: json['nameShort'] as String,
      dvara: $enumDecode(_$VithiDvaraEnumMap, json['dvara']),
      vithiType: $enumDecode(_$VithiTypeEnumMap, json['vithiType']),
      descriptionVi: json['descriptionVi'] as String,
      totalSteps: (json['totalSteps'] as num).toInt(),
      steps: (json['steps'] as List<dynamic>)
          .map((e) => VithiStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      arisingCondition: json['arisingCondition'] as String?,
      significance: json['significance'] as String?,
      doctrinalNote: json['doctrinalNote'] as String?,
      orderIndex: (json['orderIndex'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$VithiModelImplToJson(_$VithiModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'namePali': instance.namePali,
      'nameVietnamese': instance.nameVietnamese,
      'nameShort': instance.nameShort,
      'dvara': _$VithiDvaraEnumMap[instance.dvara]!,
      'vithiType': _$VithiTypeEnumMap[instance.vithiType]!,
      'descriptionVi': instance.descriptionVi,
      'totalSteps': instance.totalSteps,
      'steps': instance.steps,
      'arisingCondition': instance.arisingCondition,
      'significance': instance.significance,
      'doctrinalNote': instance.doctrinalNote,
      'orderIndex': instance.orderIndex,
    };

const _$VithiDvaraEnumMap = {
  VithiDvara.panca: 'panca',
  VithiDvara.mano: 'mano',
  VithiDvara.vithimutta: 'vithimutta',
};

const _$VithiTypeEnumMap = {
  VithiType.atimahanta: 'atimahanta',
  VithiType.mahanta: 'mahanta',
  VithiType.paritta: 'paritta',
  VithiType.atiparitta: 'atiparittā',
  VithiType.manoVithi: 'mano_vithi',
  VithiType.vithimutta: 'vithimutta',
  VithiType.appana: 'appana',
  VithiType.lokuttara: 'lokuttara',
};
