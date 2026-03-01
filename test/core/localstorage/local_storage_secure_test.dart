import 'package:base_project/core/local_storage/local_storage.dart';
import 'package:base_project/core/local_storage/local_storage_secure.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  late MockFlutterSecureStorage mockStorage;
  late LocalStorageSecure localStorage;

  setUp(() {
    mockStorage = MockFlutterSecureStorage();
    localStorage = LocalStorageSecure();
    localStorage.storage = mockStorage; // inject mock
  });

  test('should initialize FlutterSecureStorage in init', () async {
    await localStorage.init();

    expect(localStorage.storage, isA<FlutterSecureStorage>());
  });

  test('should save and get string', () async {
    when(
      () => mockStorage.write(key: 'key', value: 'value'),
    ).thenAnswer((_) async => {});
    final saveResult = await localStorage.saveString('key', 'value');
    expect(saveResult, LocalStorageResult.saved);

    when(() => mockStorage.read(key: 'key')).thenAnswer((_) async => 'value');
    final readValue = await localStorage.getString('key');
    expect(readValue, 'value');
  });

  test('should save and get int', () async {
    when(
      () => mockStorage.write(key: 'key', value: '42'),
    ).thenAnswer((_) async => {});
    final saveResult = await localStorage.saveInt('key', 42);
    expect(saveResult, LocalStorageResult.saved);

    when(() => mockStorage.read(key: 'key')).thenAnswer((_) async => '42');
    final readValue = await localStorage.getInt('key');
    expect(readValue, 42);
  });

  test('should save bool as "1" or "0"', () async {
    when(
      () => mockStorage.write(key: 'key', value: '1'),
    ).thenAnswer((_) async => {});
    final result = await localStorage.saveBool('key', true);
    expect(result, LocalStorageResult.saved);

    when(
      () => mockStorage.write(key: 'key', value: '0'),
    ).thenAnswer((_) async => {});
    final resultFalse = await localStorage.saveBool('key', false);
    expect(resultFalse, LocalStorageResult.saved);
  });

  test('should get bool correctly', () async {
    when(() => mockStorage.read(key: 'key')).thenAnswer((_) async => '1');
    final value = await localStorage.getBool('key');
    expect(value, true);

    when(() => mockStorage.read(key: 'key')).thenAnswer((_) async => '0');
    final valueFalse = await localStorage.getBool('key');
    expect(valueFalse, false);
  });

  test('should remove data', () async {
    when(() => mockStorage.delete(key: 'key')).thenAnswer((_) async => {});
    final result = await localStorage.removeData('key');
    expect(result, LocalStorageResult.deleted);
  });

  test('should handle exceptions gracefully', () async {
    when(
      () => mockStorage.write(
        key: any(named: 'key'),
        value: any(named: 'value'),
      ),
    ).thenThrow(Exception('fail'));
    final result = await localStorage.saveBool('key', true);
    expect(result, LocalStorageResult.failed);
  });

  test('saveString returns failed when exception occurs', () async {
    when(
      () => mockStorage.write(key: 'key', value: 'value'),
    ).thenThrow(Exception('error'));

    final result = await localStorage.saveString('key', 'value');

    expect(result, LocalStorageResult.failed);
  });

  test('saveInt returns failed when exception occurs', () async {
    when(
      () => mockStorage.write(key: 'key', value: '42'),
    ).thenThrow(Exception('error'));

    final result = await localStorage.saveInt('key', 42);

    expect(result, LocalStorageResult.failed);
  });

  test('saveBool returns failed when exception occurs', () async {
    when(
      () => mockStorage.write(key: 'key', value: '1'),
    ).thenThrow(Exception('error'));

    final result = await localStorage.saveBool('key', true);

    expect(result, LocalStorageResult.failed);
  });

  test('getString returns null when exception occurs', () async {
    when(
      () => mockStorage.read(key: 'key'),
    ).thenThrow(Exception('error'));

    final result = await localStorage.getString('key');

    expect(result, isNull);
  });

  test('getInt returns null when exception occurs', () async {
    when(
      () => mockStorage.read(key: 'key'),
    ).thenThrow(Exception('error'));

    final result = await localStorage.getInt('key');

    expect(result, isNull);
  });

  test('getBool returns false when exception occurs', () async {
    when(
      () => mockStorage.read(key: 'key'),
    ).thenThrow(Exception('error'));

    final result = await localStorage.getBool('key');

    expect(result, false);
  });

  test('removeData returns failed when exception occurs', () async {
    when(
      () => mockStorage.delete(key: 'key'),
    ).thenThrow(Exception('error'));

    final result = await localStorage.removeData('key');

    expect(result, LocalStorageResult.failed);
  });
}
