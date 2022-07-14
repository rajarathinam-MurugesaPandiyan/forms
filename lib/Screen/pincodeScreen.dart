

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms/bloc/home_event.dart';
import 'package:forms/bloc/pincode_bloc.dart';
import 'package:forms/bloc/state_bloc.dart';

import '../Model/homeModel.dart';

class PincodeScreen extends StatefulWidget{
  final String? state;
  const PincodeScreen({Key? key , this.state }) : super(key: key);



  @override
  State<PincodeScreen> createState() => _pincodeScreen();



}

class _pincodeScreen extends State<PincodeScreen>{


  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         centerTitle: true,
         title:  Text(widget.state!),
       ),
       body: BlocConsumer<StateBloc , StateManagement>(
          listener: (context ,state){
            print(state);
          },
          builder:(context , state){
            return Container(
              child:  GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 7/3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 10,
                ),
                itemCount: state.pincodeData?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                        BlocProvider.of<PincodeBloc>(context).add(GetExactPin(pincode: state.pincodeData![index].toString()));
                        print(state.pincodeData![index].toString());
                      },
                      child :Container(
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(5)
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          state.pincodeData![index].toString(),
                          style: const TextStyle(
                              color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
       )

     );
  }
}
