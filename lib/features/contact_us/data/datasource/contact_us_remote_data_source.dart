import 'package:mostkdm/core/network/api_consumer.dart';
import 'package:mostkdm/core/network/api_endpoints.dart';
import 'package:mostkdm/features/contact_us/data/model/contact_us_model.dart';

abstract class ContactUsRemoteDataSource {
  Future<String> sendcontactUsMessage(ContactUsModel contactUs);
}

class ContactUsRemoteDataSourceImpl implements ContactUsRemoteDataSource {
  final ApiConsumer _api;
  ContactUsRemoteDataSourceImpl(this._api);
  @override
  Future<String> sendcontactUsMessage(ContactUsModel contactUs) async {
    final response =
        await _api.post(ApiEndpoints.contactUs, data: contactUs.toJson());
    return response['message'] ?? "تم إرسال الرسالة بنجاح";
  }
}
