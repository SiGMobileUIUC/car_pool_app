import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:car_pool_app/screens/frontpage.dart';
import 'package:car_pool_app/screens/homepage.dart';
import 'package:car_pool_app/screens/ride.dart';
import 'package:car_pool_app/screens/account/account_class.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});
  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  int currentIndex = 2;
  // Added currentIndex variable
  UserAccount user = UserAccount();
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

  //List<String?> _roles = ['Driver', 'Rider', 'Both'];

  // List of list of strings to hold hint text and title names
  List<List<String>> textList = [
    ['Name', 'Name'],
    ['Bio', 'Bio'],
    ['Role', 'Role'],
    ['Email', 'Email'],
    ['Phone Number', 'Phone Number'],
    ['Instagram', 'Instagram'],
    ['Password', 'Password'],
  ];
  
  void createEditButton(String? hintText, int idx, String? curText) async {
    // Show dialog to edit passed in type
    String? newElement;
    String? previousElement = curText; // Store the previous name

    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        TextEditingController elementController = TextEditingController(
          text: previousElement == hintText ? "" : previousElement,
        );

        return AlertDialog(
          title: const Text('Name'),
          content: TextField(
            //Changing the keyboard type based on which field is being edited
            keyboardType: idx == 4
                ? TextInputType.number
                : idx == 3
                    ? TextInputType.emailAddress
                    : idx == 6
                        ? TextInputType.visiblePassword=
                        : TextInputType.text,
            controller: elementController,
            decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: IconButton(
                onPressed: elementController.clear,
                icon: const Icon(Icons.clear),
              ),
            ),
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
                // newName = nameController.text.isNotEmpty
                //     ? nameController.text
                //     : previousName!; // Use previousName if text is empty and perform null check
                newElement = elementController.text.isNotEmpty
                    ? elementController.text
                    : hintText;
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

    // Update name for each specific property of the user if the user saved the changes
    if (newElement != null) {
      setState(() {
        switch (idx) {
          case 0:
            user.setName(newElement);
            break;
          case 1:
            user.setBio(newElement);
            break;
          case 2:
            user.setRole(newElement);
            break;
          case 3:
            user.setEmail(newElement);
            break;
          case 4:
            user.setPhoneNumber(newElement);
            break;
          case 5:
            user.setSocialMedia(newElement);
            break;
          case 6:
            user.setPassword(newElement);
            break;
        }
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
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
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
                          ? const Icon(Icons.account_circle,
                              size: 125, color: Colors.black)
                          : null,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: Text(
                      user.getName() ?? '',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: Text(
                      user.getEmail() ?? '',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 7,
              (BuildContext context, int index) {
                switch (index) {
                  case 0:
                    return ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text('Name'),
                      subtitle: Text(user.getName() ?? ''),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        createEditButton("First Last", 0, user.getName());
                      },
                    );
                  case 1:
                    return ListTile(
                      leading: const Icon(Icons.info),
                      title: const Text('Bio'),
                      subtitle: Text(user.getBio() ?? ''),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        createEditButton(
                            "School, Major, Year in School", 1, user.getBio());
                      },
                    );
                  case 2:
                    return ListTile(
                      leading: const Icon(Icons.drive_eta_rounded),
                      title: const Text('Role'),
                      subtitle: Text(user.getRole() ?? ''),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        createEditButton(
                            "Driver, Rider, or Both", 2, user.getRole());
                      },
                    );
                  case 3:
                    return ListTile(
                      leading: const Icon(Icons.email),
                      title: const Text('Email'),
                      subtitle: Text(user.getEmail() ?? ''),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        createEditButton(
                            "netid@illinois.edu", 3, user.getEmail());
                      },
                    );
                  case 4:
                    return ListTile(
                      leading: const Icon(Icons.phone),
                      title: const Text('Phone Number'),
                      subtitle: Text(user.getPhoneNumber() ?? ''),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        createEditButton(
                            "### ### ####", 4, user.getPhoneNumber());
                      },
                    );
                  case 5:
                    return ListTile(
                      leading: const Icon(Icons.group),
                      title: const Text('Instagram'),
                      subtitle: Text(user.getSocialMedia() ?? ''),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        createEditButton(
                            "@socialmedia", 5, user.getSocialMedia());
                      },
                    );
                  case 6:
                    return ListTile(
                      leading: const Icon(Icons.lock),
                      title: const Text('Password'),
                      subtitle: const Text('********'),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                      ),
                      onTap: () {
                        createEditButton("*******", 6, user.getPassword());
                      },
                    );
                  default:
                    return const SizedBox.shrink();
                }
              },
            ),
          ),
        ],
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


/////////////////////////////////////////////////////////

  // void editRole() async {
  //   // Show dialog to select role
  //   int index = 0;
  //   String? newRole = await showDialog<String>(
  //     context: context,
  //     builder: (BuildContext context) {
  //       String? selectedRole;
  //       String? _travel;

  //       return AlertDialog(
  //         title: const Text('Select Role'),
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             ListTile(
  //               title: const Text('Driver'),
  //               leading: Radio(
  //                 toggleable: true,
  //                 fillColor: MaterialStateProperty.all(Colors.amber),
  //                 value: 'Driver',
  //                 groupValue: selectedRole,
  //                 onChanged: (value) {
  //                   selectedRole = value.toString();
  //                 },
  //               ),
  //             ),
  //             ListTile(
  //               title: const Text('Rider'),
  //               leading: Radio(
  //                 fillColor: MaterialStateProperty.all(Colors.amber),
  //                 toggleable: true,
  //                 value: 'Rider',
  //                 groupValue: selectedRole,
  //                 onChanged: (value) {
  //                   selectedRole = value.toString();
  //                 },
  //               ),
  //             ),
  //             ListTile(
  //               title: const Text('Both'),
  //               leading: Radio(
  //                 toggleable: true,
  //                 fillColor: MaterialStateProperty.all(Colors.amber),
  //                 value: 'Both',
  //                 groupValue: selectedRole,
  //                 onChanged: (value) {
  //                   selectedRole = value.toString();
  //                 },
  //               ),
  //             ),
  //           ],
  //         ),
  //         actions: <Widget>[
  //           TextButton(
  //             child: const Text('CANCEL'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //           TextButton(
  //             child: const Text('SAVE'),
  //             onPressed: () {
  //               Navigator.of(context).pop(selectedRole);
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );

  //   // Update role if the user saved the changes
  //   if (newRole != null) {
  //     setState(() {
  //       role = newRole;
  //     });
  //   }
  // }