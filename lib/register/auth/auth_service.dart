class AuthService {
  static Future<bool> register({
    required String name,
    required String email,
    required String password,
  }) async {
    // Simulate registration process
    await Future.delayed(Duration(seconds: 2));

    // Return true for successful registration
    return true;
  }

  static bool validateTermsAcceptance(bool acceptTerms) {
    return acceptTerms;
  }
}