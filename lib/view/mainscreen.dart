// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import '../helpers/notification_helper.dart';

// int horas = 1;

// class MainScreen extends StatefulWidget {
//   const MainScreen({Key? key}) : super(key: key);

//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   @override
//   void initState() {
//     super.initState();

//     NotificationHelper.init();
//     tz.initializeTimeZones();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF2c0824),
//       body: Center(
//         child: Container(
//           width: double.infinity,
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage("images/bg.jpg"),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(
//                 height: 320,
//               ),
//               SizedBox(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     NotificationHelper.showScheduledNotification(
//                       title: 'Miku diz:',
//                       body: 'Hora de tomar água',
//                       payload: 'Lembrete',
//                       repeatInterval: RepeatInterval.hourly,
//                     );

//                     final snackBar = SnackBar(
//                       content: Text(
//                         'Agendado para $horas Hora(s)!',
//                         style: const TextStyle(fontSize: 24),
//                       ),
//                       backgroundColor: const Color(0xff38ffe2),
//                     );
//                     ScaffoldMessenger.of(context)
//                       ..removeCurrentSnackBar()
//                       ..showSnackBar(snackBar);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.transparent,
//                     elevation: 0,
//                     shape: const CircleBorder(),
//                   ),
//                   child: Ink(
//                     decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.cyanAccent.withOpacity(0.3),
//                           spreadRadius: 12,
//                           blurRadius: 12,
//                           offset: const Offset(0, 0),
//                         ),
//                       ],
//                       gradient: const LinearGradient(
//                         colors: [
//                           Color(0xff38ffe2),
//                           Color(0xff52c7ad),
//                         ],
//                         begin: Alignment.bottomLeft,
//                         end: Alignment.topRight,
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     width: 250,
//                     height: 45,
//                     child: const Center(
//                       child: Text(
//                         "Lembre-me de tomar água",
//                         style: TextStyle(fontSize: 18),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               SizedBox(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     NotificationHelper().cancelAllNotifications();

//                     const snackBar = SnackBar(
//                       content: Text(
//                         'Lembretes limpos!',
//                         style: TextStyle(fontSize: 24),
//                       ),
//                       backgroundColor: Color(0xff25c0a1),
//                     );
//                     ScaffoldMessenger.of(context)
//                       ..removeCurrentSnackBar()
//                       ..showSnackBar(snackBar);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.transparent,
//                     elevation: 0,
//                     shape: const CircleBorder(),
//                   ),
//                   child: Ink(
//                     decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.cyanAccent.withOpacity(0.3),
//                           spreadRadius: 12,
//                           blurRadius: 12,
//                           offset: const Offset(0, 0),
//                         ),
//                       ],
//                       gradient: const LinearGradient(
//                         colors: [
//                           Color(0xff38ffe2),
//                           Color(0xff52c7ad),
//                         ],
//                         begin: Alignment.bottomLeft,
//                         end: Alignment.topRight,
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     width: 250,
//                     height: 45,
//                     child: const Center(
//                       child: Text(
//                         "Limpar Lembretes",
//                         style: TextStyle(fontSize: 18),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 245,
//               ),
//               SizedBox(
//                 height: 100,
//                 child: Center(
//                   child: Container(
//                     decoration: const BoxDecoration(
//                       image: DecorationImage(
//                         image: AssetImage("images/tx.png"),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
