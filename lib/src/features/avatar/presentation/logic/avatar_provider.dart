import 'package:flutter/material.dart';
import 'package:zl_test/src/features/avatar/domain/entities/user.dart';
import 'package:zl_test/src/features/avatar/domain/repositories/user_repository.dart';

class AvatarProvider extends ChangeNotifier {
  AvatarProvider(this._userRepository);

  final UserRepository _userRepository;

  final List<User> _users = [];

  // Filter states
  final Set<String> _selectedGenders = {};
  Set<String> get selectedGenders => Set.unmodifiable(_selectedGenders);

  final Set<AgeRange> _selectedAges = {};
  Set<AgeRange> get selectedAges => Set.unmodifiable(_selectedAges);

  final Set<Pose> _selectedPoses = {};
  Set<Pose> get selectedPoses => Set.unmodifiable(_selectedPoses);

  List<User> get users {
    return _users.where((user) {
      if (_selectedGenders.isNotEmpty && !_selectedGenders.contains(user.gender)) {
        return false;
      }
      if (_selectedPoses.isNotEmpty && !_selectedPoses.contains(user.pose)) {
        return false;
      }
      if (_selectedAges.isNotEmpty) {
        var matchesAge = false;
        for (final ageRange in _selectedAges) {
          if (ageRange.matches(user.age)) {
            matchesAge = true;
            break;
          }
        }
        if (!matchesAge) return false;
      }
      return true;
    }).toList();
  }

  void setGenderFilters(Set<String> genders) {
    _selectedGenders
      ..clear()
      ..addAll(genders);
    notifyListeners();
  }

  void setAgeFilters(Set<AgeRange> ages) {
    _selectedAges
      ..clear()
      ..addAll(ages);
    notifyListeners();
  }

  void setPoseFilters(Set<Pose> poses) {
    _selectedPoses
      ..clear()
      ..addAll(poses);
    notifyListeners();
  }

  void clearFilters() {
    _selectedGenders.clear();
    _selectedAges.clear();
    _selectedPoses.clear();
    notifyListeners();
  }

  bool get hasActiveFilters => _selectedGenders.isNotEmpty || _selectedAges.isNotEmpty || _selectedPoses.isNotEmpty;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int _currentPage = 0;
  static const _pageSize = 20;
  bool _hasMore = true;

  Future<void> loadUsers() async {
    if (_isLoading || !_hasMore) return;

    _isLoading = true;
    notifyListeners();

    try {
      final newUsers = await _userRepository.getUsers(_currentPage, _pageSize);
      if (newUsers.isEmpty) {
        _hasMore = false;
      } else {
        _users.addAll(newUsers);
        _currentPage++;
      }
    } on Exception catch (_) {
      // Handle error gracefully
      _hasMore = false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refresh() async {
    _users.clear();
    _currentPage = 0;
    _hasMore = true;
    await loadUsers();
  }
}
