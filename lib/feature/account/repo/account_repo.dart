import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:freeplay/core/constants/constants.dart';
import 'package:freeplay/core/dio/app_dio.dart';
import 'package:freeplay/core/domain/login_params/login_params.dart';
import 'package:freeplay/core/error/custom_exception.dart';
import 'package:freeplay/core/error/error_type.dart';
import 'package:freeplay/core/error/failure.dart';
import 'package:freeplay/core/local_storage/local_storage_service.dart';
import 'package:injectable/injectable.dart';

enum Result { failed, completed }

@injectable
class AccountRepo {
  AccountRepo(this._dio);

  final AppDio _dio;

  Future<Either<Failure, bool>> logOut() async {
    try {
      Response response = await _dio.postRequest(path: 'auth/logout');
      if (response.data['result'] == Result.completed.name) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            ErrorType.unmodified,
          ),
        );
      }
    } on CustomException catch (e) {
      return Left(Failure(e.errorType));
    }
  }

  Future<Either<Failure, bool>> deleteAccount(
      {required String password}) async {
    try {
      Response response = await _dio
          .deleteRequest(path: 'auth/delete', data: {"password": password});

      if (response.data['result'] == Result.completed.name) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            ErrorType.unmodified,
          ),
        );
      }
    } on CustomException catch (e) {
      return Left(Failure(e.errorType));
    }
  }

  Future cleanLocalStorage() async {
    await LocalStorage.remove(SHARED_PREFS_ACCESS_TOKEN);
    await LocalStorage.remove(Freeplay_User);
  }
}
