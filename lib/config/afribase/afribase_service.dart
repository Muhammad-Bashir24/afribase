import 'package:afribase/afribase.dart';
import 'afribase_setup.dart';

class AfribaseService {
  static late final AfribaseClient client;

  static Future<void> init() async {
    client = AfribaseClient(url!, anonKey!);
  }
}
