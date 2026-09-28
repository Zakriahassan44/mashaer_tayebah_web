/// Small helper holding an Arabic + English pair of the same string.
class L {
  final String ar;
  final String en;
  const L(this.ar, this.en);

  String of(bool isArabic) => isArabic ? ar : en;
}

/// A single service card (icon image + name).
class ServiceItem {
  final String image;
  final L name;
  const ServiceItem({required this.image, required this.name});
}

/// A single sellable product (image + name + short description).
/// Add more products here any time — the grid & WhatsApp order button
/// pick these up automatically.
class Product {
  final String image;
  final L name;
  final L description;
  const Product({required this.image, required this.name, required this.description});
}

class Content {
  Content._();

  // Brand
  static const brandAr = L('مشاعر طيبة للتجارة', 'MASHAER TAYEBAH');
  static const brandEn = L('MASHAER TAYEBAH TRADING', 'Paints & Decorations Trading');

  // Nav
  static const navServices = L('الخدمات', 'Services');
  static const navProducts = L('المنتجات', 'Products');
  static const navGallery = L('أعمالنا', 'Our Work');
  static const navCall = L('اتصل الآن', 'Call Now');

  // Hero
  static const heroTag = L('القصيم • المملكة العربية السعودية', 'AL-QASSIM • SAUDI ARABIA');
  static const heroTitle1 = L('لون يبعث الحياة.', 'Colour that lifts a room.');
  static const heroTitle2 = L('حماية تدوم.', 'Protection that lasts.');
  static const heroSub = L(
    'ننفذ أعمال الدهانات والديكور والعزل الحراري بعناية وتشطيب احترافي.',
    'We carry out paint, decor and thermal insulation work with precision and a professional finish.',
  );
  static const heroWhatsapp = L('واتساب 0508185486', 'WhatsApp 050 818 5486');
  static const heroCall = L('اتصال مباشر', 'Call Directly');

  // Intro
  static const introKicker = L('خبرة في التشطيب', 'Finishing expertise');
  static const introTitle = L('نحوّل المساحة إلى مكان يليق بك', 'We turn a space into somewhere that suits you');
  static const introBody = L(
    'حلول متكاملة للمنازل والمحلات والمباني في القصيم، من تجهيز السطح وحتى آخر طبقة دهان.',
    'Complete solutions for homes, shops and buildings across Al-Qassim — from surface preparation to the very last coat.',
  );

  // Services
  static const servicesKicker = L('خدماتنا', 'OUR SERVICES');
  static const servicesTitle = L('تشطيب متقن لكل سطح', 'Precise finishing for every surface');
  static const services = [
    ServiceItem(image: 'assets/images/services/profile-texture.jpg', name: L('دهانات بروفايل', 'Profile Texture')),
    ServiceItem(image: 'assets/images/services/american-spray.jpg', name: L('رشة أمريكية', 'American Spray')),
    ServiceItem(image: 'assets/images/services/plastic-gloss.jpg', name: L('دهانات بلاستيكية ولميع', 'Plastic & Gloss Paint')),
    ServiceItem(image: 'assets/images/services/roof-insulation.jpg', name: L('عازل حراري للأسطح', 'Roof Thermal Insulation')),
  ];

  // Products
  static const productsKicker = L('منتجاتنا', 'OUR PRODUCTS');
  static const productsTitle = L('اطلب المنتج مباشرة عبر واتساب', 'Order any product directly on WhatsApp');
  static const productsSub = L(
    'اختر المنتج، اضغط طلب، وسيصلنا طلبك مباشرة على واتساب مع اسم المنتج.',
    'Pick a product, tap Order, and your request reaches us on WhatsApp with the product name attached.',
  );
  static const orderButton = L('اطلب عبر واتساب', 'Order via WhatsApp');
  static const priceOnRequest = L('السعر عند الطلب', 'Price on request');

  static const products = [
    Product(
      image: 'assets/images/products/interior-paint.jpg',
      name: L('دهان داخلي فاخر', 'Premium Interior Paint'),
      description: L('تغطية ناعمة وألوان ثابتة لغرف المعيشة والنوم.', 'Smooth coverage and long-lasting colour for living rooms and bedrooms.'),
    ),
    Product(
      image: 'assets/images/products/exterior-paint.jpg',
      name: L('دهان خارجي مقاوم للعوامل الجوية', 'Weather-Shield Exterior Paint'),
      description: L('حماية طويلة الأمد من الشمس والرطوبة للواجهات.', 'Long-term protection from sun and moisture for building facades.'),
    ),
    Product(
      image: 'assets/images/products/enamel-paint.jpg',
      name: L('دهان لميع للأخشاب والمعادن', 'Enamel Paint for Wood & Metal'),
      description: L('لمعان قوي وتشطيب أملس للأبواب والنوافذ والحديد.', 'A strong gloss finish for doors, windows and ironwork.'),
    ),
    Product(
      image: 'assets/images/products/roof-coating.jpg',
      name: L('عازل حراري ومائي للأسطح', 'Roof Thermal & Waterproof Coating'),
      description: L('يقلل الحرارة الداخلية ويمنع تسرب المياه في الأسطح.', 'Reduces indoor heat and prevents water leaks on rooftops.'),
    ),
    Product(
      image: 'assets/images/products/wallpaper.jpg',
      name: L('ورق جدران وبانوهات ثلاثية الأبعاد', 'Wallpaper & 3D Panels'),
      description: L('تصاميم عصرية لإضافة لمسة ديكور مميزة.', 'Modern designs that add a distinctive decorative touch.'),
    ),
    Product(
      image: 'assets/images/products/texture-finish.jpg',
      name: L('تشطيب تكستشر وديكورات جدارية', 'Texture Finish & Wall Decor'),
      description: L('تشطيبات فنية بارزة تعطي عمقاً وملمساً للجدران.', 'Artistic raised finishes that give walls depth and texture.'),
    ),
  ];

  // Feature
  static const featureKicker = L('ألوان دقيقة', 'ACCURATE COLOURS');
  static const featureTitle = L('اختيار اللون المناسب، بدقة واحترافية', 'Choosing the right colour, precisely and professionally');
  static const featureBody = L(
    'نساعدك في اختيار الدرجات المناسبة ونوفر حلول دهان تلائم الداخل والخارج والأسطح.',
    'We help you pick the right shades and offer paint solutions suited to interiors, exteriors and rooftops.',
  );
  static const featureLink = L('اطلب استشارة مجانية', 'Request a free consultation');

  // Gallery
  static const galleryKicker = L('المنتجات والأعمال', 'PRODUCTS & WORK');
  static const galleryTitle = L('جودة تراها في كل تفصيلة', 'Quality you can see in every detail');

  // CTA
  static const ctaKicker = L('جاهز لتجديد بيتك أو مشروعك؟', 'Ready to refresh your home or project?');
  static const ctaTitle = L('تواصل معنا اليوم', 'Get in touch today');
  static const ctaAddress = L('القصيم، المملكة العربية السعودية', 'Al-Qassim, Saudi Arabia');
  static const ctaButton = L('ابدأ المحادثة على واتساب', 'Start a WhatsApp Chat');

  // Footer
  static const footerName = L('مشاعر طيبة للتجارة للدهانات والديكورات', 'Mashaer Tayebah Trading — Paints & Decorations');
  static const footerCity = L('القصيم', 'AL-QASSIM');

  // Contact
  static const phoneDisplay = '050 818 5486';
  static const phoneTel = 'tel:+966508185486';
  static const whatsappUrl = 'https://wa.me/966508185486';
  static const _whatsappNumber = '966508185486';

  /// Builds a WhatsApp link pre-filled with a message referencing the given
  /// product, asking for price and more info — opens directly in a WhatsApp
  /// chat when the person taps "Order via WhatsApp" under a product.
  static String productOrderUrl(String productName, bool isArabic) {
    final message = isArabic
        ? 'مرحباً 👋، أرغب بالاستفسار عن هذا المنتج: "$productName".\nهل يمكنني معرفة السعر والتفاصيل؟'
        : 'Hello 👋, I\'d like to ask about this product: "$productName".\nCan I get more info, price and other details?';
    final encoded = Uri.encodeComponent(message);
    return 'https://wa.me/$_whatsappNumber?text=$encoded';
  }
}
