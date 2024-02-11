// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';

// class Calendar extends StatefulWidget {
//   const Calendar({Key? key}) : super(key: key);

//   @override
//   _CalendarState createState() => _CalendarState();
// }

// class _CalendarState extends State<Calendar> {
//   List<Map<String, dynamic>> _hourlyEvents = [
//     {
//       "id": 1,
//       "horaInicial": "08:00:00",
//       "horaFinal": "10:00:00",
//       "estado": "SIN ASIGNAR",
//     },
//     {
//       "id": 2,
//       "horaInicial": "08:00:00",
//       "horaFinal": "10:00:00",
//       "estado": "ORO",
//     }
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SfCalendar(
//         view: CalendarView.day,
//         dataSource: _getDataSource(),
//         appointmentBuilder: appointmentBuilder,
//       ),
//     );
//   }

//   CalendarDataSource<Object?> _getDataSource() {
//     List<Appointment> appointments = [];

//     for (var event in _hourlyEvents) {
//       DateTime startTime = DateTime.parse('2024-02-10 ${event["horaInicial"]}');
//       DateTime endTime = DateTime.parse('2024-02-10 ${event["horaFinal"]}');

//       appointments.add(Appointment(
//         startTime: startTime,
//         endTime: endTime,
//         subject: 'Calculo ${event["id"]}',
//         color: _getEventColor(event["estado"]),
//       ));
//     }

//     return _DataSource(appointments);
//   }

//   Color _getEventColor(String estado) {
//     switch (estado) {
//       case "SIN ASIGNAR":
//         return Colors.yellow;
//       // Puedes agregar más casos según tus estados y colores deseados
//       default:
//         return Colors.blue;
//     }
//   }

//   Widget appointmentBuilder(
//       BuildContext context, CalendarAppointmentDetails details) {
//     final Appointment appointment = details.appointments!.first;
//     return Container(
//       decoration: BoxDecoration(
//         color: appointment.color,
//         borderRadius: BorderRadius.circular(5),
//       ),
//       child: Center(
//         child: Text(
//           appointment.subject,
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//     );
//   }
// }

// class _DataSource extends CalendarDataSource<Object?> {
//   _DataSource(List<Appointment> appointments) {
//     this.appointments = appointments;
//   }
// }


// void getData() async {
//   const url = 'http://192.168.101.9:8000/api/materias/horario_materia';
//     String token = await getToken();
//   try {
//     final response = await http.get(
//       Uri.parse(url),
//       headers: {'Authorization': 'Bearer $token'},
//     );
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       print('Respuesta del servidor: $data');
//     } else {
//       print('Error en la solicitud. Código de respuesta: ${response.statusCode}');
//     }
//   } catch (e) {
//     print('Error: $e');
//   }
// }

