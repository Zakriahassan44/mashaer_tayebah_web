import 'package:flutter/material.dart';
import '../content.dart';
import '../theme.dart';
import 'common.dart';

class ProductsSection extends StatelessWidget {
  final bool isArabic;

  const ProductsSection({
    super.key,
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

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
            Text(
              Content.productsKicker.of(isArabic),
              style: const TextStyle(
                color: AppColors.goldDark,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              Content.productsTitle.of(isArabic),
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w800,
                height: 1.3,
              ),
            ),

            const SizedBox(height: 10),

            ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 620,
              ),
              child: Text(
                Content.productsSub.of(isArabic),
                style: const TextStyle(
                  fontSize: 15,
                  color: AppColors.bodyText,
                  height: 1.6,
                ),
              ),
            ),

            const SizedBox(height: 36),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: Content.products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: cols,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,

                // Fixed height prevents vertical RenderFlex overflow
                mainAxisExtent: width < Breakpoints.mobile
                    ? 455
                    : 430,
              ),
              itemBuilder: (context, i) {
                return _ProductCard(
                  product: Content.products[i],
                  isArabic: isArabic,
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

  const _ProductCard({
    required this.product,
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cream,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.line,
        ),
      ),
      clipBehavior: Clip.antiAlias,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Product Image
          AspectRatio(
            aspectRatio: 1.25,
            child: Image.asset(
              product.image,
              fit: BoxFit.cover,
            ),
          ),

          // Product Details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                18,
                16,
                18,
                18,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name
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

                  // Product Description
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

                  // Price
                  Text(
                    Content.priceOnRequest.of(isArabic),
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.goldDark,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const Spacer(),

                  // Order Button
                  SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: ElevatedButton(
                      onPressed: () {
                        launchUrlSafely(
                          Content.productOrderUrl(
                            product.name.of(isArabic),
                            isArabic,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.gold,
                        foregroundColor: const Color(0xFF221A0E),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                        elevation: 0,
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.chat_bubble_outline,
                            size: 18,
                          ),

                          const SizedBox(width: 8),

                          // Flexible prevents horizontal RenderFlex overflow
                          Flexible(
                            child: Text(
                              Content.orderButton.of(isArabic),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
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