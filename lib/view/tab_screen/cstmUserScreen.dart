import 'package:flutter/material.dart';
import 'package:pos/view/tab_screen/addItemScreen.dart';
import 'package:pos/view/tab_screen/foodDetailsScreen.dart';
import 'package:pos/view/tab_screen/view-model/constants/constants.dart';

class CstmUserScreen extends StatefulWidget {
  final String uid;

  CstmUserScreen({required this.uid, super.key});

  @override
  State<CstmUserScreen> createState() => _CstmUserScreenState();
}

class _CstmUserScreenState extends State<CstmUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Add Your Items',
          style: TextStyle(
            fontFamily: "tabfont",
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .3,
              child: Image.asset(
                '$imagesPath/cstm.gif',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.20,
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddItemScreen(
                                    uid: widget.uid,
                                  )));
                    },
                    child: Card(
                      color: Colors.white,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * .12,
                            width: MediaQuery.of(context).size.width * .2,
                            child: Image.asset(
                              '$imagesPath/cup.gif',
                            ),
                          ),
                          const Text(
                            'Add Food Items',
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: "tabfont",
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.20,
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AllFoodsScreen(documentId: widget.uid)));
                    },
                    child: Card(
                      color: Colors.white,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * .12,
                            width: MediaQuery.of(context).size.width * .2,
                            child: Image.asset(
                              '$imagesPath/popcorn.gif',
                              scale: 1,
                            ),
                          ),
                          const Text(
                            'View Your Items ',
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: "tabfont",
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //
              ],
            ),
          ],
        ),
      ),
    );
  }
}
