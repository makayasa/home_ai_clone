import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppEnv {
  AppEnv._();

  static Future<void> load() async {
    await dotenv.load(fileName: '.env');
  }

  static String _required(String key) {
    final String value = dotenv.env[key] ?? '';
    if (value.isEmpty) {
      throw StateError('Missing required env var: $key');
    }
    return value;
  }

  static String get supabaseUrl => _required('SUPABASE_URL');
  static String get supabaseAnonKey => _required('SUPABASE_ANON_KEY');
}
