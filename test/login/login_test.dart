import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'login_test.mocks.dart';

@GenerateMocks([UserRepository])
void main() {
  late UserRepository repository;
  late Login useCase;
  setUp(() {
    repository = MockUserRepository();
    useCase = Login(repository: repository);
  });
  group('Login', () {
    test('Login with repository', () {
      var email = "test@test.com";
      var pass = "password";
      useCase(email: email, pass: pass);

      verify<void>(repository.login(email: email, pass: pass)); // 呼ばれたかどうか
      when(repository.login(email: email, pass: pass))
          .thenAnswer((_) => null); // 値
    });
    test('リポジトリのログイン実行結果を返す', () async {
      // arrange
      var email = "test@test.com";
      var pass = "password";
      when(repository.login(email: email, pass: pass)).thenAnswer((_) => null);
      final expected = User(userId: 1);
      // act
      final actual = await useCase(email: email, pass: pass);
      // assert
      expect(actual, expected);
    });
    // test('Login with repository', () {});
  });
}

abstract class UserRepository {
  void login({required String email, required String pass});
}

class Login {
  Login({required this.repository});
  final UserRepository repository;

  Future<User> call({required String email, required String pass}) {
    repository.login(email: email, pass: pass); // 👈 実行するだけ
    return Future.value(User(userId: 1));
  }
}

class User {
  User({required this.userId});
  final int userId;
}
