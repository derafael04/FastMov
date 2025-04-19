import 'package:fastmov/screen/home/screen_home.dart';
import 'package:fastmov/screen/home/screen_introduction.dart';
import 'package:fastmov/screen/login/tela_esqueceu_senha.dart';
import 'package:fastmov/screen/login/tela_login_inicial.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('pt_BR', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FastMov',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffF1F1F1),
        cardColor: Colors.white,
        canvasColor: const Color(0xffF3F3F4),
        bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
        shadowColor: const Color(0xff90949A),
        dialogTheme: DialogTheme(
            shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        )),
        dividerColor: const Color(0xffCFCFCF),
        dividerTheme: const DividerThemeData(color: Color(0xffDCDDDF), thickness: 1),
        //dialogBackgroundColor: Colors.grey[200],
        splashColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Color(0xff51555A),
        ),
        useMaterial3: true,
        primaryColor: const Color(0xff161934),
      ),
      initialRoute: '/screenIntroduction',
      routes: {
        //'/splash': (context) => const SplashScreen(),
        '/home': (context) => const Home(),
        '/screenIntroduction': (context) => const ScreenIntroduction(),
        '/telaLoginInicial': (context) => const TelaLoginInicial(),
        '/telaEsqueceuSenha': (context) => const TelaEsqueceuSenha()
      },
    );
  }
}