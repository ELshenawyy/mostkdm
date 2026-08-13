import 'package:mostkdm/features/advertisement/data/models/ad_model.dart';
import 'package:mostkdm/features/advertisement/data/models/category_model.dart';
import 'package:mostkdm/features/home/data/models/slider_model.dart';
import 'package:mostkdm/features/search/data/models/search_history_item.dart';

class CoreDummyData {


  static List<SliderModel> get dummySliders => const [
        SliderModel(id: 1, image: '', name: 'إعلان تجريبي 1'),
        SliderModel(id: 2, image: '', name: 'إعلان تجريبي 2'),
      ];

      static List<CategoryModel> get dummyCategories => List.generate(
        8,
        (index) => CategoryModel(
          id: index,
          name: 'قسم تجريبي',
          adsCount: 10,
          isActive: true,
          image: '',
        ),
      );
  // بيانات سجل البحث والكلمات الشائعة للـ Skeleton
  static List<SearchHistoryItem> get searchHistory => const [
        SearchHistoryItem(id: 1, keyword: 'سيارات'),
        SearchHistoryItem(id: 2, keyword: 'هواتف'),
        SearchHistoryItem(id: 3, keyword: 'أثاث'),
        SearchHistoryItem(id: 4, keyword: 'عقارات'),
      ];

  static List<String> get trendingKeywords => const [
        'آيفون',
        'تويوتا',
        'شقق للرعاية',
        'لابتوب',
      ];

  // الإعلانات الوهمية
  static AdModel get dummyAd => AdModel(
        id: 0,
        title: 'عنوان إعلان تجريبي لاختبار التحميل والـ Skeleton',
        price: '1000',
        location: 'الرياض، حي السلامة',
        createdAt: DateTime.now().toIso8601String(),
        cover: '',
        images: const [],
        description: 'وصف إعلان تجريبي',
        visitedCount: 15,
        category: const CategoryModel(
          id: 0,
          name: '',
          adsCount: 0,
          isActive: true,
          image: '',
        ),
        subCategory: const CategoryModel(
          id: 0,
          name: '',
          adsCount: 0,
          isActive: true,
          image: '',
        ),
        isActive: true,
        isActiveLabel: '',
        latitude: '',
        longitude: '',
        isFavourite: false,
      );
      // أضف هذا داخل كلاس CoreDummyData
static List<Map<String, String>> get dummyUsersList => List.generate(
      5,
      (index) => {
        'id': '$index',
        'name': 'اسم مستخدم تجريبي',
        'avatar': '',
      },
    );

  static List<AdModel> get dummyAdsList => List<AdModel>.generate(5, (_) => dummyAd);


  
}