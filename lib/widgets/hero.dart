import 'package:flutter/material.dart';
import '../content.dart';
import '../theme.dart';
import 'common.dart';

class HeroSection extends StatelessWidget {
  final bool isArabic;
  const HeroSection({super.key, required this.isArabic});

  @override
  Widget build(BuildContext context) {
    final narrow = MediaQuery.sizeOf(context).width <= Breakpoints.mobile;
    final titleSize = narrow ? 32.0 : 48.0;

    // minHeight (not a fixed height): the hero grows if the text needs more
    // room, so nothing can overflow on small screens or with long Arabic text.
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: narrow ? 560 : 680),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/herotwo.png',
              fit: BoxFit.cover,
              // On a tall phone screen keep the paint cans (right side) in view.
              alignment: narrow ? const Alignment(0.35, 0) : Alignment.center,
            ),
          ),
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x59141109),
                    Color(0x8C141109),
                    Color(0xE1141109),
                  ],
                  stops: [0.0, 0.55, 1.0],
                ),
              ),
            ),
          ),
          SiteContainer(
            padding: const EdgeInsets.fromLTRB(24, 96, 24, 56),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 640),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      Content.heroTag.of(isArabic),
                      style: TextStyle(
                        color: const Color(0xFFE7C98A),
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        // Letter-spacing breaks the joined letters of Arabic script.
                        letterSpacing: isArabic ? 0 : .8,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      Content.heroTitle1.of(isArabic),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        height: 1.15,
                        fontSize: titleSize,
                      ),
                    ),
                    Text(
                      Content.heroTitle2.of(isArabic),
                      style: TextStyle(
                        color: const Color(0xFFE7C98A),
                        fontWeight: FontWeight.w900,
                        height: 1.15,
                        fontSize: titleSize,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      Content.heroSub.of(isArabic),
                      style: const TextStyle(
                        color: Color(0xFFF1ECE1),
                        fontSize: 17,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Wrap(
                      spacing: 14,
                      runSpacing: 14,
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
