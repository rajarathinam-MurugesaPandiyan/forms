import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms/Constants/Constants.dart';
import '../Model/homeModel.dart';
import 'home_event.dart';

class StateBloc extends Bloc<MasterEvent, StateManagement> {
  StateBloc(initialState):super( StateManagement() ){
    on<MasterEvent>((event, emit) {

      if(event is StateEvent) {
         if(event.state == "Kerala"){
           StateManagement newState = StateManagement(
             link: "Pin Code for Kerala",
           );
           emit(newState);
           print(newState.link.toString());
         }
         if(event.state == "Karnataka"){
           StateManagement newState = StateManagement(
               link: "Pin Code for Karnataka"
           );
           emit(newState);
           print(newState.link.toString());
         }
         if(event.state == "Andhra Pradesh"){
           StateManagement newState = StateManagement(
               link: "Pin Code for Andhra Pradesh"
           );
           emit(newState);
         }
         if(event.state == "TamilNadu"){
           StateManagement newState = StateManagement(
               link: "Pin Code for TamilNadu"
           );
           print("this is triggered ${event.state.toString()}");
           emit(newState);
         }
      }

      if(event is pincodeEvent){
        if(event.statePincode == "Pin Code for Kerala"){
          StateManagement newState = StateManagement(
              pincodeData: Constants.kerData,
          );
          emit(newState);
        }
        if(event.statePincode == "Pin Code for Andhra Pradesh"){
          StateManagement newState = StateManagement(
            pincodeData: Constants.andData,
          );
          emit(newState);
        }
        if(event.statePincode == "Pin Code for Karnataka"){
          StateManagement newState = StateManagement(
            pincodeData: Constants.karData,
          );
          emit(newState);
        }
        if(event.statePincode == "Pin Code for TamilNadu"){
          StateManagement newState = StateManagement(
            pincodeData: Constants.tnData,
          );
          emit(newState);
        }
      }
    }
    );
  }
}