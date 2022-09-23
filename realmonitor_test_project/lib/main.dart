import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realmonitor_test_project/realestates/api/services.dart';
import 'package:realmonitor_test_project/realestates/bloc/bloc.dart';
import 'package:realmonitor_test_project/realestates/views/realestatelistpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Define the default brightness and colors.
        primarySwatch: Colors.blue,
      ),

      home: Scaffold(
        appBar: AppBar(
          title: const Text('Realmonitor test project'),
        ),
        body: BlocProvider(
          create: (context) => RealEstatesBloc(RealEstateServices()),
          child: const RealEstateListPage(),
        ),
      ),

      // home:BlocProvider(
      //   create: (context) => RealEstatesBloc(RealEstateServices()),
      //   child: RealEstateListPage(),
      // ),
    );
  }
}
