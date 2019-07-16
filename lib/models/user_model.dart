class UserModel {
  // Field
  String id, Name, User, Password;

  // Constructor
  UserModel(this.id, this.Name, this.User, this.Password);

  UserModel.parseJSON(Map<String, dynamic> parseJSON) {
    id = parseJSON['id'];
    Name = parseJSON['Name'];
    User = parseJSON['User'];
    Password = parseJSON['Password'];
  }
}
