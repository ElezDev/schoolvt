// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../config/fonts_styles.dart';

class StartingScreen extends StatefulWidget {
  const StartingScreen({super.key});

  @override
  _StartingScreenState createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      _initializeScreen();
    });
  }

  void _initializeScreen() async {
    // ignore: use_build_context_synchronously
     Get.toNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipPath(
            clipper: OvalClipper(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/conlogo3.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 55.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: '¡Bienvenido ',
                        style: kTitleStylew,
                      ),
                      TextSpan(
                        text:
                            'A Teletaxi Tu Mejor \n   Alternativa En Transportes ',
                        style: kTitleStylewAmber,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15), // Espaciador
                const Text(
                  'Descubre una nueva forma de moverte',
                  style: kTlightpromin,
                ),
                const SizedBox(height: 90),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/login');
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    backgroundColor: Colors.amber,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 120.0),
                  ),
                  child: const Text('Let\'s go'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


}

class OvalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height * 0.9, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
