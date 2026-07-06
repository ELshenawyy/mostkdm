// features/home/data/models/ad_model.dart

class AdsModel {
  final String image;
  final String title;
  final String price;
  final String location;
  final String date;
  final String views;

  const AdsModel({
    required this.image,
    required this.title,
    required this.price,
    required this.location,
    required this.date,
    required this.views,
  });
}