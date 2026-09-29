import 'package:flutter/material.dart';
import '../content.dart';
import '../theme.dart';
import 'common.dart';

class ProductsSection extends StatelessWidget {
  final bool isArabic;

  const ProductsSection({super.key, required this.isArabic});

  static const double _spacing = 20;
  static const double _imageAspectRatio = 1.25;

  // Height reserved under the image for name, description, price and button.
  static const double _detailsHeight = 236;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final cols = width > Breakpoints.tablet
        ? 3
        : (width > Breakpoints.mobile ? 2 : 1);

    return Container(
      color: AppColors.cream2,
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: SiteContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeading(
              kicker: Content.productsKicker.of(isArabic),
              title: Content.productsTitle.of(isArabic),
              subtitle: Content.productsSub.of(isArabic),
              titleSize: 26,
            ),
            const SizedBox(height: 36),
            LayoutBuilder(
              builder: (context, constraints) {
                // Card height = image height (from the real card width) + details.
                // The old fixed 430px was smaller than that on desktop, which is
                // what caused the "RenderFlex overflowed" stripes.
                final cardWidth =
                    (constraints.maxWidth - _spacing * (cols - 1)) / cols;
                final cardHeight = cardWidth / _imageAspectRatio + _detailsHeight;

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: Content.products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: cols,
                    crossAxisSpacing: _spacing,
                    mainAxisSpacing: _spacing,
                    mainAxisExtent: cardHeight,
                  ),
                  itemBuilder: (context, i) => _ProductCard(
                    product: Content.products[i],
                    isArabic: isArabic,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Product product;
  final bool isArabic;

  const _ProductCard({required this.product, required this.isArabic});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cream,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.line),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: ProductsSection._imageAspectRatio,
            child: Image.asset(
              product.image,
              fit: BoxFit.cover,
              cacheWidth: 800,
              errorBuilder: (_, __, ___) => Container(
                color: AppColors.line,
                alignment: Alignment.center,
                child: const Icon(
                  Icons.image_not_supported_outlined,
                  color: AppColors.muted,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 16, 18, 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name.of(isArabic),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    product.description.of(isArabic),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.bodyText,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    Content.priceOnRequest.of(isArabic),
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.goldDark,
                      fontWeight: FontWeight.w700,
                      height: 1.4,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: ElevatedButton(
                      onPressed: () => launchUrlSafely(
                        Content.productOrderUrl(
                          product.name.of(isArabic),
                          isArabic,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.gold,
                        foregroundColor: const Color(0xFF221A0E),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                        elevation: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.chat_bubble_outline, size: 18),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              Content.orderButton.of(isArabic),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 13.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
