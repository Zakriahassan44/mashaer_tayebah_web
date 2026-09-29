import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mashaer_tayebah_web/content.dart';
import 'package:mashaer_tayebah_web/widgets/gallery_cta_footer.dart';

void main() {
  group('L', () {
    test('returns the Arabic or English text', () {
      const text = L('عربي', 'English');
      expect(text.of(true), 'عربي');
      expect(text.of(false), 'English');
    });
  });

  group('Content.productOrderUrl', () {
    test('targets the shop WhatsApp number and carries the product name', () {
      final url = Content.productOrderUrl('Premium Interior Paint', false);

      expect(url, startsWith('https://wa.me/966508185486?text='));
      expect(url, contains(Uri.encodeComponent('Premium Interior Paint')));
    });
  });

  group('Assets', () {
    // A wrong file name only shows up at runtime on the deployed site, so
    // check every referenced image exists before we ever push.
    test('every product, service and gallery image exists on disk', () {
      final paths = <String>[
        'assets/images/hero.jpg',
        'assets/images/colour-swatches.jpg',
        ...Content.products.map((p) => p.image),
        ...Content.services.map((s) => s.image),
        ...GalleryImages.all,
      ];

      final missing = paths.where((p) => !File(p).existsSync()).toList();
      expect(missing, isEmpty);
    });
  });
}
