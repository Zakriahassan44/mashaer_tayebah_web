import 'package:flutter/material.dart';
import '../content.dart';
import '../theme.dart';
import 'common.dart';

/// 1983 x 793 = aspect ratio of herotwo.png
const double _heroImageRatio = 1983 / 793;
const Color _heroBg = Color(0xFF141109);
const Color _gold = Color(0xFFE7C98A);

class HeroSection extends StatelessWidget {
  final bool isArabic;

  const HeroSection({super.key, required this.isArabic});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isStacked = width <= 1100; // mobile + tablet

    return isStacked
        ? _StackedHero(isArabic: isArabic, width: width)
        : _OverlayHero(isArabic: isArabic, width: width);
  }
}

// ============================================================
// DESKTOP: image full visible, text on top of it
// ============================================================
class _OverlayHero extends StatelessWidget {
  final bool isArabic;
  final double width;

  const _OverlayHero({required this.isArabic, required this.width});

  @override
  Widget build(BuildContext context) {
    // Height follows the image ratio, so nothing gets cropped
    final heroHeight = (width / _heroImageRatio).clamp(520.0, 820.0);

    return SizedBox(
      height: heroHeight,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/herotwo.png', fit: BoxFit.cover),

          // Soft dark gradient only at the bottom-start corner,
          // so the shop and sign stay bright
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: AlignmentDirectional.bottomStart,
                end: AlignmentDirectional.topEnd,
                colors: const [
                  Color(0xE6141109),
                  Color(0x99141109),
                  Colors.transparent,
                ],
                stops: const [0.0, 0.4, 0.7],
              ),
            ),
          ),

          SiteContainer(
            padding: const EdgeInsets.fromLTRB(24, 40, 24, 48),
            child: Align(
              alignment: AlignmentDirectional.bottomStart,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 560),
                child: _HeroContent(isArabic: isArabic, titleSize: 44),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// MOBILE / TABLET: full image on top, content below
// ============================================================
class _StackedHero extends StatelessWidget {
  final bool isArabic;
  final double width;

  const _StackedHero({required this.isArabic, required this.width});

  @override
  Widget build(BuildContext context) {
    final isMobile = width <= Breakpoints.mobile;

    return ColoredBox(
      color: _heroBg,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: _heroImageRatio,
            child: Image.asset('assets/images/herotwo.png', fit: BoxFit.cover),
          ),
          SiteContainer(
            padding: EdgeInsets.fromLTRB(20, 28, 20, isMobile ? 36 : 48),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: _HeroContent(
                isArabic: isArabic,
                titleSize: isMobile ? 32 : 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// SHARED CONTENT (no duplicate code)
// ============================================================
class _HeroContent extends StatelessWidget {
  final bool isArabic;
  final double titleSize;

  const _HeroContent({required this.isArabic, required this.titleSize});

  @override
  Widget build(BuildContext context) {
    TextStyle title(Color color) => TextStyle(
      color: color,
      fontWeight: FontWeight.w900,
      height: 1.12,
      fontSize: titleSize,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Content.heroTag.of(isArabic),
          style: TextStyle(
            color: _gold,
            fontWeight: FontWeight.w600,
            fontSize: 13,
            letterSpacing: isArabic ? 0 : .8,
          ),
        ),
        const SizedBox(height: 14),
        Text(Content.heroTitle1.of(isArabic), style: title(Colors.white)),
        Text(Content.heroTitle2.of(isArabic), style: title(_gold)),
        const SizedBox(height: 18),
        Text(
          Content.heroSub.of(isArabic),
          style: const TextStyle(
            color: Color(0xFFF1ECE1),
            fontSize: 16,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 26),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            PrimaryButton(
              label: Content.heroWhatsapp.of(isArabic),
              onTap: () => launchUrlSafely(Content.whatsappUrl),
            ),
            OutlineButton(
              label: Content.heroCall.of(isArabic),
              onTap: () => launchUrlSafely(Content.phoneTel),
            ),
          ],
        ),
      ],
    );
  }
}