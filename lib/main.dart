import 'package:base_project/core/l10n/cubit/language_cubit.dart';
import 'package:base_project/core/l10n/generated/app_localizations.dart';
import 'package:base_project/core/route/app_route.dart';
import 'package:base_project/core/theme/app_color.dart';
import 'package:base_project/core/theme/app_theme.dart';
import 'package:base_project/core/theme/cubit/theme_cubit.dart';
import 'package:base_project/core/utils/app_utils.dart';
import 'package:base_project/main_module.dart';
import 'package:base_project/core/utils/url_strategy/setup_url_strategy.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:skeletonizer/skeletonizer.dart';

void main() async {
  setupUrlStrategy();
  if (kIsWeb) {
    WidgetsFlutterBinding.ensureInitialized();
  } else {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  }

  await MainModule.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SkeletonizerConfig(
      data: SkeletonizerConfigData(
        effect: ShimmerEffect(
          baseColor: AppColor.neutral[700]!,
          highlightColor: AppColor.white,
          duration: const Duration(milliseconds: 1500),
        ),
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => LanguageCubit(GetIt.I.get())..init()),
          BlocProvider(create: (_) => ThemeCubit(GetIt.I.get())..init()),
        ],
        child: Builder(
          builder: (context) {
            return MaterialApp.router(
              locale: context.watch<LanguageCubit>().state.current,
              debugShowCheckedModeBanner: false,
              routerConfig: AppRoute.router,
              title: AppUtils.appName,
              theme: AppTheme.light,
              darkTheme: AppTheme.dark,
              themeMode: context.watch<ThemeCubit>().state.current,
              builder: (context, child) {
                final MediaQueryData data = MediaQuery.of(context);
                return MediaQuery(
                  // making sure the text scale not affected by system font size
                  data: data.copyWith(textScaler: const TextScaler.linear(1.0)),
                  child: child ?? const SizedBox(),
                );
              },
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
            );
          },
        ),
      ),
    );
  }
}
