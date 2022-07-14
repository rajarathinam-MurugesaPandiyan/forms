abstract class MasterEvent{ }

class HomeEvents extends MasterEvent{
    final String? firstName;
    final String? lastName;
    final String? phoneNumber;
    final String? email;
    final String? role;
    final String? experience;
    final String? age;
    final String? city;
    final  String? state;
    final String? country;
    final bool? validphone;
    final bool? validMail;


    HomeEvents({
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.email,
      this.role,
      this.experience,
      this.age,
      this.city,
      this.state,
      this.country,
      this.validphone,
      this.validMail,
    });

}

class StateEvent extends MasterEvent{
  final String? state;
  late final String? link;


  StateEvent({
    this.state,
    this.link,

  });
}

class pincodeEvent extends MasterEvent{
    final String? statePincode;
    final List<int>? pincodeData;


    pincodeEvent({
      this.statePincode,
      this.pincodeData,

  });
}

class GetExactPin extends MasterEvent{
    final String? pincode;

    GetExactPin({
      this.pincode,
   });
}




