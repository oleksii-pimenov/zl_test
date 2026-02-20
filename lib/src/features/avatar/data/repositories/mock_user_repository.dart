import 'dart:math';

import 'package:zl_test/gen/assets.gen.dart';
import 'package:zl_test/src/features/avatar/domain/entities/user.dart';
import 'package:zl_test/src/features/avatar/domain/repositories/user_repository.dart';

class MockUserRepository implements UserRepository {
  final _random = Random();

  final _firstNames = [
    'Alice',
    'Bob',
    'Charlie',
    'David',
    'Eve',
    'Frank',
    'Grace',
    'Hannah',
    'Isaac',
    'Jack',
    'Katie',
    'Liam',
    'Mia',
    'Noah',
    'Olivia',
    'Paul',
    'Quinn',
    'Rachel',
    'Sam',
    'Tina',
  ];

  @override
  Future<List<User>> getUsers(int page, int limit) async {
    // Simulate network delay
    await Future<void>.delayed(const Duration(milliseconds: 500));

    return List.generate(limit, (index) {
      final id = (page * limit + index).toString();
      final firstName = _firstNames[_random.nextInt(_firstNames.length)];
      final gender = _random.nextBool() ? 'Male' : 'Female';
      final birthDate = DateTime.now().subtract(
        Duration(days: _random.nextInt(365 * 50) + 365 * 18),
      );
      final avatarAssets = [
        Assets.img.avatar1,
        Assets.img.avatar2,
        Assets.img.avatar3,
        Assets.img.avatar4,
        Assets.img.avatar5,
        Assets.img.avatar6,
        Assets.img.avatar7,
        Assets.img.avatar8,
      ];
      final avatarUrl = avatarAssets[_random.nextInt(avatarAssets.length)].path;

      final pose = Pose.values[_random.nextInt(Pose.values.length)];

      return User(
        id: id,
        firstName: firstName,
        gender: gender,
        birthDate: birthDate,
        avatarUrl: avatarUrl,
        pose: pose,
      );
    });
  }
}
