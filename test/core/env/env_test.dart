import 'package:base_project/core/env/env.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final dummyEnv = "BASE_URL=https://your-endpoint.com/";
  setUp(() {
    dotenv.loadFromString(envString: dummyEnv);
  });

  test("load correct base url", () {
    expect(Env.baseUrl, "https://your-endpoint.com/");
  });
}
