import 'package:mostkdm/features/favorite/data/model/seller_model.dart';

class FollowingDummyData {
  static const SellerModel _dummySeller = SellerModel(
    id: 0,
    name: 'اسم مستخدم تجريبي',
    mobile: '0500000000',
    adsCount: 5,
    isFollowing: true, image: 'https://i.pravatar.cc/300',
  );

  static List<SellerModel> get dummySellersList =>
      List<SellerModel>.generate(5, (_) => _dummySeller);
}