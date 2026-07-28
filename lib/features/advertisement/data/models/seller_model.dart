class SellerModel {
  final int id;
  final String name;
  final String image;
  final String mobile;
  final bool isFollowing;
  final int adsCount;

  const SellerModel({
    required this.id,
    required this.mobile,
    required this.isFollowing,
    required this.adsCount,
    required this.name,
    required this.image,
  });

  factory SellerModel.fromJson(Map<String, dynamic> json) {
    return SellerModel(
      name: json['name'],
      image: json['image'],
      id: json['id'],
      mobile: json['mobile'],
      isFollowing: json['is_following'],
      adsCount: json['user_ads_count'],
    );
  }
}
