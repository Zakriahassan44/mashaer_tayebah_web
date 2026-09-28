import 'package:flutter/material.dart';
import '../content.dart';
import '../theme.dart';
import 'common.dart';

/// Saari gallery images ke paths ek jagah.
/// Files: assets/images/work/a.jpg ... z.jpg, aa.jpg, ab.jpg, ac.jpg
class GalleryImages {
  GalleryImages._();

  static const String _basePath = 'assets/images/work';

  static final List<String> all = [
    ...'abcdefghijklmnopqrstuvwxyz'.split(''),
    'aa',
    'ab',
    'ac',
  ].map((name) => '$_basePath/$name.jpg').toList();
}

class GallerySection extends StatelessWidget {
  final bool isArabic;
  const GallerySection({super.key, required this.isArabic});

  Widget _img(String path, {double? height}) => ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: Image.asset(
      path,
      fit: BoxFit.cover,
      height: height,
      width: double.infinity,
      cacheWidth: 800,
      errorBuilder: (_, __, ___) => Container(
        color: AppColors.line,
        child: const Icon(Icons.broken_image_outlined, color: AppColors.muted),
      ),
    ),
  );

  Widget _pair(String left, String right) => Row(
    children: [
      Expanded(child: Padding(padding: const EdgeInsets.only(right: 8), child: _img(left))),
      Expanded(child: Padding(padding: const EdgeInsets.only(left: 8), child: _img(right))),
    ],
  );

  Widget _grid(List<String> paths, int columns) => GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: paths.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: columns,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
    ),
    itemBuilder: (_, i) => _img(paths[i]),
  );

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final narrow = width <= Breakpoints.mobile;
    final images = GalleryImages.all;
    final featured = images.take(7).toList();
    final rest = images.skip(7).toList();

    return Container(
      color: AppColors.cream2,
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: SiteContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Content.galleryKicker.of(isArabic),
              style: const TextStyle(color: AppColors.goldDark, fontWeight: FontWeight.w700, fontSize: 14),
            ),
            const SizedBox(height: 10),
            Text(
              Content.galleryTitle.of(isArabic),
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 32),
            if (narrow)
              _grid(images, 2)
            else ...[
              SizedBox(
                height: 460,
                child: Row(
                  children: [
                    Expanded(flex: 2, child: _img(featured[0], height: 460)),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Expanded(child: _pair(featured[1], featured[2])),
                          const SizedBox(height: 16),
                          Expanded(child: _pair(featured[3], featured[4])),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(height: 220, child: _pair(featured[5], featured[6])),
              const SizedBox(height: 16),
              _grid(rest, 4),
            ],
          ],
        ),
      ),
    );
  }
}

class CtaSection extends StatelessWidget {
  final bool isArabic;
  const CtaSection({super.key, required this.isArabic});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.ink,
      padding: const EdgeInsets.symmetric(vertical: 90, horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Column(
            children: [
              Text(
                Content.ctaKicker.of(isArabic),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Color(0xFFC9BFAE), fontSize: 15),
              ),
              const SizedBox(height: 10),
              Text(
                Content.ctaTitle.of(isArabic),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Color(0xFFF4EDE0), fontSize: 30, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 36),
              InkWell(
                onTap: () => launchUrlSafely(Content.phoneTel),
                child: Text(
                  Content.phoneDisplay,
                  textDirection: TextDirection.ltr,
                  style: const TextStyle(color: AppColors.gold, fontSize: 34, fontWeight: FontWeight.w900),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                Content.ctaAddress.of(isArabic),
                style: const TextStyle(color: Color(0xFFC9BFAE), fontSize: 15),
              ),
              const SizedBox(height: 32),
              PrimaryButton(
                label: Content.ctaButton.of(isArabic),
                onTap: () => launchUrlSafely(Content.whatsappUrl),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SiteFooter extends StatelessWidget {
  final bool isArabic;
  const SiteFooter({super.key, required this.isArabic});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 28),
      decoration: const BoxDecoration(border: Border(top: BorderSide(color: AppColors.line))),
      child: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(Content.footerName.of(isArabic), style: const TextStyle(color: AppColors.muted, fontSize: 13)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text('•', style: TextStyle(color: AppColors.muted)),
            ),
            Text(Content.footerCity.of(isArabic), style: const TextStyle(color: AppColors.muted, fontSize: 13)),
          ],
        ),
      ),
    );
  }
}