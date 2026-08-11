import 'package:dartz/dartz.dart';
import 'package:mostkdm/core/errors/app_exception.dart';
import 'package:mostkdm/features/contact_us/data/datasource/contact_us_remote_data_source.dart';
import 'package:mostkdm/features/contact_us/data/model/contact_us_model.dart';

abstract class ContactUsRepository {
  Future<Either<AppException, String>> sendcontactUsMessage(
      ContactUsModel contactUs);
}

class ContactUsRepositoryImpl implements ContactUsRepository {
  final ContactUsRemoteDataSource contactUsRemoteDataSource;
  ContactUsRepositoryImpl(this.contactUsRemoteDataSource);
  @override
  Future<Either<AppException, String>> sendcontactUsMessage(
      ContactUsModel contactUs) async {
    try {
      final response =
          await contactUsRemoteDataSource.sendcontactUsMessage(contactUs);
      return Right(response);
    } catch (e) {
      return Left(AppException(message: e.toString()));
    }
  }
}
