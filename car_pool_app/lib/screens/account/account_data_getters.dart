import 'package:flutter/material.dart';
import 'package:car_pool_app/screens/account/account_class.dart';

final List<List<String>> textList = [
  ['Name', 'First Last'],
  ['Bio', 'School, Major, Year in School'],
  ['Role', 'Driver, Rider, or Both'],
  ['Email', 'netid@illinois.edu'],
  ['Phone Number', '### ### ####'],
  ['Instagram', '@socialmedia'],
  ['Password', '*******'],
];
final List<IconData> iconList = [
  Icons.person,
  Icons.info,
  Icons.drive_eta_rounded,
  Icons.email,
  Icons.phone,
  Icons.group,
  Icons.lock,
];
String getUserInfo(UserAccount user, int idx) {
  switch (idx) {
    case 0:
      return user.getName() ?? '';
    case 1:
      return user.getBio() ?? '';
    case 2:
      return user.getRole() ?? '';
    case 3:
      return user.getEmail() ?? '';
    case 4:
      return user.getPhoneNumber() ?? '';
    case 5:
      return user.getSocialMedia() ?? '';
    case 6:
      return user.getPassword() ?? '';
    default:
      return '';
  }
}

void setUserInfo(UserAccount user, int idx, String? newElement) {
  switch (idx) {
    case 0:
      user.setName(newElement ?? '');
      break;
    case 1:
      user.setBio(newElement ?? '');
      break;
    case 2:
      user.setRole(newElement ?? '');
      break;
    case 3:
      user.setEmail(newElement ?? '');
      break;
    case 4:
      user.setPhoneNumber(newElement ?? '');
      break;
    case 5:
      user.setSocialMedia(newElement ?? '');
      break;
    case 6:
      user.setPassword(newElement ?? '');
      break;
  }
}


