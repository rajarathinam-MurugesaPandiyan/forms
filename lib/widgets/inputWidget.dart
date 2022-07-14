import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';

 class InputfeildMaker extends StatelessWidget{

    final TextEditingController? controller;
    final String? placeHolder;
    final Icon? icon;
    final double? width;
    final Color? borderColor;
    final int? size;
    final String? Init;
    final int? type;



   const InputfeildMaker({

      this.controller,
      this.placeHolder,
      this.icon,
      this.width,
      this.borderColor,
      this.size,
      this.Init,
     this.type,

   }) ;




  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 15),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / width!,
        child: TextFormField(
          onChanged: (value){
            if(type == 1){
              String phonePattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
              RegExp regExp = RegExp(phonePattern);
              if(!regExp.hasMatch(value)){
                BlocProvider.of<HomeBloc>(context).add(HomeEvents(validphone: true));
              }else{
                BlocProvider.of<HomeBloc>(context).add(HomeEvents(validphone: false));
              }
            }

            if(type == 2){
              String phonePattern =r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
              RegExp regExp = RegExp(phonePattern);
              if(!regExp.hasMatch(value)){
                BlocProvider.of<HomeBloc>(context).add(HomeEvents(validMail: true));
              }else{
                BlocProvider.of<HomeBloc>(context).add(HomeEvents(validMail: false));
              }
            }
          },
          initialValue: Init,
          controller: controller,
          inputFormatters: [
            LengthLimitingTextInputFormatter(size),
          ],
          decoration:  InputDecoration(
            prefixIcon: icon,
            label: Text(placeHolder ?? ""),
            focusedBorder: OutlineInputBorder(
                borderSide:
                BorderSide(width: 2, color: borderColor!)),
            enabledBorder: OutlineInputBorder(
                borderSide:
                BorderSide(width: 1, color: borderColor!)),
          ),
        ),
      ),
    );
  }
 }


