import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vtschool/Config/theme/app_theme.dart';
import 'package:vtschool/Provider/theme_dark_or_light.dart';
import 'package:get/get.dart';
import 'package:vtschool/Screens/auth/Start_loading_screen.dart';
import 'package:vtschool/Screens/auth/Starting_page.dart';
import 'package:vtschool/Screens/auth/login_screen.dart';
import 'package:vtschool/Screens/auth/register_screen.dart';
import 'package:vtschool/Screens/inicio/home_screen.dart';
import 'package:vtschool/Screens/profile/myprofile_screen.dart';
import 'package:vtschool/Screens/profile/update_profile_screen.dart';
import 'package:vtschool/Screens/wompi/card_credit.dart';
import 'package:vtschool/Screens/wompi/wompi_servise.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkmode = ref.watch(isDarkmodeProvider);

    return GetMaterialApp(
      theme: AppTheme(selectedColor: 3, isDarkMode: isDarkmode).getTheme(),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/loading', page: () => const LoadingScreen()),
        GetPage(name: '/starting', page: () => const StartingScreen()),
        GetPage(name: '/login', page: () => const LoginScreen()),
        GetPage(name: '/register', page: () => const RegisterScreen()),
        GetPage(name: '/home', page: () => const HomeScreen()),
        GetPage(name: '/profile_view', page: () => const MyProfileScreen()),
        GetPage(name: '/update_profile', page: () => const UpdateProfileScreen()),
        GetPage(name: '/banner', page: () =>  const PagosPage()),
        GetPage(name: '/creditCart', page: () =>  const MySample()),

      ],
      initialRoute: '/loading',
    );
  }
}