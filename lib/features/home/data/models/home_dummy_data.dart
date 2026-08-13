import 'package:mostkdm/features/advertisement/data/models/ad_model.dart';
import 'package:mostkdm/features/advertisement/data/models/category_model.dart';
import 'package:mostkdm/features/home/data/models/slider_model.dart';

class HomeDummyData {
  static List<SliderModel> get sliders => List.generate(
        3,
        (index) => SliderModel(
          id: index,
          image: '',
          name: '',
        ),
      );

  static List<CategoryModel> get categories => List.generate(
        6,
        (index) => CategoryModel(
          id: index,
          name: 'قسم رئيسي',
          adsCount: 0,
          isActive: true, image: '',
        ),
      );

  static List<AdModel> get ads => List.generate(
        4,
        (index) => AdModel(
          id: index,
          title: 'عنوان إعلان تجريبي للتحميل واختبار الـ Skeleton',
          
          createdAt: '2026-08-12',
          cover: '',
          description: '',
          isActive: true,
          isActiveLabel: '',
          visitedCount: 0,
          location: '',
          latitude: '',
          longitude: '',
          isFavourite: false,
          images: [],
          category: null,
          subCategory: null, price: '0',
        ),
      );
}
