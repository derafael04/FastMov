import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'core/di/injection_container.dart' as di;
import 'presentation/stores/theme/theme_store.dart';
import 'screen/login/tela_login_inicial.dart';
import 'screen/home/screen_home.dart';


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
        darkTheme: ThemeData.dark(),
        themeMode: themeStore.themeMode,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xffF1F1F1),
          cardColor: Colors.white,
          canvasColor: const Color(0xffF3F3F4),
          bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
          bottomAppBarTheme: const BottomAppBarTheme(color: Colors.transparent),
          shadowColor: const Color(0xff90949A),
          dialogTheme: DialogThemeData(
              shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )),
          dividerColor: const Color(0xffCFCFCF),
          dividerTheme: const DividerThemeData(color: Color(0xffDCDDDF), thickness: 1),
          splashColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Color(0xff51555A),
          ),
          useMaterial3: true,
          primaryColor: const Color(0xff161934),
        ),
        initialRoute: '/login',
        routes: {
          '/login': (context) => const TelaLoginInicial(),
          '/home': (context) => const Home(),
        },
      ),
    );
  }
}