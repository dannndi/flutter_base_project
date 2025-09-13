import 'dart:io';

import 'package:base_project/core/component/image/design_assets.dart';
import 'package:base_project/core/component/image/design_image.dart';
import 'package:base_project/core/component/image/assets/file_assets_io.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

/// Dummy asset class just to hit the final `return const SizedBox();` branch
class _DummyAssets implements DesignAssets {}

/// A fake ExtendedImageState that lets us control LoadState
class _FakeExtendedImageState implements ExtendedImageState {
  _FakeExtendedImageState(this._state);

  final LoadState _state;

  @override
  LoadState get extendedImageLoadState => _state;

  // we only need this one; the rest can throw or return null
  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  group("NetworkAssets", () {
    testWidgets('should renders ExtendedImage.network for NetworkAssets', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: DesignImage(NetworkAssets('https://example.com/image.png')),
        ),
      );

      expect(find.byType(ExtendedImage), findsOneWidget);
    });

    testWidgets('should show loading on NetworkAssets', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: DesignImage(
            NetworkAssets('https://example.com/image.png'),
            loadingWidget: Text("Loading"),
          ),
        ),
      );

      final extendedImage = tester.widget<ExtendedImage>(
        find.byType(ExtendedImage),
      );

      final builder = extendedImage.loadStateChanged?.call(
        _FakeExtendedImageState(LoadState.loading),
      );

      expect(builder, isNotNull);
      expect(builder, isA<Text>());
      expect((builder as Text).data, equals("Loading"));
    });

    testWidgets('should show failed widget on NetworkAssets failure', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: DesignImage(
            NetworkAssets('https://example.com/image.png'),
            failedWidget: Text("Failed"),
          ),
        ),
      );

      final extendedImage = tester.widget<ExtendedImage>(
        find.byType(ExtendedImage),
      );

      final builder = extendedImage.loadStateChanged?.call(
        _FakeExtendedImageState(LoadState.failed),
      );

      expect(builder, isNotNull);
      expect(builder, isA<Text>());
      expect((builder as Text).data, equals("Failed"));
    });
  });

  group("PngAssets", () {
    testWidgets('should renders ExtendedImage.asset for PngAssets', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: DesignImage(PngAssets('assets/images/sample.png')),
        ),
      );

      expect(find.byType(ExtendedImage), findsOneWidget);
    });

    testWidgets('should show loading on PngAssets', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: DesignImage(
            PngAssets('assets/images/sample.png'),
            loadingWidget: Text("Loading"),
          ),
        ),
      );

      final extendedImage = tester.widget<ExtendedImage>(
        find.byType(ExtendedImage),
      );

      final builder = extendedImage.loadStateChanged?.call(
        _FakeExtendedImageState(LoadState.loading),
      );

      expect(builder, isNotNull);
      expect(builder, isA<Text>());
      expect((builder as Text).data, equals("Loading"));
    });

    testWidgets('should show failed widget on PngAssets failure', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: DesignImage(
            PngAssets('assets/images/sample.png'),
            failedWidget: Text("Failed"),
          ),
        ),
      );

      final extendedImage = tester.widget<ExtendedImage>(
        find.byType(ExtendedImage),
      );

      final builder = extendedImage.loadStateChanged?.call(
        _FakeExtendedImageState(LoadState.failed),
      );

      expect(builder, isNotNull);
      expect(builder, isA<Text>());
      expect((builder as Text).data, equals("Failed"));
    });
  });

  group("SvgAssets", () {
    testWidgets('should renders SvgPicture for SvgAssets', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: DesignImage(SvgAssets('assets/icons/sample.svg')),
        ),
      );

      expect(find.byType(SvgPicture), findsOneWidget);
    });

    testWidgets('should show loading on SvgAssets', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: DesignImage(
            SvgAssets('assets/images/sample.png'),
            loadingWidget: Text("Loading"),
          ),
        ),
      );

      final svgPicture = tester.widget<SvgPicture>(
        find.byType(SvgPicture),
      );

      final placeholder = svgPicture.placeholderBuilder?.call(
        tester.element(find.byType(SvgPicture)),
      );

      expect(placeholder, isA<Text>());
      expect((placeholder as Text).data, equals("Loading"));
    });

    testWidgets('should show failed widget on SvgAssets failure', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: DesignImage(
            SvgAssets('assets/images/sample.png'),
            failedWidget: Text("Failed"),
          ),
        ),
      );

      final svgPicture = tester.widget<SvgPicture>(
        find.byType(SvgPicture),
      );

      final placeholder = svgPicture.errorBuilder?.call(
        tester.element(find.byType(SvgPicture)),
        Exception('fake error'),
        StackTrace.empty,
      );

      expect(placeholder, isA<Text>());
      expect((placeholder as Text).data, equals("Failed"));
    });
  });

  group("FileAssets", () {
    testWidgets('should renders ExtendedImage.file for FileAssets (non-web)', (
      WidgetTester tester,
    ) async {
      final file = File('test_resources/temp.png');
      await tester.pumpWidget(
        MaterialApp(
          home: DesignImage(FileAssets(file)),
        ),
      );

      expect(find.byType(ExtendedImage), findsOneWidget);
    });
  });

  testWidgets('should renders SizedBox for unknown asset type', (
    WidgetTester tester,
  ) async {
    // ignore: prefer_const_constructors
    final dummyAsset = _DummyAssets();

    await tester.pumpWidget(
      MaterialApp(
        home: DesignImage(dummyAsset),
      ),
    );

    expect(find.byType(SizedBox), findsOneWidget);
  });
}
