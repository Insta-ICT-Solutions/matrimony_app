class EmployeeRegistration {
  String? employeeName;
  String? phoneNumber;
  String? branch;
  String? email;
  String? password;
  String? confirmPassword;

  EmployeeRegistration(
      {this.employeeName,
        this.phoneNumber,
        this.branch,
        this.email,
        this.password,
        this.confirmPassword});

  EmployeeRegistration.fromJson(Map<String, dynamic> json) {
    employeeName = json['employeeName'];
    phoneNumber = json['phoneNumber'];
    branch = json['branch'];
    email = json['email'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employeeName'] = this.employeeName;
    data['phoneNumber'] = this.phoneNumber;
    data['branch'] = this.branch;
    data['email'] = this.email;
    data['password'] = this.password;
    data['confirmPassword'] = this.confirmPassword;
    return data;
  }
}
