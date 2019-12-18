class SignupRepository {
  Future<bool> signupUser(String username, String password) async {
    await Future.delayed(Duration(seconds: 2));
    return (username == 'ala' && password == 'ala');
  }
}
