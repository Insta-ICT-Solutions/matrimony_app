class ClientRegistrationModel {
  String? id;
  String? userName;
  String? birthDate;
  String? education;
  String? job;
  String? cast;
  String? subCast;
  String? devak;
  String? ras;
  String? gan;
  String? address;
  String? phoneNumber;
  String? bloodGroup;
  String? demands;
  String? email;
  String? gender;
  String? marragestatus;
  String? profilePictureUrl;

  ClientRegistrationModel(
      {this.id,
        this.userName,
        this.birthDate,
        this.education,
        this.job,
        this.cast,
        this.subCast,
        this.devak,
        this.ras,
        this.gan,
        this.address,
        this.phoneNumber,
        this.bloodGroup,
        this.demands,
        this.email,
        this.gender,
        this.marragestatus,
        this.profilePictureUrl});

  ClientRegistrationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    birthDate = json['birthDate'];
    education = json['education'];
    job = json['job'];
    cast = json['cast'];
    subCast = json['subCast'];
    devak = json['devak'];
    ras = json['ras'];
    gan = json['gan'];
    address = json['address'];
    phoneNumber = json['phoneNumber'];
    bloodGroup = json['bloodGroup'];
    demands = json['demands'];
    email = json['email'];
    gender = json['gender'];
    marragestatus = json['marragestatus'];
    profilePictureUrl = json['profilePictureUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['birthDate'] = this.birthDate;
    data['education'] = this.education;
    data['job'] = this.job;
    data['cast'] = this.cast;
    data['subCast'] = this.subCast;
    data['devak'] = this.devak;
    data['ras'] = this.ras;
    data['gan'] = this.gan;
    data['address'] = this.address;
    data['phoneNumber'] = this.phoneNumber;
    data['bloodGroup'] = this.bloodGroup;
    data['demands'] = this.demands;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['marragestatus'] = this.marragestatus;
    data['profilePictureUrl'] = this.profilePictureUrl;
    return data;
  }
}

