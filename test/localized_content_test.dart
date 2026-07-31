import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vdp_app/core/localization/content_catalog.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('English content overlay covers canonical doctrine collections', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final catalog = await container.read(contentCatalogProvider('en').future);
    expect(catalog.locale, 'en');
    expect(catalog.data['cittas'], hasLength(121));
    expect(catalog.data['cetasikas'], hasLength(52));
    expect(catalog.data['rupas'], hasLength(28));
    expect(catalog.data['kammas'], hasLength(12));
    expect(catalog.data['paticcas'], hasLength(12));
    expect(catalog.data['vithis'], hasLength(4));
    expect(catalog.data['studyModules'], hasLength(10));
  });

  test('content selection changes text without changing canonical IDs', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final catalog = await container.read(contentCatalogProvider('en').future);

    expect(
      catalog.text('cittas', 'CI_001', 'name', 'Tâm Tham'),
      contains('consciousness'),
    );
    expect(
      catalog.text('cetasikas', 'CS_PHASSA', 'name', 'Xúc'),
      'Contact',
    );
    expect(
      catalog.text('paticcas', 'PD_01', 'name', 'Vô Minh'),
      'Ignorance',
    );
  });
}
