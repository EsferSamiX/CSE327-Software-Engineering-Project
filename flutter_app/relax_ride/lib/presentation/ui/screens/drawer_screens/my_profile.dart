import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relax_ride/getx_controller/main_controller.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  MainController mainController = Get.find();

  @override
  Widget build(BuildContext context) {
    mainController.fnameController.text =
        mainController.userData.data!.fname.toString();
    mainController.lnameController.text =
        mainController.userData.data!.lname.toString();
    mainController.phoneController.text =
        mainController.userData.data!.phone.toString();
    mainController.cityController.text =
        mainController.userData.data!.city.toString();
    mainController.emailController.text =
        mainController.userData.data!.email.toString();
    String username = mainController.userData.data!.fname.toString() +
        mainController.userData.data!.lname.toString();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Colors.teal.shade600,
        foregroundColor: Colors.white,
        title: const Text(
          'My Profile',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  color: Colors.teal.shade600,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(height: 20),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            const CircleAvatar(
                              radius: 60,
                              backgroundImage:
                              AssetImage('assets/images/user.png'),
                              backgroundColor: Colors.white,
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: GestureDetector(
                                onTap: () {
                                  _showProfileOptionsDialog(context);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    color: Colors.teal.shade600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          username,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          mainController.userData.data!.phone.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3 - 20,
            left: 0,
            right: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(26),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(26),
                    topRight: Radius.circular(26),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            'First Name',
                            style: TextStyle(
                              color: Colors.teal.shade800,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: TextFormField(
                            controller: mainController.fnameController,
                            decoration: InputDecoration(
                              hintText: 'Enter your first name',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Colors.teal.shade600,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Colors.teal.shade600,
                                  width: 2,
                                ),
                              ),
                            ),
                            onChanged: (value) {},
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Last Name',
                            style: TextStyle(
                              color: Colors.teal.shade800,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: TextFormField(
                            controller: mainController.lnameController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Colors.teal.shade600,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Colors.teal.shade600,
                                  width: 2,
                                ),
                              ),
                            ),
                            onChanged: (value) {},
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'City',
                            style: TextStyle(
                              color: Colors.teal.shade800,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: TextFormField(
                            controller: mainController.cityController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Colors.teal.shade600,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Colors.teal.shade600,
                                  width: 2,
                                ),
                              ),
                            ),
                            onChanged: (value) {},
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Phone',
                            style: TextStyle(
                              color: Colors.teal.shade800,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: TextFormField(
                            controller: mainController.phoneController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Colors.teal.shade600,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Colors.teal.shade600,
                                  width: 2,
                                ),
                              ),
                            ),
                            onChanged: (value) {},
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Email',
                            style: TextStyle(
                              color: Colors.teal.shade800,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextFormField(
                                controller: mainController.emailController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Colors.teal.shade600,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Colors.teal.shade600,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                onChanged: (value) {},
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Data updated!'),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.teal.shade600,
                                  foregroundColor: Colors.white,
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  elevation: 3,
                                ),
                                child: const Text(
                                  'Save',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _showProfileOptionsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Theme(
        data: Theme.of(context).copyWith(
          dialogBackgroundColor: Colors.white,
        ),
        child: AlertDialog(
          title: Text(
            "Profile Picture",
            style: TextStyle(
              color: Colors.teal.shade800,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text(
                    "Change Profile Picture",
                    style: TextStyle(
                      color: Colors.teal.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                  child: Text(
                    "Remove Profile Picture",
                    style: TextStyle(
                      color: Colors.teal.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}