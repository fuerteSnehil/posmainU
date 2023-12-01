import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pos/view/tab_screen/view-model/constants/constants.dart';

class AllFoodsScreen extends StatefulWidget {
  final String documentId;

  AllFoodsScreen({required this.documentId});

  @override
  State<AllFoodsScreen> createState() => _AllFoodsScreenState();
}

class _AllFoodsScreenState extends State<AllFoodsScreen> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> _deleteItem(String itemId) async {
    try {
      await FirebaseFirestore.instance
          .collection('AllUsers')
          .doc(widget.documentId)
          .collection('foodItems')
          .doc(itemId)
          .delete();

      Fluttertoast.showToast(
        msg: 'Item deleted successfully!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } catch (e) {
      print('Error deleting item: $e');
      Fluttertoast.showToast(
        msg: 'Error deleting item. Please try again!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Details'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('AllUsers')
            .doc(widget.documentId)
            .collection('foodItems')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            var documents = snapshot.data!.docs;
            if (documents.isEmpty) {
              return Text('No data found.');
            }

            return ListView.separated(
              itemCount: documents.length,
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  indent: 40,
                  endIndent: 40,
                ); // Add a divider between items
              },
              itemBuilder: (context, index) {
                var data = documents[index].data() as Map<String, dynamic>;
                return ListTile(
                  leading: Container(
                      height: 70,
                      width: 70,
                      child: Image.network(data['imagePath'] ?? '')),
                  // CachedNetworkImage(
                  //   imageUrl: data['imagePath'],
                  //   imageBuilder: (context,imageProvider)=> Container(
                  //     height: 50,
                  //     width: 70,
                  //    decoration: BoxDecoration(image: imageProvider,shape: BoxShape.circle),

                  //   ),
                  //   placeholder: (context, url) => CircularProgressIndicator(),
                  //   errorWidget: (context, url, error) {
                  //     print('Error loading image: $error');
                  //     return Icon(Icons.error);
                  //   },
                  // ),
                  //     CircleAvatar(
                  //   child: Image.network(data['imagePath'] ?? ''),
                  // ),
                  //     CachedNetworkImage(
                  //   imageUrl: data['imagePath'],
                  //   imageBuilder: (context, imageProvider) => Container(
                  //     height: 50,
                  //     width: 70,
                  //     // decoration: BoxDecoration(
                  //     //   image: DecorationImage(
                  //     //     image: imageProvider,
                  //     //     fit: BoxFit.cover,
                  //     //   ),
                  //     // ),
                  //     // child: Image.network(data['imagePath'] ?? ''),
                  //   ),
                  //   placeholder: (context, url) => Container(
                  //     height: 50,
                  //     width: 70,
                  //     // decoration: BoxDecoration(
                  //     //   image: DecorationImage(
                  //     //     image: imageProvider,
                  //     //     fit: BoxFit.cover,
                  //     //   ),
                  //     // ),
                  //     child: Image.network(data['imagePath'] ?? ''),
                  //   ),
                  //   errorWidget: (context, url, error) => Icon(Icons.error),
                  // ),
                  title: Text(
                    'Food Name: ${data['name'] ?? ''}',
                    style: TextStyle(
                      fontFamily: "tabfont",
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Food Code: ${data['foodCode'] ?? ''}',
                        style: TextStyle(
                          fontFamily: "fontmain",
                        ),
                      ),
                      Text(
                        'Food Price: ${data['price'] ?? ''}',
                        style: TextStyle(
                          fontFamily: "fontmain",
                        ),
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.cancel,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: SizedBox(
                              height: 200,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                      '$imagesPath/delete.gif',
                                      scale: 2,
                                    ),
                                    const Text(
                                      "Remove this item ?",
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: primaryColor,
                                          ),
                                          child: const Text(
                                            "Cancel",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red,
                                          ),
                                          child: const Text(
                                            "Delete",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          onPressed: () {
                                            _deleteItem(documents[index].id);
                                            Navigator.pop(context);
                                          },
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
