import 'package:dartz/dartz.dart';
import 'package:mostkdm/core/errors/app_exception.dart';
import 'package:mostkdm/features/notification/data/datasourse/notification_remote_data_source.dart';
import 'package:mostkdm/features/notification/data/models/notification_model.dart';

abstract class NotificationRepository {
  Future<Either<AppException, List<NotificationModel>>> getNotifications();
  Future<Either<AppException, void>> markAllNotificationsAsRead();
  Future<Either<AppException, int>> getUnreadNotificationsCount();
  Future<Either<AppException, void>> deleteNotification(
      {required String notificationId});
  Future<Either<AppException, void>> deleteAllNotifications();
}


class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDataSource _remoteDataSource;

  NotificationRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<AppException, List<NotificationModel>>> getNotifications() async {
    try {
      final response = await _remoteDataSource.getNotifications();
      return Right(response);
    } catch (e) {
      return Left(AppException(message: e.toString()));
    }
  }

  @override
  Future<Either<AppException, void>> markAllNotificationsAsRead() async {
    try {
      await _remoteDataSource.markAllNotificationsAsRead();
      return const Right(null);
    } catch (e) {
      return Left(AppException(message: e.toString()));
    }
  }

  @override
  Future<Either<AppException, int>> getUnreadNotificationsCount() async {
    try {
      final count = await _remoteDataSource.getUnreadNotificationsCount();
      return Right(count);
    } catch (e) {
      return Left(AppException(message: e.toString()));
    }
  }

  @override
  Future<Either<AppException, void>> deleteNotification(
      {required String notificationId}) async {
    try {
      await _remoteDataSource.deleteNotification(notificationId: notificationId);
      return const Right(null);
    } catch (e) {
      return Left(AppException(message: e.toString()));
    }
  }

  @override
  Future<Either<AppException, void>> deleteAllNotifications() async {
    try {
      await _remoteDataSource.deleteAllNotifications();
      return const Right(null);
    } catch (e) {
      return Left(AppException(message: e.toString()));
    }
  }
}
