import 'package:flutter/material.dart';
import 'package:forms/Model/homeModel.dart';
import 'package:forms/Screen/detailsScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms/Screen/pincodeScreen.dart';
import 'package:forms/bloc/home_bloc.dart';
import 'package:forms/bloc/home_event.dart';
import 'package:forms/bloc/pincode_bloc.dart';
import 'package:forms/bloc/state_bloc.dart';
import 'package:forms/widgets/inputWidget.dart' ;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _homeScreen();
}

class _homeScreen extends State<HomeScreen> {

  final _firstnameController = TextEditingController();
  final _secondnameController = TextEditingController();
  final _phonenumberController = TextEditingController();
  final _mailController = TextEditingController();
  final _roleController = TextEditingController();
  final _experienceController = TextEditingController();
  final _ageController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _countryController = TextEditingController();
  final _pincodeController = TextEditingController();
  String dropdownValue = 'TamilNadu';

  @override
  void initState() {
    super.initState();
    BlocProvider.of<StateBloc>(context).add(StateEvent(state: dropdownValue));
  }

  @override
  void dispose() {
    super.dispose();

  }

  bool _validatePhoneNumber(String value ){
    String phonePattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(phonePattern);
    bool answer;

    if(!regExp.hasMatch(value)){
            answer = false;
            BlocProvider.of<HomeBloc>(context).add(HomeEvents(validphone: true));
           }else{
             answer =true;
           }
         return answer ;
  }

  bool _validateMail(String value ){
    String phonePattern =r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

    RegExp regExp = RegExp(phonePattern);
    bool answer;

    if(!regExp.hasMatch(value)){
      answer = false;
      BlocProvider.of<HomeBloc>(context).add(HomeEvents(validMail: true));
    }else{
      answer =true;
    }
    print("working $answer");
    return answer ;
  }

  _validateDetails(){
  if( _phonenumberController.text != "" && _firstnameController.text != ""
      && _mailController.text != "" && _cityController.text != ""
      && dropdownValue != ""){

    if(_validatePhoneNumber(_phonenumberController.text) && _validateMail(_mailController.text)){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> detailScreen()));
      BlocProvider.of<HomeBloc>(context).add(HomeEvents(
          firstName: _firstnameController.text,
          lastName: _secondnameController.text,
          phoneNumber: _phonenumberController.text,
          email: _mailController.text,
          role: _roleController.text,
          experience: _experienceController.text,
          age: _experienceController.text,
          city: _cityController.text,
          state: dropdownValue,
          country: _countryController.text,
      ));
      _clearTheDetails();
    }
  }
  }

  _clearTheDetails() {
    _firstnameController.clear();
    _secondnameController.clear();
    _mailController.clear();
    _roleController.clear();
    _experienceController.clear();
    _ageController.clear();
    _cityController.clear();
    _stateController.clear();
    _countryController.clear();
    _phonenumberController.clear();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Demo Form"),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child:
          IntrinsicHeight(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                // This is For FirstName
                Padding(
                  padding:
                      const EdgeInsets.only(top: 30, bottom: 6, left: 7, right: 1),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      InputfeildMaker(
                              controller: _firstnameController ,
                              placeHolder: "FirstName*",
                              icon: Icon(Icons.person),
                              width: 2.45,
                              borderColor:  Colors.teal,
                            ),

                      // This is for secondName
                      InputfeildMaker(
                        controller: _secondnameController ,
                        placeHolder: "LastName",
                        icon: const Icon(Icons.person),
                        width: 2.5,
                        borderColor: Colors.teal,
                      ),
                    ],
                  ),
                ),

                // This is For PhoneNumber
                Container(
                  child: BlocConsumer<HomeBloc , Home>(
                    listener: (context , state){},
                    builder: (context ,state){
                      return
                        InputfeildMaker(
                          controller: _phonenumberController ,
                          placeHolder: "Phone Number*",
                          type: 1,
                          icon: Icon(Icons.phone),
                          width: 1.12,
                          borderColor: state.validPhone ?? false ? Colors.red : Colors.teal,
                          size: 10,
                        );
                    },
                  ),
                ),


                // This is For Email
                Container(
                  child: BlocConsumer<HomeBloc , Home>(
                    listener: (context , state){

                    },
                    builder: (context , state){
                      return InputfeildMaker(
                        controller: _mailController ,
                        placeHolder: "E-mail*",
                        type: 2,
                        icon: const Icon(Icons.mail),
                        width: 1.12,
                        borderColor: state.validMail ?? false ? Colors.red : Colors.teal,
                      );
                    },
                  )
                ),

                // This is For Role
                InputfeildMaker(
                    controller: _roleController ,
                    placeHolder: "Role",
                    icon: Icon(Icons.work),
                    width: 1.12,
                    borderColor: Colors.teal,
                ),

                //This is For Experience
                Padding(
                  padding:
                      const EdgeInsets.only(top: 0, bottom: 0, left: 3, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      InputfeildMaker(
                        controller: _experienceController ,
                        placeHolder: "Experience",
                        icon: Icon(Icons.timer),
                        size: 2,
                        width: 2.19,
                        borderColor: Colors.teal,
                      ),

                      //This is for age
                      InputfeildMaker(
                        controller: _ageController ,
                        placeHolder: "age",
                        icon: Icon(Icons.perm_contact_cal_rounded),
                        width: 3,
                        size: 3,
                        borderColor: Colors.teal,
                      ),
                    ],
                  ),
                ),

                //This is for city
                InputfeildMaker(
                    controller: _cityController ,
                    placeHolder: "City*",
                    icon: Icon(Icons.location_city_sharp),
                    width: 1.12,
                    borderColor: Colors.teal,
                ),

             Padding(
                padding: const EdgeInsets.only( top: 10, left: 15, right: 15, bottom: 15),
                child:Container(
                  width: MediaQuery.of(context).size.width/1.12,
                  height: 60,
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                   decoration:  BoxDecoration(
                     borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.teal),
                   ),
                  child:DropdownButton<String>(
                   value: dropdownValue,
                   isExpanded: true,
                   underline: Container(
                     height: 2,
                     color: Colors.transparent,
                    ),
                   items: <String>['TamilNadu', 'Kerala', 'Karnataka', 'Andhra Pradesh']
                       .map<DropdownMenuItem<String>>((String value) {
                     return DropdownMenuItem<String>(
                       value: value,
                       child: Text(value),
                     );
                   }).toList(),
                   onChanged: (String? newValue) {
                     setState(() {
                       dropdownValue = newValue!;
                       BlocProvider.of<StateBloc>(context).add(StateEvent(state: newValue));
                     });
                   },
                 ),
               ),
             ),
            //this is for State
              Container(
                  child: BlocConsumer<StateBloc , StateManagement>(
                    listener: (context , state){
                      print("This is from home ${state.link.toString()}");
                    },
                    builder:(context,state){
                      return
                      InkWell(
                        onTap: (){
                          BlocProvider.of<StateBloc>(context).add(pincodeEvent(statePincode: state.link));
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>
                              PincodeScreen(
                                state: state.link ?? "Pin Code for $dropdownValue" )
                            )
                          );
                        },
                        child :Container(
                          child: Text(
                          state.link ?? "Pin Code for $dropdownValue" ,
                          style: const TextStyle(
                            color: Colors.teal
                          ),
                        ),
                       )
                      );
                    },
                  ),
                ),

               //This is For pincode
               Container(
                 child: BlocConsumer<PincodeBloc , Pincode>(
                    listener: (context , state){
                      print(state);
                    },
                     builder: (context , state){
                      print("result ${state.exactPin}");
                      _pincodeController.text = state.exactPin ?? "";
                       return InputfeildMaker(
                         controller: _pincodeController,
                         width: 1.12,
                         borderColor: Colors.teal,
                       );
                     }
                 ),
               ),

                //This is for Country
                InputfeildMaker(
                    controller: _countryController ,
                    placeHolder: "Country",
                    icon: const Icon(Icons.airplanemode_on_rounded),
                    width: 1.12,
                  borderColor: Colors.teal,
                ),
                //This is for button
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.11,
                    child: ElevatedButton(
                      child: const Text("Submit"),
                      onPressed: () {
                        _validateDetails();
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
      ),
    );
  }
}
