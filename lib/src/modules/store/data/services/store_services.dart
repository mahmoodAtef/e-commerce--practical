import 'package:dartz/dartz.dart';
import 'package:online_store/src/core/apis/dio_helper.dart';
import 'package:online_store/src/core/apis/end_points.dart';
import 'package:online_store/src/modules/store/data/models/category.dart';
import 'package:online_store/src/modules/store/data/models/product.dart';

class StoreServices {
  /// Fetch all products
  Future<Either<Exception, List<Product>>> getAllProducts() async {
    try {
      final response = await DioHelper.getData(
        path: EndPoints.getProducts,  // Use endpoint from EndPoints
      );

      if (response.statusCode == 200) {
        List<Product> products = (response.data as List)
            .map((json) => Product.fromJson(json))
            .toList();
        return Right(products);
      } else {
        throw Exception('Failed to fetch products: ${response.data['message']}');
      }
    } on Exception catch (e) {
      return Left(e);
    }
  }

  /// Fetch all categories
  Future<Either<Exception, List<Category>>> getAllCategories() async {
    try {
      final response = await DioHelper.getData(
        path: EndPoints.getCategories,  // Use endpoint from EndPoints
      );

      if (response.statusCode == 200) {
        List<Category> categories = (response.data as List)
            .map((json) => Category.fromJson(json))
            .toList();
        return Right(categories);
      } else {
        throw Exception('Failed to fetch categories: ${response.data['message']}');
      }
    }on Exception catch (e) {
      return Left(e);
    }
  }

  /// Add product to favorites
  Future<Either<Exception, Unit>> addToFavorites({
    required int userId,
    required int productId,
  }) async {
    try {
      final response = await DioHelper.postData(
        path: '${EndPoints.addToFavorite}/$userId',  // Use endpoint for adding to favorites
        data: {'product_id': productId},
      );

      if (response.statusCode == 200) {

        return const Right(unit);
      } else {
        throw Exception('Failed to add product to favorites: ${response.data['message']}');
      }
    } on Exception catch (e) {
      return Left(e);
    }
  }

  /// Remove product from favorites
  Future<Either<Exception, Unit>> removeFromFavorites({
    required int userId,
    required int productId,
  }) async {
    try {
      final response = await DioHelper.postData(
        path: '${EndPoints.removeFromFavorite}/$userId',  // Use endpoint for removing from favorites
        data: {'product_id': productId},
      );

      if (response.statusCode == 200) {

        return const Right(unit);
      } else {
        throw Exception('Failed to remove product from favorites: ${response.data['message']}');
      }
    }on Exception catch (e) {
      return Left(e);
    }
  }
}
