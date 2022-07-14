import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms/Model/homeModel.dart';
import 'home_event.dart';

class PincodeBloc extends Bloc<MasterEvent, Pincode> {
  PincodeBloc(initialState):super( Pincode() ){
    on<MasterEvent>((event, emit) {
       if(event is GetExactPin){
          Pincode newState = Pincode(
            exactPin: event.pincode,
          );
          emit(newState);
       }
    });
  }

}