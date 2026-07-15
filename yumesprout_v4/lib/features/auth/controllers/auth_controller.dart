import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../services/auth_service.dart';

class AuthController extends ChangeNotifier {
  AuthController();

  final AuthService _authService = AuthService.instance;

  UserModel? _user;
  bool _isLoading = false;
  String? _error;

  UserModel? get user => _user;

  bool get isLoading => _isLoading;

  bool get isLoggedIn => _user != null;

  String? get error => _error;

  Future<void> signInWithGoogle() async {
    if (_isLoading) return;

    _setLoading(true);

    try {
      _clearError();

      _user = await _authService.signInWithGoogle();
    } catch (e) {
      _error = _formatError(e);
    } finally {
      _setLoading(false);
    }
  }

  Future<void> refreshUser() async {
    try {
      _user = await _authService.getCurrentUser();
      notifyListeners();
    } catch (e) {
      _error = _formatError(e);
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    try {
      await _authService.signOut();
      _user = null;
      _clearError();
    } catch (e) {
      _error = _formatError(e);
    } finally {
      notifyListeners();
    }
  }

  void clearError() {
    _clearError();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _clearError() {
    _error = null;
  }

  String _formatError(Object error) {
    final text = error.toString();

    if (text.contains('network')) {
      return 'No internet connection.';
    }

    if (text.contains('cancel')) {
      return 'Google sign-in cancelled.';
    }

    return text.replaceFirst('Exception: ', '');
  }
}