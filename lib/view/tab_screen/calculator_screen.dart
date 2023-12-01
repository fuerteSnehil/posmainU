import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pos/view/tab_screen/ProfileScreen.dart';
import 'package:pos/view/tab_screen/printerScreen.dart';
import 'package:pos/view/tab_screen/view-model/constants/constants.dart';

class FoodItem {
  final String name;
  final double price;
  int quantity;

  FoodItem({
    required this.name,
    required this.price,
    this.quantity = 0,
  });
}

class PLUCalculatorScreen extends StatefulWidget {
  final String phoneNumber;

  const PLUCalculatorScreen({super.key, required this.phoneNumber});
  @override
  _PLUPageState createState() => _PLUPageState();
}

class _PLUPageState extends State<PLUCalculatorScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isTapped = false;
  int productCount = 0;
  Map<int, int> itemPriceCount = {};
  double totalPrice = 0.0;
  int? currentItemCode;
  Map<int, FoodItem> cart = {};

  final Map<int, FoodItem> foodDatabase = {
    11538: FoodItem(name: 'CHEESE VADAPAV', price: 60),
    11537: FoodItem(name: 'MASALA VADAPAV', price: 40),
    11536: FoodItem(name: 'VADAPAV', price: 30),
    11477: FoodItem(name: 'AMUL TAZA', price: 25),
    11480: FoodItem(name: 'ALLO KULCHA', price: 140),
    11478: FoodItem(name: 'BUTTER KULCHA', price: 130),
    11486: FoodItem(name: 'CHUR CHUR KULCHA', price: 180),
    11493: FoodItem(name: 'GARLIC KULCHA', price: 140),
    11481: FoodItem(name: 'GOBI KULCHA', price: 140),
    11479: FoodItem(name: 'MASLA KULCHA', price: 130),
    11484: FoodItem(name: 'MIX VEG KULCHA', price: 150),
    11482: FoodItem(name: 'ONION KULCHA', price: 140),
    11487: FoodItem(name: 'PANEER KULCHA', price: 180),
    11496: FoodItem(name: 'FRY PAPAD', price: 60),
    11497: FoodItem(name: 'MASALA PAPAD', price: 150),
    11509: FoodItem(name: 'CURD', price: 50),
    11510: FoodItem(name: 'VEG RAITA', price: 70),
    11485: FoodItem(name: 'CHEESE', price: 50),
    11501: FoodItem(name: 'CHOLE', price: 60),
    11500: FoodItem(name: 'DAL MAKHANI', price: 40),
    11518: FoodItem(name: 'MAHARAJA SANDWICH', price: 60),
    11517: FoodItem(name: 'PIZZA SANDWICH', price: 150),
    11524: FoodItem(name: 'SPECIAL BURGER', price: 120),
    11520: FoodItem(name: 'VEG BURGER', price: 60),
    11526: FoodItem(name: 'ITALIAN PIZZA', price: 180),
    11525: FoodItem(name: 'MARGHERITA PIZZA', price: 150),
    11529: FoodItem(name: 'SPECIAL PIZZA', price: 180),
    11531: FoodItem(name: 'BUTTER MAGGI', price: 70),
    11432: FoodItem(name: 'CHEESE MAGGI', price: 100),
    11530: FoodItem(name: 'MAGGI', price: 60),
    11542: FoodItem(name: 'ELAICHI TEA', price: 30),
    11540: FoodItem(name: 'BLACK COFFEE', price: 40),
    11541: FoodItem(name: 'HOT BLACK COFFEE', price: 40),
  };

  int enteredCode = 0;
  String? foodName;
  double? foodPrice;

  TextEditingController _textEditingController = TextEditingController();
  bool isInputNotEmpty = false;

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(_updateInputStatus);
  }

  void _updateInputStatus() {
    setState(() {
      isInputNotEmpty = _textEditingController.text.isNotEmpty;
    });
  }

  void onKeyPressed(String value) {
    if (value == 'C') {
      // Clear the text field
      _textEditingController.text = '';
    } else if (value == 'PLU') {
      lookupFood();
      _textEditingController.text = '';
      if (foodPrice != null) {
        setState(() {
          isTapped = true;
        });
        productCount++;
      } else {
        // Show a toast message when the entered code is not found
        Fluttertoast.showToast(
          msg: "No item exist with given code",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: primaryColor,
          textColor: Colors.white,
        );
      }
    } else {
      _textEditingController.text += value;

      // Check if the entered code is in the foodDatabase
      int enteredCode = int.tryParse(_textEditingController.text) ?? 0;

      if (foodDatabase.containsKey(enteredCode)) {
        final foodItem = foodDatabase[enteredCode]!;
        setState(() {
          foodName = foodItem.name;
          foodPrice = foodItem.price;

          if (foodPrice != null) {
            if (cart.containsKey(enteredCode)) {
              // Increment the quantity if the item is already in the cart
              cart[enteredCode]!.quantity++;
            } else {
              // Add the item to the cart with a quantity of 1 if it's a new item
              cart[enteredCode] = foodItem;
              cart[enteredCode]!.quantity = 1;
            }

            totalPrice += foodPrice!;
          }
        });
      }
    }
  }

  void removeItem(int code) {
    if (cart.containsKey(code)) {
      final removedItem = cart[code];
      final removedPrice = cart[code]!.price;

      if (cart[code]!.quantity > 1) {
        // If the item quantity is greater than 1, decrement the quantity by 1
        cart[code]!.quantity--;
      } else {
        // If the item quantity is 1, remove the item from the cart
        cart.remove(code);
      }

      // Update the total price by subtracting the removed item's price
      totalPrice -= removedPrice;

      setState(() {
        if (cart.isEmpty) {
          // If the cart is empty, clear the display
          foodName = null;
          foodPrice = null;
          isTapped = false;
        } else {
          // Show the previous item in the cart
          final lastItem = cart.values.last;
          foodName = lastItem.name;
          foodPrice = lastItem.price;
        }
      });
    }
  }

  void lookupFood() {
    int enteredCode = int.tryParse(_textEditingController.text) ?? 0;

    if (foodDatabase.containsKey(enteredCode)) {
      final foodItem = foodDatabase[enteredCode]!;
      setState(() {
        foodName = foodItem.name;
        foodPrice = foodItem.price;

        if (foodPrice != null) {
          // Add the current food price to the previous total price
          // totalPrice += foodPrice!;
          productCount = 1; // Set the product count to 1 when adding a new item

          // Add the item to the cart
          cart[enteredCode] = foodItem;
        }
      });
    } else {
      setState(() {
        foodName = null;
        foodPrice = null;
      });
    }
  }

  List<Map<String, dynamic>> convertedData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bill generator',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(MdiIcons.account,
                size: 40), // Replace with the desired icon
            color: primaryColor,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          UserProfileScreen(phoneNumber: widget.phoneNumber)));
            },
          ),
        ],
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Enter Food Code:',
            style: TextStyle(
                fontSize: 20, fontFamily: "tabfont", letterSpacing: 2),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.09,
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  // maxLength: 5,
                  style: TextStyle(
                    fontSize: 28,
                    fontFamily: "tabfont",
                    color: primaryColor,
                  ),
                  readOnly: true,
                  controller: _textEditingController,
                  cursorColor: primaryColor,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.black38),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: primaryColor),
                    ),
                    focusColor: primaryColor,
                    hoverColor: primaryColor,
                    suffixIcon: isInputNotEmpty
                        ? IconButton(
                            icon: Icon(
                              Icons.cancel_outlined,
                              color: primaryColor,
                              size: 28,
                            ),
                            onPressed: () {
                              _textEditingController.clear();
                            },
                          )
                        : null,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Container(
            child: GridView.count(
              childAspectRatio: 1.3,
              crossAxisCount: 3,
              shrinkWrap: true,
              children: <Widget>[
                for (var buttonValue in [
                  '1',
                  '2',
                  '3',
                  '4',
                  '5',
                  '6',
                  '7',
                  '8',
                  '9',
                  '0',
                  'C',
                  'PLU',
                ])
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 5, right: 5, top: 5, bottom: 5),
                    child: ElevatedButton(
                      onPressed: () {
                        audioPlayer.play(AssetSource('sounds/beep.mp3'));
                        onKeyPressed(buttonValue);
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 5,
                        shadowColor: primaryColor,
                        primary: Colors.white, // Background color
                        onPrimary: primaryColor, // Text color
                        // padding: EdgeInsets.all(1), // Padding inside the button
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10), // Button border radius
                        ),
                      ),
                      child: Text(
                        buttonValue,
                        style: TextStyle(
                          fontFamily: "tabfont",
                          color: primaryColor,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          isTapped ? billCountContainer() : const SizedBox(),
        ],
      ),
    );
  }

  // Inside the billCountContainer widget
  Widget billCountContainer() {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        color: primaryColor,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "${foodName}",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                "Rs ${foodPrice}",
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: MediaQuery.of(context).size.width * 0.1,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: // Inside the billCountContainer widget
                                          IconButton(
                                        onPressed: () {
                                          audioPlayer.play(
                                              AssetSource('sounds/beep.mp3'));

                                          // Implement functionality to decrease the quantity
                                          if (cart.isNotEmpty) {
                                            final lastItemCode = cart.keys.last;
                                            final lastItem = cart[lastItemCode];
                                            if (lastItem!.quantity > 1) {
                                              cart[lastItemCode]!
                                                  .quantity--; // Decrease the quantity
                                              totalPrice -= lastItem
                                                  .price; // Update the total price
                                            } else {
                                              removeItem(
                                                  lastItemCode); // Remove the item from the cart if the quantity is 1
                                            }

                                            setState(() {});
                                          }
                                        },
                                        icon: Icon(Icons.remove),
                                        color: Colors.white,
                                      ),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 6,
                                            top: 4,
                                          ),
                                          child: Text(
                                            "${cart[cart.keys.last]!.quantity}", // Display the quantity
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: IconButton(
                                        onPressed: () {
                                          audioPlayer.play(
                                              AssetSource('sounds/beep.mp3'));

                                          // Implement functionality to increase count
                                          if (cart.isNotEmpty) {
                                            final lastItemCode = cart.keys.last;
                                            final lastItem = cart[lastItemCode];
                                            cart[lastItemCode]!
                                                .quantity++; // Increase the quantity
                                            totalPrice += lastItem!
                                                .price; // Update the total price

                                            setState(() {});
                                          }
                                          setState(() {});
                                        },
                                        icon: Icon(Icons.add),
                                        color: cart.isNotEmpty
                                            ? Colors
                                                .white // Enable when cart is not empty
                                            : Colors
                                                .grey, // Disable when cart is empty
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 1,
                          ),
                        ],
                      ),
                      Container(
                        color: Colors.green.shade700,
                        height: MediaQuery.of(context).size.height * 0.080,
                        width: double.infinity,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Total: Rs ${totalPrice}",
                            style: const TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      audioPlayer.play(AssetSource('sounds/beep.mp3'));

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PrinterScreen([])));
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      color: Colors.red,
                      child: const Icon(
                        Icons.print,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
