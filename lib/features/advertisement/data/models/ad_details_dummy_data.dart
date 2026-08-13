// features/advertisement/data/models/ad_details_dummy_data.dart

import 'package:mostkdm/features/advertisement/data/models/ad_details_model.dart';
import 'package:mostkdm/features/favorite/data/model/seller_model.dart';

class AdDetailsDummyData {
  static final dummyAd = AdDetailsModel(
    id: '1',
    title: 'عنوان الإعلان التجريبي بالتفصيل الكامل',
    price: '00000',
    description:
        'هذا النص هو وصف تجريبي مخصص لعرض الهيكل العظمي للشاشة فقط أثناء التحميل والتجربة.',
    // ⚠️ استبدل أي رابط قديم بهذه الصورة المضمونة أو اترك القائمة تحتوي على رابط يعمل 100%
    images: const [
      'https://www.bing.com/th/id/OIP.CKDPMECAXmMcuOfzbs7puAHaEo?w=193&h=135&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=ImgAns&rm=2',
    ],
    city: 'القاهرة، مصر',
    visistedCount: 120,
    createdAt: 'منذ ساعتين',
    specifications: const {
      'الحالة': 'مستعمل',
      'الضمان': 'ساري',
    },
    seller: const SellerModel(
      id: 1,
      name: 'اسم البائع التجريبي',
      image: 'https://www.bing.com/th/id/OIP.CKDPMECAXmMcuOfzbs7puAHaEo?w=193&h=135&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=ImgAns&rm=2',
      mobile: '01000000000',
      isFollowing: false,
      adsCount: 5,
    ),
  );
}