class UserModel{
  final String? id;
  String firstName;
  String lastName;
  final String userName;
  final String email;
  final String phoneNumber;
  String? profilePicture;

  UserModel({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    this.profilePicture
  });

  String get fullName => '$firstName $lastName';
  String get formattedPhoneNumber => '$phoneNumber';

  static String generateUserName(fullName){
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : " ";
    String camelCaseUserName = '$firstName$lastName';
    String userNameWithPrefix  = 'cwt_$camelCaseUserName';
    return userNameWithPrefix;
  }

  static UserModel empty() => UserModel(id: '', firstName: '', lastName: '', userName: '', email: '', phoneNumber: '', profilePicture: '',);

  Map<String, dynamic> toJson(){
    return {
      'FirstName' : firstName,
      'LastName' : lastName,
      'UserName' : userName,
      'Email' : email,
      'PhoneNumber' : phoneNumber,
      'ProfilePicture' : profilePicture
    };
  }

  // factory UserModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document){
  //   if(document.data() != null){
  //     final data = document.data();
  //     return UserModel(
  //         id: document.id,
  //         firstName: data['FirstName'] ?? '',
  //         lastName: data['LastName'] ?? '',
  //         userName: data['UserName'] ?? '',
  //         email: data['Email'] ?? '',
  //         phoneNumber: data['PhoneNumber'] ?? '',
  //         profilePicture: data['ProfilePicture'] ?? ''
  //     );
  //   }
  // }
}