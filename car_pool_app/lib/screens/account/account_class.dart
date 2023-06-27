
class UserAccount {
  String? _displayName = 'First Last';
  String? _email = 'netid@illinois.edu';
  String? _password = '********';
  String? _bio = 'School, Major, Year in School';
  String? _role = 'Driver, Rider, or Both';
  String? _phoneNumber = '### ### ####';
  String? _socialMedia = '@socialmedia';
  void setName(String? name) => _displayName = name;
  void setEmail(String? email) => _email = email;
  void setPassword(String? password) => _password = password;
  void setBio(String? bio) => _bio = bio;
  void setRole(String? role) => _role = role;
  void setPhoneNumber(String? phoneNumber) => _phoneNumber = phoneNumber;
  void setSocialMedia(String? socialMedia) => _socialMedia = socialMedia;
  String? getName() => _displayName;
  String? getEmail() => _email;
  String? getPassword() => _password;
  String? getBio() => _bio;
  String? getRole() => _role;
  String? getPhoneNumber() => _phoneNumber;
  String? getSocialMedia() => _socialMedia;
}