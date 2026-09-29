import 'package:flutter/material.dart';
import 'theme.dart';
import 'widgets/header.dart';
import 'widgets/hero.dart';
import 'widgets/sections.dart';
import 'widgets/products_section.dart';
import 'widgets/gallery_cta_footer.dart';

void main() {
  runApp(const MashaerApp());
}

class MashaerApp extends StatefulWidget {
  const MashaerApp({super.key});

  @override
  State<MashaerApp> createState() => _MashaerAppState();
}

class _MashaerAppState extends State<MashaerApp> {
  // Defaults to Arabic, same as the reference site.
  bool _isArabic = true;

  void _toggleLang() => setState(() => _isArabic = !_isArabic);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'مشاعر طيبة للتجارة | Mashaer Tayebah',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      // The direction is applied above the Navigator, so popups and dialogs
      // (mobile menu, photo viewer) also follow RTL/LTR correctly.
      builder: (context, child) => Directionality(
        textDirection: _isArabic ? TextDirection.rtl : TextDirection.ltr,
        child: child ?? const SizedBox.shrink(),
      ),
      home: HomePage(isArabic: _isArabic, onToggleLang: _toggleLang),
    );
  }
}

class HomePage extends StatefulWidget {
  final bool isArabic;
  final VoidCallback onToggleLang;

  const HomePage({
    super.key,
    required this.isArabic,
    required this.onToggleLang,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _servicesKey = GlobalKey();
  final _productsKey = GlobalKey();
  final _galleryKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isArabic = widget.isArabic;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SiteHeader(
              isArabic: isArabic,
              onToggleLang: widget.onToggleLang,
              onServicesTap: () => _scrollTo(_servicesKey),
              onProductsTap: () => _scrollTo(_productsKey),
              onGalleryTap: () => _scrollTo(_galleryKey),
            ),
            HeroSection(isArabic: isArabic),
            IntroSection(isArabic: isArabic),
            Container(key: _servicesKey, child: ServicesSection(isArabic: isArabic)),
            FeatureSection(isArabic: isArabic),
            Container(key: _productsKey, child: ProductsSection(isArabic: isArabic)),
            Container(key: _galleryKey, child: GallerySection(isArabic: isArabic)),
            CtaSection(isArabic: isArabic),
            SiteFooter(isArabic: isArabic),
          ],
        ),
      ),
    );
  }
}
