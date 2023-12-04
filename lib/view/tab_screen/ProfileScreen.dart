import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pos/view/login/inception.dart';
import 'package:pos/view/tab_screen/view-model/backend/provider/login_provider.dart';
import 'package:pos/view/tab_screen/view-model/constants/constants.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileScreen extends StatefulWidget {
  final String phoneNumber;

  const UserProfileScreen({super.key, required this.phoneNumber});
  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Map<String, dynamic> userData = {};

  @override
  bool isLoading = false;
  void initState() {
    super.initState();

    fetchUserData();
  }

  Future<void> fetchUserData() async {
    final phoneNo = widget.phoneNumber;
    setState(() {
      isLoading = true; // Set isLoading to true before fetching data.
    });
    try {
      final DocumentSnapshot doc =
          await firestore.collection('AllCustomer').doc(phoneNo).get();
      print('Fetched Data: ${doc.data()}');
      print('Phone Number: $phoneNo');
      if (doc.exists) {
        setState(() {
          userData = doc.data() as Map<String, dynamic>;
        });
      } else {
        print('Vendor document not found');
      }
    } catch (e) {
      print('Error fetching vendor data: $e');
    } finally {
      setState(() {
        isLoading = false; // Set isLoading to false after fetching data.
      });
    }
  }

  Widget build(BuildContext context) {
    final lp = Provider.of<LoginProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          'Your profile',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              letterSpacing: 1),
        ),
      ),
      body: Center(
          child: isLoading
              ? const CircularProgressIndicator(
                  color: primaryColor,
                  backgroundColor: Colors.white,
                )
              : Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('$imagesPath/user.gif'),
                      Text(
                        'Name : ${userData['name']}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * .02,
                      ),

                      // Text(ap.userModel.dob),
                      Text(
                        'Phone : ${userData['phone']}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .02,
                      ),

                      Text(
                        'Email : ${userData['email']}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .02,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                backgroundColor: primaryColor),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Log Out',
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.white),
                                ),
                                Icon(
                                  MdiIcons.logout,
                                  color: Colors.white,
                                )
                              ],
                            ),
                            onPressed: () async {
                              showDialog(
                                context: context,
                                builder: (BuildContext) {
                                  return Dialog(
                                      // backgroundColor: Colors.amber.shade100,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              50.0)), //this right here
                                      child: SizedBox(
                                        height: 200,
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              const Text(
                                                "Are you sure ?",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            backgroundColor:
                                                                primaryColor),
                                                    child: const Text("Cancel",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white)),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                  ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            backgroundColor:
                                                                Colors.red),
                                                    child: const Text(
                                                      "Logout",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    onPressed: () async {
                                                      SharedPreferences prefs =
                                                          await SharedPreferences
                                                              .getInstance();
                                                      await prefs.setBool(
                                                          'isLogged', false);
                                                      FirebaseAuth.instance
                                                          .signOut();
                                                      Navigator.pushReplacement(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                const Inception(),
                                                          ));
                                                    },
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ));
                                },
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                )),
    );
  }
}
