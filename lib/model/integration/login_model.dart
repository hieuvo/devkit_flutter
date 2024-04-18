class LoginModel {
  late String email;
  late String fullName;
  late String phoneNumber;
  late String sessionId;

  LoginModel({required this.email, required this.fullName, required this.phoneNumber, required this.sessionId});

  LoginModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    fullName = json['fullName'];
    phoneNumber = json['phoneNumber'];
    sessionId = json['sessionId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['fullName'] = fullName;
    data['phoneNumber'] = phoneNumber;
    data['sessionId'] = sessionId;
    return data;
  }
}