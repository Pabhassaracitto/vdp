import 'dart:convert';
import 'dart:io';

import 'package:vdp_app/data/models/citta_model.dart';
import 'package:vdp_app/data/models/cetasika_model.dart';
import 'package:vdp_app/core/validators/data_validator.dart';

void main() async {
  print('Start testing...');
  final stopWatch = Stopwatch()..start();

  try {
    final cittasRaw = await File('assets/data/cittas_sample.json').readAsString();
    final decodedCittas = json.decode(cittasRaw);
    final listCittas = (decodedCittas as Map<String, dynamic>)['cittas'] as List;
    final cittas = <CittaModel>[];
    for (var item in listCittas) {
      cittas.add(CittaModel.fromJson(item as Map<String, dynamic>));
    }
    print('Cittas parsed: ${cittas.length}');

    final cetasikasRaw = await File('assets/data/cetasikas.json').readAsString();
    final decodedCetasikas = json.decode(cetasikasRaw);
    final listCetasikas = (decodedCetasikas as Map<String, dynamic>)['cetasikas'] as List;
    final cetasikas = <CetasikaModel>[];
    for (var item in listCetasikas) {
      cetasikas.add(CetasikaModel.fromJson(item as Map<String, dynamic>));
    }
    print('Cetasikas parsed: ${cetasikas.length}');

    final validation = VdpDataValidator.validateAll(cittas: cittas, cetasikas: cetasikas);
    print('Validation done. Is valid: ${validation.isValid}');
  } catch (e, st) {
    print('Error: $e\n$st');
  }

  print('Total time: ${stopWatch.elapsedMilliseconds} ms');
}
