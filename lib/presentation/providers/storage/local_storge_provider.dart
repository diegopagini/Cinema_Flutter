import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cine_app/infrastructure/datasources/isar_datasource.dart';
import 'package:cine_app/infrastructure/repositories/local_storage_repository_impl.dart';

final localStorageRepositoryPrivder =
    Provider((ref) => LocalStorageRepositoryImpl(datasource: IsarDatasource()));
