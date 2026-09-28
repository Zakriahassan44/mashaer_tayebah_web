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
                Text(
                  Content.introKicker.of(isArabic),
                  style: const TextStyle(color: AppColors.goldDark, fontWeight: FontWeight.w700, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  Content.introTitle.of(isArabic),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 16),
                Text(
                  Content.introBody.of(isArabic),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16, color: AppColors.bodyText, height: 1.6),
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
    final width = MediaQuery.of(context).size.width;
    final cols = width > Breakpoints.tablet ? 4 : (width > Breakpoints.mobile ? 2 : 2);

    return Padding(
      padding: const EdgeInsets.only(bottom: 80),
      child: SiteContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Content.servicesKicker.of(isArabic),
              style: const TextStyle(color: AppColors.goldDark, fontWeight: FontWeight.w700, fontSize: 14),
            ),
            const SizedBox(height: 10),
            Text(
              Content.servicesTitle.of(isArabic),
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
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
                itemCount: Content.services.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: cols,
                  childAspectRatio: cols == 4 ? 1.05 : 1.4,
                ),
                itemBuilder: (context, i) {
                  final item = Content.services[i];
                  final num = (i + 1).toString().padLeft(2, '0');
                  return Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(color: AppColors.line),
                        bottom: BorderSide(color: AppColors.line),
                      ),
                    ),
                    padding: const EdgeInsets.all(24),
                    alignment: isArabic ? Alignment.centerRight : Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(item.image, height: 90, width: 90, fit: BoxFit.cover),
                        ),
                        const SizedBox(height: 14),
                        Text(num, style: const TextStyle(color: AppColors.goldDark, fontWeight: FontWeight.w700, fontSize: 12)),
                        const SizedBox(height: 6),
                        Text(
                          item.name.of(isArabic),
                          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          item.name.of(!isArabic),
                          style: const TextStyle(fontSize: 12, color: AppColors.muted),
                        ),
                      ],
                    ),
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

class FeatureSection extends StatelessWidget {
  final bool isArabic;
  const FeatureSection({super.key, required this.isArabic});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final narrow = width <= Breakpoints.tablet;

    final image = ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset('assets/images/mixer.jpg', height: narrow ? 240 : 400, fit: BoxFit.cover, width: double.infinity),
    );

    final text = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(Content.featureKicker.of(isArabic),
            style: const TextStyle(color: AppColors.goldDark, fontWeight: FontWeight.w700, fontSize: 14)),
        const SizedBox(height: 12),
        Text(Content.featureTitle.of(isArabic), style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w800, height: 1.3)),
        const SizedBox(height: 16),
        Text(Content.featureBody.of(isArabic), style: const TextStyle(fontSize: 16, color: AppColors.bodyText, height: 1.6)),
        const SizedBox(height: 22),
        InkWell(
          onTap: () => launchUrlSafely(Content.whatsappUrl),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(Content.featureLink.of(isArabic),
                  style: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.goldDark)),
              const SizedBox(width: 8),
              Icon(isArabic ? Icons.arrow_back : Icons.arrow_forward, size: 18, color: AppColors.goldDark),
            ],
          ),
        ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 90),
      child: SiteContainer(
        child: narrow
            ? Column(children: [image, const SizedBox(height: 32), text])
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: isArabic
                    ? [Expanded(child: text), const SizedBox(width: 56), Expanded(child: image)]
                    : [Expanded(child: image), const SizedBox(width: 56), Expanded(child: text)],
              ),
      ),
    );
  }
}
