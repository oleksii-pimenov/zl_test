import 'package:zl_test/src/features/avatar/domain/entities/user.dart';

/// Repository interface for fetching users.
// ignore: one_member_abstracts
abstract class UserRepository {
  Future<List<User>> getUsers(int page, int limit);
}
