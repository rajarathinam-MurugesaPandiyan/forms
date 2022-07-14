
import 'package:bloc/bloc.dart';
import 'package:forms/Model/homeModel.dart';
import 'package:forms/bloc/home_event.dart';



class HomeBloc extends Bloc<MasterEvent, Home> {
  HomeBloc(initialState):super( Home() ){
    on<MasterEvent>((event, emit) {
    if(event is HomeEvents){
      Home newState = Home(
        firstName: "Hello ,${event.firstName}",
        lastName: event.lastName,
        phoneNumber: event.phoneNumber,
        email: event.email,
        role: event.role,
        experience: event.experience,
        age: event.age,
        city: event.city,
        state: event.state,
        country: event.country,
        validPhone: event.validphone,
        validMail: event.validMail,
      );
      emit(newState);

    }

    });

  }

}