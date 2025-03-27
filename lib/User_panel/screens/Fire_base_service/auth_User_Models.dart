class Models {
  final String uid;
  final String username;
  final String email;
  final String phone;
  final String userimage;
  final String userdivicetoken;
  final String country;
  final String useraddress;
  final String city;
  final String street;
  final bool isaddmin;
  final bool isactive;
  final dynamic createdon;

  Models({
    required this.uid,
    required this.city,
    required this.username,
    required this.email,
    required this.phone,
    required this.userimage,
    required this.userdivicetoken,
    required this.country,
    required this.useraddress,
    required this.street,
    required this.isaddmin,
    required this.isactive,
    required this.createdon,
  });

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "username": username,
      "email": email,
      "phone": phone,
      "userimage": userimage,
      "userdivicetoken": userdivicetoken,
      "country": country,
      "useraddress": useraddress,
      "street": street,
      "isaddmin": isaddmin,
      "isactive": isactive,
      "createdon": createdon,
      "city": city,
    };
  }
}
