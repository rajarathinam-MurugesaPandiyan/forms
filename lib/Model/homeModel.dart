class Home {
   final String? firstName;
   final String?  lastName;
   final String? phoneNumber;
   final String? email;
   final String? role;
   final String? experience;
   final String? age;
   final String? city;
   final String? state;
   final String? country;
   final bool? validPhone;
   final bool? validMail;


   Home({
      this.firstName : "" ,
      this.lastName : "",
      this.phoneNumber = "",
      this.email = "",
      this.role = "",
      this.experience = "",
      this.age = "",
      this.city = "",
      this.state = "",
      this.country ="",
      this.validPhone,
      this.validMail,

   });


}


class StateManagement {
   final String? state;
   final String? link;
   final List<int>? pincodeData;

   StateManagement({
      this.state = "TamilNadu",
      this.link,
      this.pincodeData,
    });
}

class Pincode {
   final String? exactPin;

   Pincode({
      this.exactPin,
   });
}