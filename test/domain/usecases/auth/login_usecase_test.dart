import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smoothie_plays_mobile/domain/entities/auth/auth_entity.dart';
import 'package:smoothie_plays_mobile/domain/usecases/auth/login_usecase.dart';

import 'repository.mock.dart';

void main() {
  late MockAuthRepository mockAuthRepository;
  late LoginUseCase loginUseCase;

  final dummyAuthEntity = AuthEntity(
    userId: 'user1',
    email: 'test@example.com',
    fullName: 'Test User',
    photo: 'dummyPhoto', // Provided, but not under test
    token: 'dummyToken',
  );

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    loginUseCase = LoginUseCase(repository: mockAuthRepository);
  });

  test('should call repository.login once with correct parameters', () async {
    // Arrange
    final testEmail = 'test@example.com';
    final testPassword = 'password123';
    when(() => mockAuthRepository.login(testEmail, testPassword))
        .thenAnswer((_) async => dummyAuthEntity);

    // Act
    await loginUseCase.execute(testEmail, testPassword);

    // Assert
    verify(() => mockAuthRepository.login(testEmail, testPassword)).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });

  test(
      'should return an AuthEntity with correct values when login is successful',
      () async {
    // Arrange
    final testEmail = 'test@example.com';
    final testPassword = 'password123';
    when(() => mockAuthRepository.login(testEmail, testPassword))
        .thenAnswer((_) async => dummyAuthEntity);

    // Act
    final result = await loginUseCase.execute(testEmail, testPassword);

    // Assert (verify only the required fields, not photo)
    expect(result.userId, equals(dummyAuthEntity.userId));
    expect(result.email, equals(dummyAuthEntity.email));
    expect(result.fullName, equals(dummyAuthEntity.fullName));
    expect(result.token, equals(dummyAuthEntity.token));
  });

  test('should throw an exception when repository.login throws', () async {
    // Arrange
    final testEmail = 'test@example.com';
    final testPassword = 'password123';
    when(() => mockAuthRepository.login(testEmail, testPassword))
        .thenThrow(Exception('Login failed'));

    // Act & Assert
    expect(() async => await loginUseCase.execute(testEmail, testPassword),
        throwsA(isA<Exception>()));
  });

  test(
      'should handle empty email and password by returning the expected AuthEntity',
      () async {
    // Arrange
    const emptyEmail = '';
    const emptyPassword = '';
    final dummyEmptyAuthEntity = AuthEntity(
      userId: 'emptyUser',
      email: emptyEmail,
      fullName: 'Empty User',
      photo: 'dummyPhoto',
      token: 'emptyToken',
    );
    when(() => mockAuthRepository.login(emptyEmail, emptyPassword))
        .thenAnswer((_) async => dummyEmptyAuthEntity);

    // Act
    final result = await loginUseCase.execute(emptyEmail, emptyPassword);

    // Assert (verify only the required fields, not photo)
    expect(result.userId, equals(dummyEmptyAuthEntity.userId));
    expect(result.email, equals(dummyEmptyAuthEntity.email));
    expect(result.fullName, equals(dummyEmptyAuthEntity.fullName));
    expect(result.token, equals(dummyEmptyAuthEntity.token));
  });

  test('should not call repository.login more than once per execute call',
      () async {
    // Arrange
    final testEmail = 'test@example.com';
    final testPassword = 'password123';
    when(() => mockAuthRepository.login(testEmail, testPassword))
        .thenAnswer((_) async => dummyAuthEntity);

    // Act
    await loginUseCase.execute(testEmail, testPassword);

    // Assert
    verify(() => mockAuthRepository.login(testEmail, testPassword)).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });
}
