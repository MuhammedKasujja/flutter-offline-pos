import 'package:offline_kalteck_pos/core/models/models.dart';

import '../../data/models/models.dart';

abstract class IAuthRepository {
  Future<ApiResponse<UserModel>> login(
      {required String email, required String password});

  Future<UserModel> register({
    required String firstName,
    required String lastName,
    required String email,
    required String telephone,
    required String password,
  });
}
