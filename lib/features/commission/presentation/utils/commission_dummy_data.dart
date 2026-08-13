class CommissionAdModel {
  final int id;
  final String image;
  final String title;
  final String price;
  final bool isPaid;

  const CommissionAdModel({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.isPaid,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'title': title,
      'price': price,
      'isPaid': isPaid,
    };
  }
}

class CommissionDummyData {
  // إعلان وهمي مفرد لاستخدامه في حالة التحميل المفردة
  static const Map<String, dynamic> dummyAd = {
    'id': 0,
    'image': '',
    'title': 'عنوان إعلان افتراضي للعرض أثناء التحميل',
    'price': '0000 ₴',
    'isPaid': false,
  };

  // قائمة إعلانات وهمية لاستخدامها في Skeletonizer الخواص بالقائمة
  static List<Map<String, dynamic>> get dummyAdsList => [
        dummyAd,
        dummyAd,
        dummyAd,
      ];
}