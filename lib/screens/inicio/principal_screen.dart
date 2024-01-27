// ignore_for_file: file_names
import 'package:flutter/material.dart';

import 'package:vtschool/config/fonts_styles.dart';
import 'package:vtschool/controllers/perfil_controller.dart';
import 'package:vtschool/models/student.dart';
import 'package:vtschool/models/user_new_data.dart';
import 'package:vtschool/models/user_profile_model.dart';
import 'package:vtschool/screens/inicio/card_screen.dart';
import 'package:vtschool/screens/notas/Student_notas.dart';
import 'package:vtschool/screens/notas/Task.dart';
import 'package:vtschool/screens/profile/prueba.dart';

class PrincipalScreen extends StatefulWidget {
  const PrincipalScreen({super.key});

  @override
  State<PrincipalScreen> createState() => _PrincipalScreenState();
}

class _PrincipalScreenState extends State<PrincipalScreen> with SingleTickerProviderStateMixin {
  UserData? userProfile;
  bool isLoading = true;
  final ProfileController _profileController = ProfileController();
  late TabController _tabController;
      Student student = Student('Juan', [
      Grade('Matemáticas', 90.0),
      Grade('Historia', 85.0),
      Grade('Ciencias', 95.0),
    ]);

      List<Task> tasks = [
      Task('Estudiar para el examen', 'Revisar apuntes de matemáticas'),
      Task('Estudiar para el examen', 'Revisar apuntes de matemáticas'),
      Task('Estudiar para el examen', 'Revisar apuntes de matemáticas'),
    ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    
    Future.delayed(
      const Duration(seconds: 2),
      () {
        _profileController.fetchAndSetProfileData(getProfileData);
      },
    );
  }

  void getProfileData(UserData? profile, bool loading) {
    setState(() {
      userProfile = profile;
      isLoading = loading;
    });
  }
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            '${userProfile?.userData.persona.nombre1} ${userProfile?.userData.persona.apellido1}',
                            style: kTitleStylew,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              image: const DecorationImage(
                                  image: AssetImage('assets/images/avatar.png'),
                                  fit: BoxFit.cover,
                                  repeat: ImageRepeat.repeat),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  TabBar(
                    controller: _tabController,
                    tabs: [
                      Tab(text: 'Mi agenda'),
                      Tab(text: 'Mis notas'),
                      Tab(text: 'Mis tareas'),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        const SizedBox(height: 20),
                        const SizedBox(height: 20),
                        CardContainer(),
                      ],
                    ),
                  ),
                  // Second Tab - User Data Widget
                   GradeSimulationScreen(student),
                    TaskScreen(tasks) // You need to create UserDataWidget and pass userProfile
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}