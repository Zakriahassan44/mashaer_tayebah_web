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

class MashaerApp extends StatelessWidget {
  const MashaerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'مشاعر طيبة للتجارة | Mashaer Tayebah',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Defaults to Arabic, same as the reference site.
  bool isArabic = true;

  final _servicesKey = GlobalKey();
  final _productsKey = GlobalKey();
  final _galleryKey = GlobalKey();

  void _toggleLang() {
    setState(() => isArabic = !isArabic);
  }

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
    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SiteHeader(
                isArabic: isArabic,
                onToggleLang: _toggleLang,
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
      ),
    );
  }
}
