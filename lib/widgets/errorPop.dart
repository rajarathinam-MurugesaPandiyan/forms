import 'package:flutter/material.dart';

class ErrorPop extends StatelessWidget {

  final String errorTitle;
  final String errorContent;
  final String closeText;


  const ErrorPop({ required this.closeText , required this.errorContent , required this.errorTitle });

  @override
  Widget build(BuildContext context) {
     return AlertDialog(
       backgroundColor: Colors.teal,
       title:  Text( errorTitle ,
         style: const TextStyle(
             color: Colors.white
         ),),
       content: Column(
         mainAxisSize: MainAxisSize.min,
         crossAxisAlignment: CrossAxisAlignment.start,
         children:  <Widget>[
           Text(errorContent,
             style: const TextStyle(
                 color: Colors.white
             ),),
         ],
       ),
       actions: <Widget>[
         TextButton(
           onPressed: () {
             Navigator.of(context).pop();
           },
           child:  Text(
             closeText,
             style: TextStyle(
               color: Colors.white,
             ),
           ),
         ),
       ],
     );
  }

}