import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/app_cubit.dart';
import 'package:flutter_cubit/cubit/app_state.dart';
import 'package:flutter_cubit/pages/detail_page.dart';
import 'package:flutter_cubit/pages/navpages/main_page.dart';
import 'package:flutter_cubit/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AppCubit>(
        create: (context) => AppCubit(),
        child: BlocBuilder<AppCubit, AppState>(
          bloc: AppCubit(),
          builder: (context, state){
            if (state is WelcomeState){
              return const WelcomePage();
            }
            else {
              return const DetailPage();
            }
          },
        ),
      )
    );
  }
}
