import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smoothie_plays_mobile/domain/entities/auth/auth_entity.dart';
import 'package:smoothie_plays_mobile/domain/usecases/auth/signup_usecase.dart';

import 'repository.mock.dart';

void main() {
  late MockAuthRepository mockAuthRepository;
  late SignupUseCase signupUseCase;

  final dummyAuthEntity = AuthEntity(
    userId: 'userSignup1',
    email: 'signup@example.com',
    fullName: 'Signup User',
    photo: 'dummyPhoto', // Provided, but not under test
    token: 'signupToken',
  );

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    signupUseCase = SignupUseCase(repository: mockAuthRepository);
  });

  test('should call repository.signup once with correct parameters', () async {
    final testEmail = 'signup@example.com';
    final testFullName = 'Signup User';
    final testPassword = 'signupPass';
    final testPhoto = 'dummyPhoto'; // Passed as required, but not verified
    when(() => mockAuthRepository.signup(
            testEmail, testFullName, testPassword, testPhoto))
        .thenAnswer((_) async => dummyAuthEntity);

    // Act
    await signupUseCase.execute(
      email: testEmail,
      fullName: testFullName,
      password: testPassword,
      photo: testPhoto,
    );

    verify(() => mockAuthRepository.signup(
        testEmail, testFullName, testPassword, testPhoto)).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });

  test(
      'should return an AuthEntity with correct values when signup is successful',
      () async {
    final testEmail = 'signup@example.com';
    final testFullName = 'Signup User';
    final testPassword = 'signupPass';
    final testPhoto = 'dummyPhoto';
    when(() => mockAuthRepository.signup(
            testEmail, testFullName, testPassword, testPhoto))
        .thenAnswer((_) async => dummyAuthEntity);

    // Act
    final result = await signupUseCase.execute(
      email: testEmail,
      fullName: testFullName,
      password: testPassword,
      photo: testPhoto,
    );

    expect(result.userId, equals(dummyAuthEntity.userId));
    expect(result.email, equals(dummyAuthEntity.email));
    expect(result.fullName, equals(dummyAuthEntity.fullName));
    expect(result.token, equals(dummyAuthEntity.token));
  });

  test('should throw an exception when repository.signup throws', () async {
    final testEmail = 'signup@example.com';
    final testFullName = 'Signup User';
    final testPassword = 'signupPass';
    final testPhoto = 'dummyPhoto';
    when(() => mockAuthRepository.signup(
            testEmail, testFullName, testPassword, testPhoto))
        .thenThrow(Exception('Signup failed'));

    // Act & Assert
    expect(
      () async => await signupUseCase.execute(
        email: testEmail,
        fullName: testFullName,
        password: testPassword,
        photo: testPhoto,
      ),
      throwsA(isA<Exception>()),
    );
  });

  test('should handle empty parameters by returning the expected AuthEntity',
      () async {
    const emptyEmail = '';
    const emptyFullName = '';
    const emptyPassword = '';
    const emptyPhoto = ''; // Required, but value is empty
    final dummyEmptyAuthEntity = AuthEntity(
      userId: 'emptyUser',
      email: emptyEmail,
      fullName: emptyFullName,
      photo: emptyPhoto,
      token: 'emptyToken',
    );
    when(() => mockAuthRepository.signup(
            emptyEmail, emptyFullName, emptyPassword, emptyPhoto))
        .thenAnswer((_) async => dummyEmptyAuthEntity);

    final result = await signupUseCase.execute(
      email: emptyEmail,
      fullName: emptyFullName,
      password: emptyPassword,
      photo: emptyPhoto,
    );

    expect(result.userId, equals(dummyEmptyAuthEntity.userId));
    expect(result.email, equals(dummyEmptyAuthEntity.email));
    expect(result.fullName, equals(dummyEmptyAuthEntity.fullName));
    expect(result.token, equals(dummyEmptyAuthEntity.token));
  });

  test('should not call repository.signup more than once per execute call',
      () async {
    final testEmail = 'signup@example.com';
    final testFullName = 'Signup User';
    final testPassword = 'signupPass';
    final testPhoto = 'dummyPhoto';
    when(() => mockAuthRepository.signup(
            testEmail, testFullName, testPassword, testPhoto))
        .thenAnswer((_) async => dummyAuthEntity);

    await signupUseCase.execute(
      email: testEmail,
      fullName: testFullName,
      password: testPassword,
      photo: testPhoto,
    );

    verify(() => mockAuthRepository.signup(
        testEmail, testFullName, testPassword, testPhoto)).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });
}
