import 'package:equatable/equatable.dart';

class SellerModel extends Equatable {
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'mobile': mobile,
      'is_following': isFollowing,
      'user_ads_count': adsCount,
    };
  }

  @override
  List<Object?> get props => [id, name, image, mobile, isFollowing, adsCount];
}
