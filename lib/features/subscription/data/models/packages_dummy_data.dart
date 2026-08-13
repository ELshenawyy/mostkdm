import 'package:mostkdm/features/subscription/data/models/packages_feature_model.dart';
import 'package:mostkdm/features/subscription/data/models/packages_model.dart';
import 'package:mostkdm/features/subscription/data/models/subscription_response_model.dart';

class PackagesDummyData {
  // ميزة وهمية لاستخدامها في الباقة
  static const PackageFeatureModel dummyFeature = PackageFeatureModel(
    title: 'ميزة إضافية افتراضية',
    description: 'تفاصيل الميزة الافتراضية للتحميل',
    isIncluded: true,
  );

  // باقة وهمية مفردة
  static const PackageModel dummyPackage = PackageModel(
    id: 0,
    type: 1,
    typeLabel: 'باقة مميزة',
    title: 'عنوان الباقة الافتراضي',
    content: 'تفاصيل ووصف الباقة الافتراضي أثناء عملية التحميل بالكامل',
    adsCount: 5,
    durationValue: 30,
    durationUnit: 'day',
    durationUnitLabel: 'يوم',
    features: [dummyFeature, dummyFeature, dummyFeature],
    price: 100,
    isActive: true,
    createdAt: '',
    updatedAt: '',
  );

  // قائمة باقات وهمية لعرضها أثناء الـ Loading في Skeletonizer
  static List<PackageModel> get dummyPackagesList => [
        dummyPackage,
        dummyPackage,
        dummyPackage,
      ];

  // استجابة اشتراك وهمية (في حال احتجتها أثناء تحميل عملية الدفع)
  static final SubscriptionResponseModel dummySubscriptionResponse =
      SubscriptionResponseModel(
    subscriptionId: 0,
    packageId: 0,
    price: 100,
    currency: 'SAR',
    paymentMethod: 'card',
    paymentUrl: null,
    startDate: '2026-01-01',
    endDate: '2026-02-01',
    paymentId: 0,
  );
}