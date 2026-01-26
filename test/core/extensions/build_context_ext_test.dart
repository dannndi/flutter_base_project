import 'package:base_project/core/extensions/build_context_ext.dart';
import 'package:base_project/core/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget buildTestableWidget({
    required Size size,
    required Widget child,
  }) {
    return MediaQuery(
      data: MediaQueryData(size: size),
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeData.from(
          colorScheme: ColorScheme.light(),
        ),
        home: Builder(
          builder: (context) => child,
        ),
      ),
    );
  }

  group("ScreenSize test", () {
    testWidgets('width and height work correctly', (tester) async {
      late BuildContext ctx;

      await tester.pumpWidget(
        buildTestableWidget(
          size: const Size(375, 812),
          child: Builder(
            builder: (context) {
              ctx = context;
              return const SizedBox();
            },
          ),
        ),
      );

      expect(ctx.screenSize, const Size(375, 812));
      expect(ctx.screenWidth, 375);
      expect(ctx.screenHeight, 812);
    });
  });

  group("Responsive utils", () {
    testWidgets('detects mobile size correctly', (tester) async {
      late BuildContext ctx;

      await tester.pumpWidget(
        buildTestableWidget(
          size: const Size(390, 844), // iPhone size
          child: Builder(
            builder: (context) {
              ctx = context;
              return const SizedBox();
            },
          ),
        ),
      );

      expect(ctx.isMobileSize, true);
      expect(ctx.isTabletSize, false);
      expect(ctx.isDesktopSize, false);
    });

    testWidgets('detects tablet size correctly', (tester) async {
      late BuildContext ctx;

      await tester.pumpWidget(
        buildTestableWidget(
          size: const Size(800, 1280),
          child: Builder(
            builder: (context) {
              ctx = context;
              return const SizedBox();
            },
          ),
        ),
      );

      expect(ctx.isMobileSize, false);
      expect(ctx.isTabletSize, true);
      expect(ctx.isDesktopSize, false);
      expect(ctx.isWideSize, true);
    });

    testWidgets('detects desktop size correctly', (tester) async {
      late BuildContext ctx;

      await tester.pumpWidget(
        buildTestableWidget(
          size: const Size(1440, 900),
          child: Builder(
            builder: (context) {
              ctx = context;
              return const SizedBox();
            },
          ),
        ),
      );

      expect(ctx.isMobileSize, false);
      expect(ctx.isTabletSize, false);
      expect(ctx.isDesktopSize, true);
      expect(ctx.isWideSize, true);
    });

    testWidgets('responsiveValue returns correct value per size', (
      tester,
    ) async {
      late BuildContext ctx;

      await tester.pumpWidget(
        buildTestableWidget(
          size: const Size(375, 812), // mobile
          child: Builder(
            builder: (context) {
              ctx = context;
              return const SizedBox();
            },
          ),
        ),
      );

      final value = ctx.responsiveValue(
        mobile: 'mobile',
        tablet: 'tablet',
        desktop: 'desktop',
      );

      expect(value, 'mobile');
    });
  });

  group("AppLocalization test", () {
    testWidgets('should return AppLocalization with en / english language', (
      tester,
    ) async {
      AppLocalizations? localizations;
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale("en"),
          home: Builder(
            builder: (context) {
              localizations = context.intl;

              return SizedBox();
            },
          ),
        ),
      );

      expect(localizations, isNotNull);
    });

    testWidgets(
      'should return AppLocalization with id / indonesian language',
      (tester) async {
        AppLocalizations? localizations;
        await tester.pumpWidget(
          MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale("id"),
            home: Builder(
              builder: (context) {
                localizations = context.intl;

                return SizedBox();
              },
            ),
          ),
        );

        expect(localizations, isNotNull);
      },
    );
  });
}
