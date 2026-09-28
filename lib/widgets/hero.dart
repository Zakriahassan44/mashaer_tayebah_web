import 'package:flutter/material.dart';
import '../content.dart';
import '../theme.dart';
import 'common.dart';

class HeroSection extends StatelessWidget {
  final bool isArabic;
  const HeroSection({super.key, required this.isArabic});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final narrow = width <= Breakpoints.mobile;
    final height = narrow ? 560.0 : 680.0;

    return SizedBox(
      height: height,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/hero.jpg', fit: BoxFit.cover),
          Container(
            decoration: const BoxDecoration(
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
          Align(
            alignment: Alignment.bottomCenter,
            child: SiteContainer(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 56),
              child: Align(
                alignment: isArabic ? Alignment.centerRight : Alignment.centerLeft,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 640),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        Content.heroTag.of(isArabic),
                        style: const TextStyle(
                          color: Color(0xFFE7C98A),
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          letterSpacing: .8,
                        ),
                      ),
                      const SizedBox(height: 18),
                      Text(
                        Content.heroTitle1.of(isArabic),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          height: 1.15,
                          fontSize: narrow ? 32 : 48,
                        ),
                      ),
                      Text(
                        Content.heroTitle2.of(isArabic),
                        style: TextStyle(
                          color: const Color(0xFFE7C98A),
                          fontWeight: FontWeight.w900,
                          height: 1.15,
                          fontSize: narrow ? 32 : 48,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        Content.heroSub.of(isArabic),
                        style: const TextStyle(color: Color(0xFFF1ECE1), fontSize: 17),
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
          ),
        ],
      ),
    );
  }
}
