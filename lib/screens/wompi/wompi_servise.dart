  import 'package:flutter/material.dart';
  import 'package:go_router/go_router.dart';

  class TuVista extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return BannerInfo();
          },
        );
      });

      return Scaffold(
      appBar: AppBar(
        title: Text('Pagos'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                padding: EdgeInsets.all(16),
                width: 350,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                    ),
                    SizedBox(height: 10),

                    Text(
                      'Edwin Ledezma',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Número de Estudiante: 12345',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Carrera: Ingeniería Informática',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            // Agrega cualquier otro contenido adicional aquí
          ],
        ),
      ),
    );
  }
}


  class BannerInfo extends StatelessWidget {
    const BannerInfo({Key? key});

    @override
    Widget build(BuildContext context) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Tienes pagos pendientes',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20), // Espacio entre el texto y el botón
              ElevatedButton(
                onPressed: () {
                  // Agrega la lógica para navegar a la pantalla de pago
                  // Puedes utilizar GoRouter o Navigator, dependiendo de tu implementación
                  // Ejemplo con GoRouter:
                  GoRouter.of(context).go('/pago');
                  // Ejemplo con Navigator:
                  // Navigator.pushNamed(context, '/pago');
                },
                child: Text('Ir a Pagar'),
              ),
            ],
          ),
        ),
      );
    }
  }
