class StudentModel {
  late int studentId;
  late String studentName;
  late String studentPhoneNumber;
  late String studentGender;
  late String studentAddress;

  StudentModel({required this.studentId, required this.studentName, required this.studentPhoneNumber, required this.studentGender, required this.studentAddress});

  StudentModel.fromJson(Map<String, dynamic> json) {
    studentId = json['studentId'];
    studentName = json['studentName'];
    studentPhoneNumber = json['studentPhoneNumber'];
    studentGender = json['studentGender'];
    studentAddress = json['studentAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['studentId'] = studentId;
    data['studentName'] = studentName;
    data['studentPhoneNumber'] = studentPhoneNumber;
    data['studentGender'] = studentGender;
    data['studentAddress'] = studentAddress;
    return data;
  }
}