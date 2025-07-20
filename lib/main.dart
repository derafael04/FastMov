import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'core/di/injection_container.dart' as di;
import 'core/routes/app_routes.dart';
import 'core/routes/route_generator.dart';
import 'presentation/stores/theme/theme_store.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('pt_BR', null);
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeStore = di.sl<ThemeStore>();
    return Observer(
      builder: (_) => MaterialApp(
        title: 'FastMov',
        debugShowCheckedModeBanner: false,
        theme: _buildLightTheme(),
        darkTheme: _buildDarkTheme(),
        themeMode: themeStore.themeMode,
        navigatorKey: navigatorKey,
        initialRoute: AppRoutes.login,
        onGenerateRoute: RouteGenerator.generateRoute,
        onUnknownRoute: (settings) => RouteGenerator.generateRoute(
          RouteSettings(name: '/error', arguments: settings.arguments),
        ),
      ),
    );
  }

  ThemeData _buildLightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xffF1F1F1),
      cardColor: Colors.white,
      canvasColor: const Color(0xffF3F3F4),
      bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
      bottomAppBarTheme: const BottomAppBarTheme(color: Colors.transparent),
      shadowColor: const Color(0xff90949A),
      dialogTheme: DialogThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      dividerColor: const Color(0xffCFCFCF),
      dividerTheme: const DividerThemeData(color: Color(0xffDCDDDF), thickness: 1),
      splashColor: Colors.white,
      iconTheme: const IconThemeData(
        color: Color(0xff51555A),
      ),
      useMaterial3: true,
      primaryColor: const Color(0xff161934),
      // Cores de texto para tema claro
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Color(0xff2f2f2f)),
        bodyMedium: TextStyle(color: Color(0xff555555)),
        titleLarge: TextStyle(color: Color(0xff2f2f2f)),
        titleMedium: TextStyle(color: Color(0xff2f2f2f)),
        headlineMedium: TextStyle(color: Color(0xff2f2f2f)),
      ),
    );
  }

  ThemeData _buildDarkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xff121212),
      cardColor: const Color(0xff1E1E1E),
      canvasColor: const Color(0xff2C2C2C),
      bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
      bottomAppBarTheme: const BottomAppBarTheme(color: Colors.transparent),
      shadowColor: const Color(0xff000000),
      dialogTheme: DialogThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: const Color(0xff2C2C2C),
      ),
      dividerColor: const Color(0xff404040),
      dividerTheme: const DividerThemeData(color: Color(0xff404040), thickness: 1),
      splashColor: const Color(0xff2C2C2C),
      iconTheme: const IconThemeData(
        color: Color(0xffB3B3B3),
      ),
      useMaterial3: true,
      primaryColor: const Color(0xff4A90E2),
      // Cores de texto para tema escuro
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Color(0xffF5F5F5)),
        bodyMedium: TextStyle(color: Color(0xffB3B3B3)),
        titleLarge: TextStyle(color: Color(0xffF5F5F5)),
        titleMedium: TextStyle(color: Color(0xffF5F5F5)),
        headlineMedium: TextStyle(color: Color(0xffF5F5F5)),
      ),
    );
  }
}