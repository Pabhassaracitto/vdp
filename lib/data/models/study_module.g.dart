// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'study_module.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudyModuleImpl _$$StudyModuleImplFromJson(Map<String, dynamic> json) =>
    _$StudyModuleImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      titlePali: json['titlePali'] as String,
      description: json['description'] as String,
      prerequisiteIds: (json['prerequisiteIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      cittaIds: (json['cittaIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      cetasikaIds: (json['cetasikaIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      kammaIds: (json['kammaIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      paticcaIds: (json['paticcaIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      rupaIds: (json['rupaIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      vithiIds: (json['vithiIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      recommendedOrder: (json['recommendedOrder'] as num).toInt(),
      colorCode: (json['colorCode'] as num).toInt(),
      icon: json['icon'] as String,
      isRequired: json['isRequired'] as bool? ?? false,
      phase: (json['phase'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$$StudyModuleImplToJson(_$StudyModuleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'titlePali': instance.titlePali,
      'description': instance.description,
      'prerequisiteIds': instance.prerequisiteIds,
      'cittaIds': instance.cittaIds,
      'cetasikaIds': instance.cetasikaIds,
      'kammaIds': instance.kammaIds,
      'paticcaIds': instance.paticcaIds,
      'rupaIds': instance.rupaIds,
      'vithiIds': instance.vithiIds,
      'recommendedOrder': instance.recommendedOrder,
      'colorCode': instance.colorCode,
      'icon': instance.icon,
      'isRequired': instance.isRequired,
      'phase': instance.phase,
    };
