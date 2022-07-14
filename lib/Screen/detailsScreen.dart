import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms/Constants/Constants.dart';
import 'package:forms/bloc/home_bloc.dart';
import '../Model/homeModel.dart';


class detailScreen extends StatelessWidget{
  const detailScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            Constants.detailsTitle
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10),
        alignment: Alignment.center,
        child: BlocConsumer<HomeBloc , Home>(
          listener:(context, state){},
          builder: (context , Home){
            print("print${Home.phoneNumber}");
            return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: ConstrainedBox(
                    constraints: BoxConstraints(
                     minWidth: MediaQuery.of(context).size.width,
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                    child: IntrinsicHeight(
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(20),
                            width: MediaQuery.of(context).size.width/1.1,
                            height: MediaQuery.of(context).size.height/11 ,
                            decoration: BoxDecoration(
                                borderRadius:BorderRadius.circular(5) ,
                                color: Colors.teal
                            ),
                            child: Text("Name : ${Home.firstName} ${Home.lastName}"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child:   Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(20),
                              width: MediaQuery.of(context).size.width/1.1,
                              height: MediaQuery.of(context).size.height/11,
                              decoration: BoxDecoration(
                                  borderRadius:BorderRadius.circular(5) ,
                                  color: Colors.teal
                              ),
                              child: Text("Phone number : ${Home.phoneNumber}"),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child:   Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(20),
                              width: MediaQuery.of(context).size.width/1.1,
                              height: MediaQuery.of(context).size.height/11,
                              decoration: BoxDecoration(
                                  borderRadius:BorderRadius.circular(5) ,
                                  color: Colors.teal
                              ),
                              child: Text("mail : ${Home.email}"),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child:   Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(20),
                              width: MediaQuery.of(context).size.width/1.1,
                              height: MediaQuery.of(context).size.height/11,
                              decoration: BoxDecoration(
                                  borderRadius:BorderRadius.circular(5) ,
                                  color: Colors.teal
                              ),
                              child: Text("Role: ${Home.role}"),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child:   Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(20),
                              width: MediaQuery.of(context).size.width/1.1,
                              height: MediaQuery.of(context).size.height/11,
                              decoration: BoxDecoration(
                                  borderRadius:BorderRadius.circular(5) ,
                                  color: Colors.teal
                              ),
                              child: Text("Experience : ${Home.experience}"),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child:   Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(20),
                              width: MediaQuery.of(context).size.width/1.1,
                              height: MediaQuery.of(context).size.height/11,
                              decoration: BoxDecoration(
                                  borderRadius:BorderRadius.circular(5) ,
                                  color: Colors.teal
                              ),
                              child: Text("Age : ${Home.age}"),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child:   Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(20),
                              width: MediaQuery.of(context).size.width/1.1,
                              height: MediaQuery.of(context).size.height/11,
                              decoration: BoxDecoration(
                                  borderRadius:BorderRadius.circular(5) ,
                                  color: Colors.teal
                              ),
                              child: Text("Address : ${Home.city} , ${Home.state} , ${Home.country}"),
                            ),
                          ),
                        ],
                      ),
                    )
             )
            );
          },
        ),
      ),
    );
  }

}