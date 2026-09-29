import 'package:flutter/material.dart';
import '../content.dart';
import '../theme.dart';
import 'common.dart';

class _HeaderLink {
  final String label;
  final VoidCallback? onTap;
  const _HeaderLink(this.label, this.onTap);
}

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
    final wide = MediaQuery.sizeOf(context).width > Breakpoints.mobile;

    final links = <_HeaderLink>[
      _HeaderLink(Content.navServices.of(isArabic), onServicesTap),
      _HeaderLink(Content.navProducts.of(isArabic), onProductsTap),
      _HeaderLink(Content.navGallery.of(isArabic), onGalleryTap),
      _HeaderLink(
        Content.navCall.of(isArabic),
        () => launchUrlSafely(Content.phoneTel),
      ),
    ];

    // Desktop: inline links. Mobile: the same links inside a popup menu, so
    // navigation still works on a phone.
    final navigation = <Widget>[];
    if (wide) {
      for (final link in links) {
        navigation.add(_NavLink(link.label, onTap: link.onTap));
        navigation.add(const SizedBox(width: 24));
      }
    } else {
      navigation.add(_MobileMenu(links: links));
      navigation.add(const SizedBox(width: 4));
    }

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.cream,
        border: Border(bottom: BorderSide(color: AppColors.line)),
      ),
      child: SiteContainer(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          children: [
            Expanded(
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: _Brand(isArabic: isArabic),
              ),
            ),
            ...navigation,
            _LanguageButton(onTap: onToggleLang),
          ],
        ),
      ),
    );
  }
}

class _Brand extends StatelessWidget {
  final bool isArabic;
  const _Brand({required this.isArabic});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset('assets/images/logo.png', width: 40, height: 40),
        ),
        const SizedBox(width: 12),
        // Flexible + ellipsis: a long brand name can never overflow a phone screen.
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                Content.brandAr.of(isArabic),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
              ),
              Text(
                Content.brandEn.of(isArabic),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 11,
                  letterSpacing: .5,
                  color: AppColors.muted,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _LanguageButton extends StatelessWidget {
  final VoidCallback onTap;
  const _LanguageButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.ink,
        side: const BorderSide(color: AppColors.line),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      ),
      child: const Text('EN / عربي', style: TextStyle(fontSize: 13)),
    );
  }
}

class _MobileMenu extends StatelessWidget {
  final List<_HeaderLink> links;
  const _MobileMenu({required this.links});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: const Icon(Icons.menu, color: AppColors.ink),
      onSelected: (index) => links[index].onTap?.call(),
      itemBuilder: (context) => [
        for (var i = 0; i < links.length; i++)
          PopupMenuItem<int>(value: i, child: Text(links[i].label)),
      ],
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
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        child: Text(
          text,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
