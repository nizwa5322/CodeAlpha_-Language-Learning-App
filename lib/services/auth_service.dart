import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  SharedPreferences? _prefs;
  String? _currentUser;
  bool _isLoggedIn = false;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    _isLoggedIn = _prefs?.getBool('is_logged_in') ?? false;
    _currentUser = _prefs?.getString('user_id');
  }

  Future<Map<String, dynamic>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      // For demo purposes, accept any email/password
      if (email.isNotEmpty && password.isNotEmpty) {
        _isLoggedIn = true;
        _currentUser = 'user_123';
        await _prefs?.setBool('is_logged_in', true);
        await _prefs?.setString('user_id', _currentUser!);
        await _prefs?.setString('user_email', email);

        return {
          'success': true,
          'user': _currentUser,
        };
      }
      return {
        'success': false,
        'error': 'Invalid email or password',
      };
    } catch (e) {
      return {
        'success': false,
        'error': 'An unexpected error occurred',
      };
    }
  }

  Future<Map<String, dynamic>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty && name.isNotEmpty) {
        _isLoggedIn = true;
        _currentUser = 'user_${DateTime.now().millisecondsSinceEpoch}';
        await _prefs?.setBool('is_logged_in', true);
        await _prefs?.setString('user_id', _currentUser!);
        await _prefs?.setString('user_email', email);
        await _prefs?.setString('user_name', name);

        return {
          'success': true,
          'user': _currentUser,
        };
      }
      return {
        'success': false,
        'error': 'Please fill all fields',
      };
    } catch (e) {
      return {
        'success': false,
        'error': 'An unexpected error occurred',
      };
    }
  }

  Future<void> signOut() async {
    _isLoggedIn = false;
    _currentUser = null;
    await _prefs?.clear();
  }

  bool isLoggedIn() {
    return _isLoggedIn;
  }

  String? getCurrentUser() {
    return _currentUser;
  }

  Future<String?> getUserId() async {
    return _prefs?.getString('user_id');
  }

  Future<String?> getUserEmail() async {
    return _prefs?.getString('user_email');
  }

  Future<String?> getUserName() async {
    return _prefs?.getString('user_name');
  }
}
