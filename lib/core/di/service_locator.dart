import 'package:get_it/get_it.dart';
import 'package:mostkdm/features/advertisement/data/datasource/ad_details_remote_data_source.dart';
import 'package:mostkdm/features/advertisement/data/datasource/add_ads_remote_data_source.dart';
import 'package:mostkdm/features/advertisement/data/datasource/my_ads_remote_data_source.dart';
import 'package:mostkdm/features/advertisement/data/repository/ad_details_repository.dart';
import 'package:mostkdm/features/advertisement/data/repository/add_ad_repository.dart';
import 'package:mostkdm/features/advertisement/data/repository/my_ads_repository.dart';
import 'package:mostkdm/features/advertisement/presentation/bloc/ad_details_bloc.dart';
import 'package:mostkdm/features/advertisement/presentation/bloc/add_ad_bloc.dart';
import 'package:mostkdm/features/advertisement/presentation/bloc/my_ads_bloc.dart';
import 'package:mostkdm/features/home/data/datasource/categories_remote_data_source.dart';
import 'package:mostkdm/features/home/data/datasource/home_remote_data_source.dart';
import 'package:mostkdm/features/home/data/datasource/sub_categories_remote_data_source.dart';
import 'package:mostkdm/features/home/data/repository/categories_repository.dart';
import 'package:mostkdm/features/home/data/repository/home_repository.dart';
import 'package:mostkdm/features/home/data/repository/sub_categories_repository.dart';
import 'package:mostkdm/features/home/presentation/bloc/categories_bloc.dart';
import 'package:mostkdm/features/home/presentation/bloc/home_bloc.dart';
import 'package:mostkdm/features/home/presentation/bloc/sub_categories_bloc.dart';
import 'package:mostkdm/features/search/data/datasource/search_remote_data_source.dart';
import 'package:mostkdm/features/search/data/repository/search_repository.dart';
import 'package:mostkdm/features/search/presentation/bloc/search_bloc.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // Home Feature
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(getIt()),
  );

  getIt.registerFactory<HomeBloc>(
    () => HomeBloc(repository: getIt()),
  );

  // MyAds
  getIt.registerLazySingleton<MyAdsRemoteDataSource>(
    () => MyAdsRemoteDataSourceImpl(),
  );

  getIt.registerLazySingleton<MyAdsRepository>(
    () => MyAdsRepositoryImpl(remoteDataSource: getIt()),
  );

  getIt.registerLazySingleton<MyAdsBloc>(
    () => MyAdsBloc(repository: getIt()),
  );
  // add ad
  getIt.registerLazySingleton<AddAdRemoteDataSource>(
    () => AddAdRemoteDataSourceImpl(),
  );


  getIt.registerLazySingleton<AddAdRepository>(
    () => AddAdRepositoryImpl(),
  );

  getIt.registerFactory<AddAdBloc>(
    () => AddAdBloc(repository: getIt()),
  );

  // AdDetails

  getIt.registerLazySingleton<AdDetailsRemoteDataSource>(
    () => AdDetailsRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<AdDetailsRepository>(
    () => AdDetailsRepositoryImpl(getIt()),
  );
  getIt.registerFactory<AdDetailsBloc>(
    () => AdDetailsBloc(getIt()),
  );
  // Search

  getIt.registerLazySingleton<SearchRemoteDataSource>(
    () => SearchRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<SearchRepository>(
    () => SearchRepositoryImpl(remoteDataSource: getIt()),
  );
  getIt.registerFactory<SearchBloc>(
    () => SearchBloc(repository: getIt()),
  );

  // catigories
  getIt.registerLazySingleton<CategoriesRemoteDataSource>(
    () => CategoriesRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<CategoriesRepository>(
    () => CategoriesRepositoryImpl(getIt()),
  );
  getIt.registerFactory<CategoriesBloc>(
    () => CategoriesBloc(repository: getIt()),
  );
  // sub catigories
  getIt.registerLazySingleton<SubCategoryRemoteDataSource>(
    () => SubCategoryRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<SubCategoriesRepository>(
    () => SubCategoriesRepositoryImpl(getIt()),
  );
  getIt.registerFactory<SubCategoryBloc>(
    () => SubCategoryBloc(repository: getIt()),
  );
  
}
