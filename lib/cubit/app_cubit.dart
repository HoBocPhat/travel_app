
import 'package:bloc/bloc.dart';
import 'package:flutter_cubit/cubit/app_state.dart';

class AppCubit extends Cubit<AppState>{
  AppCubit() : super(InitialState()){
   emit(WelcomeState());
  }

}