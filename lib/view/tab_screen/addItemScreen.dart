import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pos/view/tab_screen/foodDetailsScreen.dart';
import 'package:pos/view/tab_screen/utils.dart';
import 'package:pos/view/tab_screen/view-model/constants/constants.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class AddItemScreen extends StatefulWidget {
  final String uid;
  AddItemScreen({required this.uid, super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

final TextEditingController foodNameController = TextEditingController();
final TextEditingController foodPriceController = TextEditingController();
final TextEditingController foodCodeController = TextEditingController();

class _AddItemScreenState extends State<AddItemScreen> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  File? selectedIamge;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Clear the text fields when back button is pressed
        foodNameController.clear();
        foodCodeController.clear();
        foodPriceController.clear();
        return true; // Allow the screen to be popped
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'Add Food Items',
            style: TextStyle(
              fontFamily: "tabfont",
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 4, right: 4),
            child: Container(
              color: Colors.white,
              child: Column(children: [
                Center(
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * .25,
                        width: MediaQuery.of(context).size.width * .6,
                        child: selectedIamge != null
                            ? Image.file(selectedIamge!)
                            : Image.asset('$imagesPath/cup.gif'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Select a Food Image',
                          style: TextStyle(
                              color: black,
                              fontFamily: "tabfont",
                              fontSize: 17),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              pickImageFromGallery();
                            },
                            child: Text(
                              'Gallery',
                              style: TextStyle(
                                color: primaryColor,
                                fontFamily: "tabfont",
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              pickImageFromCamera();
                            },
                            child: Text(
                              'Camera',
                              style: TextStyle(
                                color: primaryColor,
                                fontFamily: "tabfont",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    style: TextStyle(
                        fontSize: 17,
                        color: primaryColor,
                        fontWeight: FontWeight.bold),
                    controller: foodNameController,
                    cursorColor: primaryColor,
                    decoration: InputDecoration(
                      hintText: 'Enter Food Name',
                      hintStyle: TextStyle(fontWeight: FontWeight.w400),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(color: Colors.black38),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(color: primaryColor),
                      ),
                      focusColor: primaryColor,
                      hoverColor: primaryColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    style: TextStyle(
                        fontSize: 17,
                        color: primaryColor,
                        fontWeight: FontWeight.bold),
                    controller: foodCodeController,
                    cursorColor: primaryColor,
                    decoration: InputDecoration(
                      hintText: 'Enter Food Code',
                      hintStyle: TextStyle(fontWeight: FontWeight.w400),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(color: Colors.black38),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(color: primaryColor),
                      ),
                      focusColor: primaryColor,
                      hoverColor: primaryColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    style: TextStyle(
                        fontSize: 17,
                        color: primaryColor,
                        fontWeight: FontWeight.bold),
                    controller: foodPriceController,
                    cursorColor: primaryColor,
                    decoration: InputDecoration(
                      hintText: 'Enter Food Price',
                      hintStyle: TextStyle(fontWeight: FontWeight.w400),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(color: Colors.black38),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(color: primaryColor),
                      ),
                      focusColor: primaryColor,
                      hoverColor: primaryColor,
                    ),
                  ),
                ),
                Center(
                  child: TextButton(
                      onPressed: () {
                        final String FoodName = foodNameController.text;
                        final String FoodCode = foodCodeController.text;
                        final String FoodPrice = foodPriceController.text;

                        createSubcollection(
                            context, FoodName, FoodCode, FoodPrice, widget.uid);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            // border: Border.all(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(30),
                            color: primaryColor),
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: ListTile(
                          leading: Icon(
                            MdiIcons.check,
                            color: Colors.white,
                          ),
                          title: Center(
                            child: const Text(
                              'Continue',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "tabfont",
                              ),
                            ),
                          ),
                        ),
                      )),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  Future pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedIamge = File(returnImage!.path);
    });
  }

  Future pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedIamge = File(returnImage!.path);
    });
  }

  //Uploading Food data on firebase
  Future<void> createSubcollection(
    BuildContext context,
    String FoodName,
    String FoodCode,
    String FoodPrice,
    String phoneNo,
  ) async {
    if (FoodName.isEmpty || FoodCode.isEmpty || FoodPrice.isEmpty) {
      showSnackBar(context, "Please provide all details");
      return;
    }

    try {
      User? user = _auth.currentUser;

      if (user != null) {
        final String uid = user.uid;
        String imagePath = await uploadImageToStorage(selectedIamge);
        // Create a subcollection named "vehicles" inside the user's document
        CollectionReference vehiclesCollection = _firestore
            .collection('AllUsers')
            .doc(widget.uid)
            .collection('foodItems');

        // Add a new document to the "vehicles" subcollection
        await vehiclesCollection.add({
          'name': FoodName,
          'foodCode': FoodCode,
          'price': FoodPrice,
          'uid': phoneNo,
          'imagePath': imagePath,
        });

        print('Subcollection document created successfully.');
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AllFoodsScreen(
                      documentId: widget.uid,
                    )));
      } else {
        print('User is not logged in.');
      }
    } catch (e) {
      print('Error creating subcollection document: $e');
    }
  }

  Future<String> uploadImageToStorage(File? image) async {
    try {
      if (image == null) {
        return ''; // Return an empty string if no image is selected
      }

      // Get a reference to the Firebase Storage
      final Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('food_images/${DateTime.now().millisecondsSinceEpoch}');

      // Upload the image to Firebase Storage
      await storageReference.putFile(image);

      // Get the download URL of the uploaded image
      String downloadURL = await storageReference.getDownloadURL();
      print('Image uploaded successfully. Download URL: $downloadURL');

      return downloadURL;
    } catch (e) {
      print('Error uploading image to storage: $e');
      return '';
    }
  }
}
//Create a new screen and fetch all these data on that screen including image 