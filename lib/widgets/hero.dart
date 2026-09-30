// import 'package:flutter/material.dart';
// import '../content.dart';
// import '../theme.dart';
// import 'common.dart';
//
// class HeroSection extends StatelessWidget {
//   final bool isArabic;
//   const HeroSection({super.key, required this.isArabic});
//
//   @override
//   Widget build(BuildContext context) {
//     final narrow = MediaQuery.sizeOf(context).width <= Breakpoints.mobile;
//     final titleSize = narrow ? 32.0 : 48.0;
//
//     // minHeight (not a fixed height): the hero grows if the text needs more
//     // room, so nothing can overflow on small screens or with long Arabic text.
//     return ConstrainedBox(
//       constraints: BoxConstraints(minHeight: narrow ? 560 : 680),
//       child: Stack(
//         alignment: Alignment.bottomCenter,
//         children: [
//           Positioned.fill(
//             child: Image.asset(
//               'assets/images/herotwo.png',
//               fit: BoxFit.cover,
//               // On a tall phone screen keep the paint cans (right side) in view.
//               alignment: narrow ? const Alignment(0.35, 0) : Alignment.center,
//             ),
//           ),
//           const Positioned.fill(
//             child: DecoratedBox(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                     Color(0x59141109),
//                     Color(0x8C141109),
//                     Color(0xE1141109),
//                   ],
//                   stops: [0.0, 0.55, 1.0],
//                 ),
//               ),
//             ),
//           ),
//           SiteContainer(
//             padding: const EdgeInsets.fromLTRB(24, 96, 24, 56),
//             child: Align(
//               alignment: AlignmentDirectional.centerStart,
//               child: ConstrainedBox(
//                 constraints: const BoxConstraints(maxWidth: 640),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       Content.heroTag.of(isArabic),
//                       style: TextStyle(
//                         color: const Color(0xFFE7C98A),
//                         fontWeight: FontWeight.w600,
//                         fontSize: 13,
//                         // Letter-spacing breaks the joined letters of Arabic script.
//                         letterSpacing: isArabic ? 0 : .8,
//                       ),
//                     ),
//                     const SizedBox(height: 18),
//                     Text(
//                       Content.heroTitle1.of(isArabic),
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.w900,
//                         height: 1.15,
//                         fontSize: titleSize,
//                       ),
//                     ),
//                     Text(
//                       Content.heroTitle2.of(isArabic),
//                       style: TextStyle(
//                         color: const Color(0xFFE7C98A),
//                         fontWeight: FontWeight.w900,
//                         height: 1.15,
//                         fontSize: titleSize,
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     Text(
//                       Content.heroSub.of(isArabic),
//                       style: const TextStyle(
//                         color: Color(0xFFF1ECE1),
//                         fontSize: 17,
//                         height: 1.5,
//                       ),
//                     ),
//                     const SizedBox(height: 32),
//                     Wrap(
//                       spacing: 14,
//                       runSpacing: 14,
//                       children: [
//                         PrimaryButton(
//                           label: Content.heroWhatsapp.of(isArabic),
//                           onTap: () => launchUrlSafely(Content.whatsappUrl),
//                         ),
//                         OutlineButton(
//                           label: Content.heroCall.of(isArabic),
//                           onTap: () => launchUrlSafely(Content.phoneTel),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../content.dart';
import '../theme.dart';
import 'common.dart';

class HeroSection extends StatelessWidget {
  final bool isArabic;

  const HeroSection({
    super.key,
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = size.width;

    final isMobile = width <= Breakpoints.mobile;
    final isTablet = width > Breakpoints.mobile && width <= 1000;

    // Responsive hero height
    final heroHeight = isMobile
        ? 650.0
        : isTablet
        ? 620.0
        : 680.0;

    final titleSize = isMobile
        ? 34.0
        : isTablet
        ? 42.0
        : 48.0;

    return SizedBox(
      height: heroHeight,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // ============================================================
          // HERO IMAGE
          // ============================================================
          Positioned.fill(
            child: Image.asset(
              'assets/images/herotwo.png',
              fit: BoxFit.cover,

              // IMPORTANT:
              // Desktop = balanced composition
              // Tablet = slightly right
              // Mobile = show shop/front side
              alignment: isMobile
                  ? const Alignment(0.55, 0.0)
                  : isTablet
                  ? const Alignment(0.25, 0.0)
                  : Alignment.center,
            ),
          ),

          // ============================================================
          // DARK OVERLAY
          // ============================================================
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: isMobile
                      ? const [
                    Color(0x40141109),
                    Color(0x99141109),
                    Color(0xF2141109),
                  ]
                      : const [
                    Color(0x30141109),
                    Color(0x75141109),
                    Color(0xDD141109),
                  ],
                  stops: const [
                    0.0,
                    0.52,
                    1.0,
                  ],
                ),
              ),
            ),
          ),

          // ============================================================
          // EXTRA LEFT DARK GRADIENT
          // Helps text remain readable without hiding the shop
          // ============================================================
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: AlignmentDirectional.centerStart,
                  end: AlignmentDirectional.center,
                  colors: [
                    const Color(0xCC141109),
                    const Color(0x55141109),
                    Colors.transparent,
                  ],
                  stops: const [
                    0.0,
                    0.45,
                    1.0,
                  ],
                ),
              ),
            ),
          ),

          // ============================================================
          // CONTENT
          // ============================================================
          SiteContainer(
            padding: EdgeInsets.fromLTRB(
              isMobile ? 20 : 24,
              isMobile ? 70 : 90,
              isMobile ? 20 : 24,
              isMobile ? 40 : 56,
            ),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: isMobile
                      ? width * 0.92
                      : isTablet
                      ? 560
                      : 640,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ==================================================
                    // TAG
                    // ==================================================
                    Text(
                      Content.heroTag.of(isArabic),
                      style: TextStyle(
                        color: const Color(0xFFE7C98A),
                        fontWeight: FontWeight.w600,
                        fontSize: isMobile ? 12 : 13,
                        letterSpacing: isArabic ? 0 : .8,
                      ),
                    ),

                    const SizedBox(height: 14),

                    // ==================================================
                    // TITLE 1
                    // ==================================================
                    Text(
                      Content.heroTitle1.of(isArabic),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        height: 1.12,
                        fontSize: titleSize,
                      ),
                    ),

                    // ==================================================
                    // TITLE 2
                    // ==================================================
                    Text(
                      Content.heroTitle2.of(isArabic),
                      style: TextStyle(
                        color: const Color(0xFFE7C98A),
                        fontWeight: FontWeight.w900,
                        height: 1.12,
                        fontSize: titleSize,
                      ),
                    ),

                    const SizedBox(height: 18),

                    // ==================================================
                    // DESCRIPTION
                    // ==================================================
                    Text(
                      Content.heroSub.of(isArabic),
                      style: TextStyle(
                        color: const Color(0xFFF1ECE1),
                        fontSize: isMobile ? 15 : 17,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 26),

                    // ==================================================
                    // BUTTONS
                    // ==================================================
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        PrimaryButton(
                          label: Content.heroWhatsapp.of(isArabic),
                          onTap: () => launchUrlSafely(
                            Content.whatsappUrl,
                          ),
                        ),

                        OutlineButton(
                          label: Content.heroCall.of(isArabic),
                          onTap: () => launchUrlSafely(
                            Content.phoneTel,
                          ),
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