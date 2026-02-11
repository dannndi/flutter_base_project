import 'package:base_project/core/env/env.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  test("load correct base url", () {
    expect(Env.baseUrl, "https://your-endpoint.com/");
  });
}
