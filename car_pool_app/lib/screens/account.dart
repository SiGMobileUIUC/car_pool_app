import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:car_pool_app/screens/frontpage.dart';
import 'package:car_pool_app/screens/homepage.dart';
import 'package:car_pool_app/screens/ride.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});
  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  int currentIndex = 2; // Added currentIndex variable
  String? displayName = 'First Last';
  String? email = 'netid@illinois.edu';
  String? password = '********';
  String? bio = 'School, Major, Year in School';
  String? role = 'Driver, Rider, or Both';
  String? phoneNumber = '### ### ####';
  String? socialMedia = '@socialmedia';
  File? _image;

  void signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const FrontPage(),
      ),
    );
  }

  Future<void> _pickImageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  void editName() async {
    // Show dialog to edit name
    String? newName = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        TextEditingController nameController =
            TextEditingController(text: displayName);

        return AlertDialog(
          title: const Text('Edit Name'),
          content: TextField(
            controller: nameController,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('SAVE'),
              onPressed: () {
                Navigator.of(context).pop(nameController.text);
              },
            ),
          ],
        );
      },
    );

    // Update name if the user saved the changes
    if (newName != null) {
      setState(() {
        displayName = newName;
      });
    }
  }

  void editEmail() async {
    // Show dialog to edit email
    String? newEmail = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        TextEditingController emailController =
            TextEditingController(text: email);

        return AlertDialog(
          title: const Text('Edit Email'),
          content: TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('SAVE'),
              onPressed: () {
                Navigator.of(context).pop(emailController.text);
              },
            ),
          ],
        );
      },
    );

    // Update email if the user saved the changes
    if (newEmail != null) {
      setState(() {
        email = newEmail;
      });
    }
  }

  void editPassword() async {
    // Show dialog to edit password
    String? newPassword = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        TextEditingController passwordController = TextEditingController();

        return AlertDialog(
          title: const Text('Edit Password'),
          content: TextField(
            controller: passwordController,
            obscureText: true,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('SAVE'),
              onPressed: () {
                Navigator.of(context).pop(passwordController.text);
              },
            ),
          ],
        );
      },
    );

    // Update password if the user saved the changes
    if (newPassword != null) {
      setState(() {
        password = newPassword;
      });
    }
  }

  void editBio() async {
    // Show dialog to edit bio
    String? newBio = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        TextEditingController bioController = TextEditingController(text: bio);

        return AlertDialog(
          title: const Text('Edit Bio'),
          content: TextField(
            controller: bioController,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('SAVE'),
              onPressed: () {
                Navigator.of(context).pop(bioController.text);
              },
            ),
          ],
        );
      },
    );

    // Update bio if the user saved the changes
    if (newBio != null) {
      setState(() {
        bio = newBio;
      });
    }
  }

  void editRole() async {
    // Show dialog to select role
    String? newRole = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        String? selectedRole;

        return AlertDialog(
          title: const Text('Select Role'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Driver'),
                leading: Radio(
                  value: 'Driver',
                  groupValue: selectedRole,
                  onChanged: (value) {
                    selectedRole = value;
                  },
                ),
              ),
              ListTile(
                title: const Text('Rider'),
                leading: Radio(
                  value: 'Rider',
                  groupValue: selectedRole,
                  onChanged: (value) {
                    selectedRole = value;
                  },
                ),
              ),
              ListTile(
                title: const Text('Both'),
                leading: Radio(
                  value: 'Both',
                  groupValue: selectedRole,
                  onChanged: (value) {
                    selectedRole = value;
                  },
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('SAVE'),
              onPressed: () {
                Navigator.of(context).pop(selectedRole);
              },
            ),
          ],
        );
      },
    );

    // Update role if the user saved the changes
    if (newRole != null) {
      setState(() {
        role = newRole;
      });
    }
  }

  void editPhoneNumber() async {
    // Show dialog to edit phone number
    String? newPhoneNumber = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        TextEditingController phoneNumberController =
            TextEditingController(text: phoneNumber);

        return AlertDialog(
          title: const Text('Edit Phone Number'),
          content: TextField(
            keyboardType: TextInputType.number,
            controller: phoneNumberController,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('SAVE'),
              onPressed: () {
                Navigator.of(context).pop(phoneNumberController.text);
              },
            ),
          ],
        );
      },
    );

    // Update phone number if the user saved the changes
    if (newPhoneNumber != null) {
      setState(() {
        phoneNumber = newPhoneNumber;
      });
    }
  }

  void editSocialMedia() async {
    // Show dialog to edit social media
    String? newSocialMedia = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        TextEditingController socialMediaController =
            TextEditingController(text: socialMedia);

        return AlertDialog(
          title: const Text('Edit Social Media'),
          content: TextField(
            controller: socialMediaController,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('SAVE'),
              onPressed: () {
                Navigator.of(context).pop(socialMediaController.text);
              },
            ),
          ],
        );
      },
    );

    // Update social media if the user saved the changes
    if (newSocialMedia != null) {
      setState(() {
        socialMedia = newSocialMedia;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        automaticallyImplyLeading: false, // Disable back button on the top left
        elevation: 0,
        backgroundColor: Colors.grey[200],
        //title: Text('Account'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            color: Colors.black,
            onPressed: () =>
                signOut(context), // Use the signOut method from HomePage
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: _pickImageFromGallery,
                    child: CircleAvatar(
                      radius: 75,
                      backgroundImage:
                          _image != null ? FileImage(_image!) : null,
                      backgroundColor: Colors.grey[200],
                      child: _image == null
                          ? Icon(Icons.account_circle,
                              size: 125, color: Colors.black)
                          : null,
                    ),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: Text(
                      displayName ?? '',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Center(
                    child: Text(
                      email ?? '',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Name'),
              subtitle: Text(displayName ?? ''),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                editName();
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Bio'),
              subtitle: Text(bio ?? ''),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                editBio();
              },
            ),
            ListTile(
              leading: const Icon(Icons.drive_eta_rounded),
              title: const Text('Role'),
              subtitle: Text(role ?? ''),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                editRole();
              },
            ),
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text('Email'),
              subtitle: Text(email ?? ''),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                editEmail();
              },
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('Phone Number'),
              subtitle: Text(phoneNumber ?? ''),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                editPhoneNumber();
              },
            ),
            ListTile(
              leading: const Icon(Icons.group),
              title: const Text('Instagram'),
              subtitle: Text(socialMedia ?? ''),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                editSocialMedia();
              },
            ),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text('Password'),
              subtitle: const Text('********'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                editPassword();
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            if (currentIndex == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            } else if (currentIndex == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RidePage()),
              );
            }
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.drive_eta),
            label: 'Rides',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        selectedItemColor: Colors.black,
      ),
    );
  }
}