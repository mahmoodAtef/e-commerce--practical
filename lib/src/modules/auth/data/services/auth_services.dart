import 'package:dartz/dartz.dart';
import 'package:online_store/src/core/apis/dio_helper.dart';
import 'package:online_store/src/core/apis/end_points.dart';
import 'package:online_store/src/modules/auth/data/models/registration_form.dart';
import 'package:online_store/src/modules/auth/data/models/user.dart';


class AuthService {
  /// Login function
  Future<Either<Exception, User>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await DioHelper.postData(
        path: EndPoints.login,  // Use endpoint from EndPoints class
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        final user = User.fromJson(response.data);
        return Right(user);
      } else {
        throw Exception('Login failed: ${response.data['message']}');
      }
    }on Exception catch (e) {
      return Left(e);
    }
  }

  /// Register function
  Future<Either<Exception, User>> register(RegistrationForm form) async {
    try {
      final response = await DioHelper.postData(
        path: EndPoints.register,  // Use endpoint from EndPoints class
        data: form.toJson(),
      );

      if (response.statusCode == 201) {
        final user = User.fromJson(response.data);
        return Right(user);
      } else {
        throw Exception('Registration failed: ${response.data['message']}');
      }
    } on Exception catch (e) {
      return Left(e);
    }
  }

  /// Forget Password function
  Future<Either<Exception, bool>> forgetPassword(String email) async {
    try {
      final response = await DioHelper.postData(
        path: EndPoints.resetPass,  // Use endpoint from EndPoints class
        data: {'email': email},
      );

      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        throw Exception('Forget password failed: ${response.data['message']}');
      }
    } on Exception catch (e) {
      return Left(e);
    }
  }

  /// Update User Data function
  Future<Either<Exception, User>> updateData({
    required int userId,
    required Map<String, dynamic> updatedData,
  }) async {
    try {
      final response = await DioHelper.putData(
        path: '${EndPoints.updateUser}/$userId',  // Use endpoint from EndPoints class
        data: updatedData,
      );

      if (response.statusCode == 200) {
        final updatedUser = User.fromJson(response.data);
        return Right(updatedUser);
      } else {
        throw Exception('Update failed: ${response.data['message']}');
      }
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
