import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

enum Pose {
  standing,
  sitting,
  selfie,
  carSelfie,
  walking
  ;

  String get displayName => switch (this) {
    Pose.carSelfie => 'Car selfie',
    _ => '${name[0].toUpperCase()}${name.substring(1)}',
  };
}

enum AgeRange {
  youngAdults,
  adults,
  middleAgedAdults,
  olderAdults
  ;

  String get displayName => switch (this) {
    AgeRange.youngAdults => 'Young adults',
    AgeRange.adults => 'Adults',
    AgeRange.middleAgedAdults => 'Middle-aged adults',
    AgeRange.olderAdults => 'Older adults',
  };

  String get subtitle => switch (this) {
    AgeRange.youngAdults => '18-24',
    AgeRange.adults => '25-39',
    AgeRange.middleAgedAdults => '40-64',
    AgeRange.olderAdults => '65+',
  };

  bool matches(int age) => switch (this) {
    AgeRange.youngAdults => age >= 18 && age <= 24,
    AgeRange.adults => age >= 25 && age <= 39,
    AgeRange.middleAgedAdults => age >= 40 && age <= 64,
    AgeRange.olderAdults => age >= 65,
  };
}

@freezed
abstract class User with _$User {
  const factory User({
    required String id,
    required String firstName,
    required String avatarUrl,
    required String gender,
    required DateTime birthDate,
    required Pose pose,
  }) = _User;

  const User._();

  int get age {
    final today = DateTime.now();
    var currentAge = today.year - birthDate.year;
    final isBeforeBirthday =
        today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day);
    if (isBeforeBirthday) {
      currentAge--;
    }
    return currentAge;
  }
}
