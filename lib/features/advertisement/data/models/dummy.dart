import 'package:mostkdm/core/theme/app_images.dart';
import 'package:mostkdm/features/advertisement/data/models/ad_details_model.dart';
import 'package:mostkdm/features/advertisement/data/models/seller_model.dart';

final List<AdDetailsModel> dummyAds = [
  AdDetailsModel(
    id: "1",
    title: 'هوندا أكسنت 2023 مل كامل',
    price: 65000,
    city: 'الرياض',
    views: 2487,
    daysAgo: 10,
    images: [
      AppImages.car,
      AppImages.car,
      AppImages.car,
    ],
    specifications: {
      'الموديل': 'هوندا أكسنت',
      'السنة': '2023',
      'الممشى': '15,000 كم',
      'ناقل الحركة': 'أوتوماتيك',
      'اللون': 'أبيض',
    },
    seller: const SellerModel(
      name: 'أبو محمد',
      image: AppImages.banner,
      memberSince: 'منذ سنة',
    ),
    isPremium: true,
    description: "سيارة هونداي اكسنت موديل 2023 فل كامل المواصفات",
  ),

  AdDetailsModel(
    id: "2",
    title: 'تويوتا كامري 2024',
    price: 95000,
    city: 'الرياض',
    views: 3500,
    daysAgo: 2,
    images: [
      AppImages.car,
    ],
    specifications: {},
    seller: const SellerModel(
      name: 'محمد',
      image: AppImages.banner,
      memberSince: 'منذ سنتين',
    ),
    description: "كامري بحالة ممتازة",
  ),
  AdDetailsModel(
    id: "2",
    title: 'تويوتا كامري 2024',
    price: 95000,
    city: 'الرياض',
    views: 3500,
    daysAgo: 2,
    images: [
      AppImages.car,
    ],
    specifications: {},
    seller: const SellerModel(
      name: 'محمد',
      image: AppImages.banner,
      memberSince: 'منذ سنتين',
    ),
    description: "كامري بحالة ممتازة",
  ),
];