import 'package:dartz/dartz.dart';
import 'package:freeplay/core/dio/app_dio.dart';
import 'package:freeplay/core/domain/contest/contest.dart';
import 'package:freeplay/core/error/custom_exception.dart';
import 'package:freeplay/core/error/error_type.dart';
import 'package:freeplay/core/error/failure.dart';
import 'package:injectable/injectable.dart';

@injectable
class ContestsRepo {
  ContestsRepo(this._dio);

  final AppDio _dio;

  Future<Either<Failure, List<Contest>>> getContests() async {
    try {
      final response = await _dio.getRequest(path: '/contests');
      return Right((response.data['data'] as List)
          .map((e) => Contest.fromJson(e))
          .toList());
    } on CustomException catch (e) {
      return Left(Failure(e.errorType));
    }
  }

  Future<Either<Failure, bool>> joinContest({required String contestId}) async {
    try{
    final response = await _dio.postRequest(path: '/contests/$contestId/join',);
    if (response.data['result']) {
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
}