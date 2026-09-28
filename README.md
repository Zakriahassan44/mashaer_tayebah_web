# مشاعر طيبة للتجارة — Flutter Web

Yeh Flutter Web project hai, pichle HTML design (Dalok Al Shams style) ka bilkul same layout
Flutter widgets mein bana hua — Header, Hero, Intro, 4 Services, Colour-match Feature, Gallery
aur CTA/Contact section, sath EN/AR language toggle button (top-right).

## Chalane ka tareeqa (apne computer par)

Is sandbox mein Flutter SDK install nahi hai isliye yahan build/run nahi ho saka — lekin poora
source code ready hai. Apne machine par chalane ke liye:

1. **Flutter install karein** (agar pehle se nahi hai): https://docs.flutter.dev/get-started/install
2. Terminal mein project folder mein jaayein:
   ```bash
   cd mashaer_flutter
   flutter pub get
   ```
3. Chrome mein run karein:
   ```bash
   flutter run -d chrome
   ```
4. Production build (deploy karne ke liye, `build/web` folder banega):
   ```bash
   flutter build web
   ```
   Us `build/web` folder ko kisi bhi static hosting (Firebase Hosting, Netlify, Vercel, cPanel)
   par upload kar dein.

## Project structure

```
lib/
  main.dart                     -> App entry, language state (isArabic)
  theme.dart                    -> Colors, fonts, breakpoints
  content.dart                  -> Sab Arabic/English text ek jagah
  widgets/
    header.dart                 -> Top nav + lang toggle
    hero.dart                   -> Hero banner
    sections.dart                -> Intro, Services grid, Feature block
    gallery_cta_footer.dart     -> Gallery, CTA, Footer
assets/images/                  -> Placeholder images (apni photos se replace karein)
```

## Apni photos lagana

- `assets/images/` -> `hero.jpg`, `mixer.jpg`, `gallery-1.jpg` se `gallery-7.jpg`
- `assets/images/services/` -> 4 service icons
- `assets/images/products/` -> 6 product images

Bas same naam se apni photo replace kar dein (ya naya naam use karein aur `lib/content.dart`
mein path update kar dein).

## Naya Product add karna (khud se)

`lib/content.dart` file kholein, `Content.products` list dhoondein, aur us tarah ek naya
entry add kar dein:

```dart
Product(
  image: 'assets/images/products/your-image.jpg',
  name: L('نام عربی میں', 'Name in English'),
  description: L('تفصیل عربی میں', 'Description in English'),
),
```

Bas! Ye product khud-b-khud grid mein show hoga, apna image, naam, description aur
"Order via WhatsApp" button ke sath — koi aur code change nahi karna padega.
Naya image file `assets/images/products/` folder mein daal dein.

## "Order via WhatsApp" button kaise kaam karta hai

Har product card ke neeche button hai. Click karte hi WhatsApp khulta hai us number par
jo `lib/content.dart` mein set hai, aur message pehle se bhara hota hai:

> مرحباً 👋، أرغب بالاستفسار عن هذا المنتج: "دهان داخلي فاخر".
> هل يمكنني معرفة السعر والتفاصيل؟

(Ya English mein agar site English mode mein ho.) Product ka naam automatically
message ke andar chala jata hai — customer ko sirf send karna hota hai.

## Contact details (edit karne ke liye)

`lib/content.dart` file mein sab text, phone number aur WhatsApp link ek hi jagah hai —
wahan se change kar sakte hain (`phoneTel`, `whatsappUrl`, `_whatsappNumber`).

## Dependencies

- `google_fonts` — Cairo font (Arabic + English dono ke liye)
- `url_launcher` — WhatsApp / Call buttons ke liye
