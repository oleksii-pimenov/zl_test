import 'package:zl_test/app/app.dart';
import 'package:zl_test/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
