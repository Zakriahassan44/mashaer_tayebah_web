import 'package:flutter/material.dart';
import '../content.dart';
import '../theme.dart';
import 'common.dart';

class SiteHeader extends StatelessWidget {
  final bool isArabic;
  final VoidCallback onToggleLang;
  final VoidCallback? onServicesTap;
  final VoidCallback? onProductsTap;
  final VoidCallback? onGalleryTap;

  const SiteHeader({
    super.key,
    required this.isArabic,
    required this.onToggleLang,
    this.onServicesTap,
    this.onProductsTap,
    this.onGalleryTap,
  });

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.of(context).size.width > Breakpoints.mobile;

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.cream,
        border: Border(bottom: BorderSide(color: AppColors.line)),
      ),
      child: SiteContainer(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          children: [
            // Brand
            Text('◐', style: TextStyle(fontSize: 26, color: AppColors.gold)),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  Content.brandAr.of(isArabic),
                  style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                ),
                Text(
                  Content.brandEn.of(isArabic),
                  style: const TextStyle(fontSize: 11, letterSpacing: .5, color: AppColors.muted),
                ),
              ],
            ),
            const Spacer(),
            if (wide) ...[
              _NavLink(Content.navServices.of(isArabic), onTap: onServicesTap),
              const SizedBox(width: 24),
              _NavLink(Content.navProducts.of(isArabic), onTap: onProductsTap),
              const SizedBox(width: 24),
              _NavLink(Content.navGallery.of(isArabic), onTap: onGalleryTap),
              const SizedBox(width: 24),
              _NavLink(Content.navCall.of(isArabic), onTap: () => launchUrlSafely(Content.phoneTel)),
              const SizedBox(width: 24),
            ],
            OutlinedButton(
              onPressed: onToggleLang,
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.ink,
                side: const BorderSide(color: AppColors.line),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              ),
              child: const Text('EN / عربي', style: TextStyle(fontSize: 13)),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  const _NavLink(this.text, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Text(text, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
    );
  }
}
