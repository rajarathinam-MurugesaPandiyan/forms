import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms/Screen/homeScreen.dart';
import 'package:forms/bloc/home_bloc.dart';
import 'package:forms/bloc/pincode_bloc.dart';
import 'package:forms/bloc/state_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
    MultiBlocProvider(
        providers: [
           BlocProvider<HomeBloc>(create: (context) => HomeBloc("")),
           BlocProvider<StateBloc>(create: (context)=> StateBloc("")),
           BlocProvider<PincodeBloc>(create: (context)=> PincodeBloc("")),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.teal,
          ),
          home: const HomeScreen(),
        ),
    );

  }
}

