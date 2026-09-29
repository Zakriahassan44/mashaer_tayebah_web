import 'package:flutter/material.dart';
import '../content.dart';
import '../theme.dart';
import 'common.dart';

class IntroSection extends StatelessWidget {
  final bool isArabic;
  const IntroSection({super.key, required this.isArabic});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 70),
      child: SiteContainer(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 680),
            child: Column(
              children: [
                SectionHeading(
                  kicker: Content.introKicker.of(isArabic),
                  title: Content.introTitle.of(isArabic),
                  centered: true,
                ),
                const SizedBox(height: 16),
                Text(
                  Content.introBody.of(isArabic),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.bodyText,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ServicesSection extends StatelessWidget {
  final bool isArabic;
  const ServicesSection({super.key, required this.isArabic});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final compact = width <= Breakpoints.mobile;
    final cols = width > Breakpoints.tablet ? 4 : 2;
    final itemCount = Content.services.length;
    final rows = (itemCount / cols).ceil();

    return Padding(
      padding: const EdgeInsets.only(bottom: 80),
      child: SiteContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeading(
              kicker: Content.servicesKicker.of(isArabic),
              title: Content.servicesTitle.of(isArabic),
            ),
            const SizedBox(height: 40),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.line),
                borderRadius: BorderRadius.circular(16),
              ),
              clipBehavior: Clip.antiAlias,
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: itemCount,
                // A fixed row height (instead of an aspect ratio) keeps the cell
                // tall enough for image + 2-line names on every screen width.
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: cols,
                  mainAxisExtent: compact ? 240 : 270,
                ),
                itemBuilder: (context, i) {
                  return _ServiceCell(
                    item: Content.services[i],
                    number: (i + 1).toString().padLeft(2, '0'),
                    isArabic: isArabic,
                    compact: compact,
                    // Inner dividers only: the outer frame already draws the edges.
                    showEndDivider: (i % cols) != cols - 1,
                    showBottomDivider: (i ~/ cols) != rows - 1,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ServiceCell extends StatelessWidget {
  final ServiceItem item;
  final String number;
  final bool isArabic;
  final bool compact;
  final bool showEndDivider;
  final bool showBottomDivider;

  const _ServiceCell({
    required this.item,
    required this.number,
    required this.isArabic,
    required this.compact,
    required this.showEndDivider,
    required this.showBottomDivider,
  });

  @override
  Widget build(BuildContext context) {
    const divider = BorderSide(color: AppColors.line);
    final imageSize = compact ? 72.0 : 90.0;

    return Container(
      decoration: BoxDecoration(
        // BorderDirectional follows the text direction, so it is correct in RTL too.
        border: BorderDirectional(
          end: showEndDivider ? divider : BorderSide.none,
          bottom: showBottomDivider ? divider : BorderSide.none,
        ),
      ),
      padding: EdgeInsets.all(compact ? 16 : 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              item.image,
              height: imageSize,
              width: imageSize,
              fit: BoxFit.cover,
              cacheWidth: 300,
            ),
          ),
          SizedBox(height: compact ? 10 : 14),
          Text(
            number,
            style: const TextStyle(
              color: AppColors.goldDark,
              fontWeight: FontWeight.w700,
              fontSize: 12,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            item.name.of(isArabic),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: compact ? 15 : 17,
              fontWeight: FontWeight.w800,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            item.name.of(!isArabic),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: compact ? 11 : 12,
              color: AppColors.muted,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureSection extends StatelessWidget {
  final bool isArabic;
  const FeatureSection({super.key, required this.isArabic});

  @override
  Widget build(BuildContext context) {
    final narrow = MediaQuery.sizeOf(context).width <= Breakpoints.tablet;

    final image = ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        'assets/images/colour-swatches.jpg',
        height: narrow ? 240 : 400,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );

    final text = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(
          kicker: Content.featureKicker.of(isArabic),
          title: Content.featureTitle.of(isArabic),
          titleSize: 26,
        ),
        const SizedBox(height: 16),
        Text(
          Content.featureBody.of(isArabic),
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.bodyText,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 22),
        InkWell(
          onTap: () => launchUrlSafely(Content.whatsappUrl),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                Content.featureLink.of(isArabic),
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.goldDark,
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                isArabic ? Icons.arrow_back : Icons.arrow_forward,
                size: 18,
                color: AppColors.goldDark,
              ),
            ],
          ),
        ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 90),
      child: SiteContainer(
        child: narrow
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [image, const SizedBox(height: 32), text],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                // The Row already flips in RTL, so the order is the same in both
                // languages: text first (right side in Arabic), image second.
                children: [
                  Expanded(child: text),
                  const SizedBox(width: 56),
                  Expanded(child: image),
                ],
              ),
      ),
    );
  }
}
