import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vapt_agendamento/core/theme_provider.dart';
import 'package:vapt_agendamento/core/app_theme.dart';
import 'package:vapt_agendamento/modules/home/home_page.dart';
import 'package:vapt_agendamento/modules/settings/settings_page.dart';
import 'package:vapt_agendamento/modules/background/background_page.dart';
import 'package:vapt_agendamento/modules/translation/translation_page.dart';
import 'package:vapt_agendamento/modules/notification/notification_sound_page.dart';


void main() {
  runApp(
    // O ChangeNotifierProvider cria a única instância do ThemeProvider
    // que será compartilhada por todo o aplicativo.
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Vapt App',
          debugShowCheckedModeBanner: false,
          
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: AppColors.getColorScheme(false, themeProvider.currentColor),

            appBarTheme: AppBarTheme(
              backgroundColor: themeProvider.currentColor,
              foregroundColor: Colors.white,
            ),
          ),
          
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: AppColors.getColorScheme(true, themeProvider.currentColor),
          ),
          
          themeMode: themeProvider.themeMode, 
          
          initialRoute: '/',
          routes: {
            '/': (context) => const HomePage(),
            '/settings': (context) => const SettingsPage(),
            '/background': (context) => const BackgroundPage(),
            '/translation': (context) => const TranslationPage(),   
            '/notifications': (context) => const NotificationSoundPage(),
            
          },
        );
      },
    );
  }
}