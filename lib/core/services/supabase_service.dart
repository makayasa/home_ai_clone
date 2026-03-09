import 'package:home_ai_clone/core/env.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract final class SupabaseService {
  static bool _isInitialized = false;
  static Future<void>? _initializing;

  static Future<void> initialize() async {
    if (_isInitialized) {
      return;
    }

    if (_initializing != null) {
      return _initializing!;
    }

    _initializing = Supabase.initialize(
      url: AppEnv.supabaseUrl,
      anonKey: AppEnv.supabaseAnonKey,
    ).then((_) {
      _isInitialized = true;
    }).catchError((Object error, StackTrace stackTrace) {
      _initializing = null;
      Error.throwWithStackTrace(error, stackTrace);
    });

    return _initializing!;
  }

  static SupabaseClient get client {
    if (!_isInitialized) {
      throw StateError(
        'SupabaseService is not initialized. Call SupabaseService.initialize() first.',
      );
    }
    return Supabase.instance.client;
  }
}
