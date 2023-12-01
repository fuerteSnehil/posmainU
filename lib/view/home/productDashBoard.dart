import 'package:audiofileplayer/audiofileplayer.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:pos/view/tab_screen/printerScreen.dart';
import 'package:pos/view/tab_screen/view-model/constants/constants.dart';
import 'package:pos/view/tab_screen/view-model/frontend/menuItems.dart';

class ProductDashBoard extends StatefulWidget {
  const ProductDashBoard({super.key});

  @override
  State<ProductDashBoard> createState() => _ProductDashBoardState();
}

class _ProductDashBoardState extends State<ProductDashBoard> {
  AudioPlayer audioPlayer = AudioPlayer();

  bool isTapped = false;
  // List<String> itemImages = [
  //   "$imagesPath/MasalaSandwich.png",
  //   "$imagesPath/amul.jpg",
  //   "$imagesPath/amul.jpg",
  //   "$imagesPath/ColdBalckCoffee.png",
  //   "$imagesPath/bondiRaita.jpeg",
  //   "$imagesPath/maggi.jpeg",
  //   "$imagesPath/ButterKulcha.jpg",
  //   "$imagesPath/buttermaggiO.webp",
  //   "$imagesPath/cheese.png",
  //   "$imagesPath/CCK.jpg",
  //   "$imagesPath/Cheese-Garlic-Kulcha.jpg",
  //   "$imagesPath/maggi.jpg",
  //   "$imagesPath/Cheese-Masala-Papad.jpg",
  //   "$imagesPath/cheesePneerKulcha.jpeg",
  //   "$imagesPath/cheeseVadapav.jpg",
  //   "$imagesPath/ChocolateLassi.png",
  //   "$imagesPath/Chocolate-Sandwich.jpg",
  //   "$imagesPath/Chole.png",
  //   "$imagesPath/churchurKulcha.jpg",
  //   "$imagesPath/Curd.png",
  //   "$imagesPath/dalmakhani.webp",
  //   "$imagesPath/doublecheeseBurger.webp",
  //   "$imagesPath/dryfruitLassi.jpg",
  //   "$imagesPath/elaichiTea.webp",
  //   "$imagesPath/Papad.webp",
  //   "$imagesPath/garlicKulcha.webp",
  //   "$imagesPath/ghorvu.webp",
  //   "$imagesPath/GPTea.webp",
  //   "$imagesPath/gobiKulcha.jpeg",
  //   "$imagesPath/HotBlackCoffee.webp",
  //   "$imagesPath/italianPizza.jpg",
  //   "$imagesPath/kulcha.jpg",
  //   "$imagesPath/KulchaHubSpecial.webp",
  //   "$imagesPath/kulchaPlatter.jpg",
  //   "$imagesPath/Maggi.jpg",
  //   "$imagesPath/MaharajaSandwich.jpg",
  //   "$imagesPath/margherita.webp",
  //   "$imagesPath/masalaCheese.JPG",
  //   "$imagesPath/masalaKulcha.jpg",
  //   "$imagesPath/masalaPapad.jpg",
  //   "$imagesPath/masalaVadapav.jpg",
  //   "$imagesPath/maxicanPizza.jpg",
  //   "$imagesPath/mixvegKulcha.jpeg",
  //   "$imagesPath/onionKulcha.jpg",
  //   "$imagesPath/paneerChilliKulcha.webp",
  //   "$imagesPath/paneerGarlicK.webp",
  //   "$imagesPath/paneerKulcha.jpg",
  //   "$imagesPath/paneerTandoriB.jpg",
  //   "$imagesPath/Pizza-Sandwich.jpg",
  //   "$imagesPath/Rajma.webp",
  //   "$imagesPath/regularTea.jpg",
  //   "$imagesPath/roseLassi.webp",
  //   "$imagesPath/Roasted_Papad.jpeg",
  //   "$imagesPath/saltedLassi.jpg",
  //   "$imagesPath/SpecialBurger.jpg",
  //   "$imagesPath/specialPizza.webp",
  //   "$imagesPath/sugarFreeT.webp",
  //   "$imagesPath/sweetLassi.jpeg",
  //   "$imagesPath/tandooriPaneerPizza.jpg",
  //   "$imagesPath/TPSandwich.webp",
  //   "$imagesPath/vadapav.png",
  //   "$imagesPath/VegCheeseSandwich.png",
  //   "$imagesPath/VegGSandwich.jpg",
  //   "$imagesPath/VegRaita.webp",
  //   "$imagesPath/VegBurger.jpg",
  //   "$imagesPath/VegCheeseBurger.jpeg",
  // ];

  late String itemValue;
  List<String> itemName = [
    "MASALA SANDWICH",
    "ALOO KULCHA",
    "AMUL TAZAA",
    "BLACK COFFEE",
    "BOONDI RAITA",
    "BUTTER CHEESE MAGGI",
    'BUTTER KULCHA',
    'BUTTER MAGGI',
    'CHEESE',
    'CHEESE CHILLI KULCHA',
    "CHEESE GARLIC KULCHA",
    "CHEESE MAGGI",
    "CHEESE MASALA PAPAD",
    "CHEESE PANEER KULCHA",
    "CHEESE VADAPAV",
    "CHOCOLATE LASSI",
    "CHOCCOLATE SANDWICH",
    "CHOLE",
    "CHUR CHUR KULCHA",
    "CURD",
    "DAL MAKHANI",
    'DOUBLE CHEESE BURGER',
    'DRY FRUIT LASSI',
    'ELAICHI TEA',
    'FRY PAPAD',
    'GARLIC KULCHA',
    'GHORVU',
    'GINGER PUDINA TEA',
    'GOBI KULCHA',
    'HOT BLACK COFFEE',
    'ITALIAN PIZZA',
    'KULCHA SPECIAL',
    'KULCHA HUB',
    'KULCHA PLATTER',
    'MAGGI',
    'MAHARAJA SANDWICH',
    'MARGHERITA PIZZA',
    'MASALA CHEESE SANDWICH',
    'MASALA KULCHA',
    'MASALA PAPAD',
    'MASALA VADAPAV',
    'MAXICAN PIZZA',
    'MIX VEG KULCHA',
    'ONION KULCHA',
    "PANEER CHILLI KULCHA",
    'PANEER GARLIC KULCHA',
    'PANEER KULCHA',
    'PANEER TANDURI.. BURGER',
    'PIZZA SANDWICH',
    'RAJMA',
    'REGULAR TEA',
    'ROSE LASSI',
    'ROSTED PAPAD',
    'SALTED LASSI',
    'SPECIAL BURGER',
    'SPECIAL PIZZA',
    'SUGAR FREE TEA',
    'SWEET LASSI',
    'TANDOORI PANEER PIZZA',
    'TANDOORI PANEER SANDWICH',
    'VADAPAV',
    'VEG CHEESE SANDWICH',
    'VEG GRILLED SANDWICH',
    'VEG RAITA',
    'VEG BURGER',
    'VEG CHEESE BURGER'
  ];
  Map<String, int> itemPriceCount = {};
  late int count = 0;

  Map<String, int> itemPrices = {
    "MASALA SANDWICH": 40,
    "ALOO KULCHA": 140,
    "AMUL TAZAA": 25,
    "BLACK COFFEE": 40,
    "BOONDI RAITA": 60,
    "BUTTER CHEESE MAGGI": 120,
    'BUTTER KULCHA': 130,
    'BUTTER MAGGI': 70,
    'CHEESE': 50,
    'CHEESE CHILLI KULCHA': 190,
    "CHEESE GARLIC KULCHA": 190,
    "CHEESE MAGGI": 100,
    "CHEESE MASALA PAPAD": 60,
    "CHEESE PANEER KULCHA": 200,
    "CHEESE VADAPAV": 60,
    "CHOCOLATE LASSI": 100,
    "CHOCCOLATE SANDWICH": 70,
    "CHOLE": 60,
    "CHUR CHUR KULCHA": 180,
    "CURD": 50,
    "DAL MAKHANI": 80,
    'DOUBLE CHEESE BURGER': 100,
    'DRY FRUIT LASSI': 120,
    'ELAICHI TEA': 30,
    'FRY PAPAD': 25,
    'GARLIC KULCHA': 140,
    'GHORVU': 30,
    'GINGER PUDINA TEA': 40,
    'GOBI KULCHA': 140,
    'HOT BLACK COFFEE': 40,
    'ITALIAN PIZZA': 180,
    'KULCHA SPECIAL': 250,
    'KULCHA HUB': 150,
    'KULCHA PLATTER': 230,
    'MAGGI': 60,
    'MAHARAJA SANDWICH': 160,
    'MARGHERITA PIZZA': 150,
    'MASALA CHEESE SANDWICH': 140,
    'MASALA KULCHA': 130,
    'MASALA PAPAD': 40,
    'MASALA VADAPAV': 40,
    'MAXICAN PIZZA': 180,
    'MIX VEG KULCHA': 150,
    'ONION KULCHA': 140,
    "PANEER CHILLI KULCHA": 180,
    'PANEER GARLIC KULCHA': 180,
    'PANEER KULCHA': 180,
    'PANEER TANDURI BURGER': 90,
    'PIZZA SANDWICH': 150,
    'RAJMA': 60,
    'REGULAR TEA': 30,
    'ROSE LASSI': 100,
    'ROSTED PAPAD': 20,
    'SALTED LASSI': 70,
    'SPECIAL BURGER': 120,
    'SPECIAL PIZZA': 180,
    'SUGAR FREE TEA': 30,
    'SWEET LASSI': 80,
    'TANDOORI PANEER PIZZA': 200,
    'TANDOORI PANEER SANDWICH': 100,
    'VADAPAV': 30,
    'VEG CHEESE SANDWICH': 100,
    'VEG GRILLED SANDWICH': 80,
    'VEG RAITA': 70,
    'VEG BURGER': 60,
    'VEG CHEESE BURGER': 80
  };
  Map<String, Map<String, dynamic>> filterdData = {
    "MASALA SANDWICH": {
      "imagePath": "$imagesPath/MasalaSandwich.png",
      "price": 40,
    },
    "ALOO KULCHA": {
      "imagePath": "$imagesPath/AlloKulcha.png",
      "price": 140,
    },
    "AMUL TAZAA": {
      "imagePath": "$imagesPath/amul.jpg",
      "price": 25,
    },
    "BLACK COFFEE": {
      "imagePath": "$imagesPath/ColdBlackC.jpg",
      "price": 40,
    },
    "BOONDI RAITA": {
      "imagePath": "$imagesPath/BoondiRaita.png",
      "price": 60,
    },
    "BUTTER CHEESE MAGGI": {
      "imagePath": "$imagesPath/ButterCMaggi.png",
      "price": 120,
    },
    "BUTTER KULCHA": {
      "imagePath": "$imagesPath/BKulcha.png",
      "price": 130,
    },
    "BUTTER MAGGI": {
      "imagePath": "$imagesPath/Bmaggi.png",
      "price": 70,
    },
    "CHEESE": {
      "imagePath": "$imagesPath/cheese.png",
      "price": 50,
    },
    "CHEESE CHILLI KULCHA": {
      "imagePath": "$imagesPath/CCKulcha.png",
      "price": 190,
    },
    "CHEESE GARLIC KULCHA": {
      "imagePath": "$imagesPath/CGKUlcha.jpg",
      "price": 190,
    },
    "CHEESE MAGGI": {
      "imagePath": "$imagesPath/CMaggi.jpg",
      "price": 100,
    },
    "CHEESE MASALA PAPAD": {
      "imagePath": "$imagesPath/CMpapad.jpeg",
      "price": 60,
    },
    "CHEESE PANEER KULCHA": {
      "imagePath": "$imagesPath/CPKulcha.png",
      "price": 200,
    },
    "CHEESE VADAPAV": {
      "imagePath": "$imagesPath/CVadapav.png",
      "price": 60,
    },
    "CHOCOLATE LASSI": {
      "imagePath": "$imagesPath/CLassi.png",
      "price": 100,
    },
    "CHOCCOLATE SANDWICH": {
      "imagePath": "$imagesPath/CSandwich.png",
      "price": 70,
    },
    "CHOLE": {
      "imagePath": "$imagesPath/Chole.jpeg",
      "price": 60,
    },
    "CHUR CHUR KULCHA": {
      "imagePath": "$imagesPath/ChurKulcha.webp",
      "price": 180,
    },
    "CURD": {
      "imagePath": "$imagesPath/Curd.jpg",
      "price": 180,
    },
    "DAL MAKHANI": {
      "imagePath": "$imagesPath/DalMakhani.jpg",
      "price": 30,
    },
    "DOUBLE CHEESE BURGER": {
      "imagePath": "$imagesPath/DCBurger.jpeg",
      "price": 30,
    },
    "DRY FRUIT LASSI": {
      "imagePath": "$imagesPath/DFLassi.png",
      "price": 30,
    },
    "ELAICHI TEA": {
      "imagePath": "$imagesPath/ETea.png",
      "price": 30,
    },
    "FRY PAPAD": {
      "imagePath": "$imagesPath/FryPapad.jpg",
      "price": 30,
    },
    "GARLIC KULCHA": {
      "imagePath": "$imagesPath/GarlicKulcha.png",
      "price": 30,
    },
    "GHORVU": {
      "imagePath": "$imagesPath/Ghorvu.png",
      "price": 30,
    },
    "GINGER PUDINA TEA": {
      "imagePath": "$imagesPath/GPTea.jpg",
      "price": 30,
    },
    "GOBI KULCHA": {
      "imagePath": "$imagesPath/GobiKulcha.jpg",
      "price": 30,
    },
    "HOT BLACK COFFEE": {
      "imagePath": "$imagesPath/hotCoffee.webp",
      "price": 30,
    },
    "ITALIAN PIZZA": {
      "imagePath": "$imagesPath/pizza.png",
      "price": 30,
    },
    "KULCHA SPECIAL": {
      "imagePath": "$imagesPath/KulchaS.webp",
      "price": 30,
    },
    "KULCHA HUB": {
      "imagePath": "$imagesPath/KulchaHS.png",
      "price": 30,
    },
    "KULCHA PLATTER": {
      "imagePath": "$imagesPath/KulchaPlatter.png",
      "price": 30,
    },
    "MAGGI": {
      "imagePath": "$imagesPath/Maggi.jpg",
      "price": 30,
    },
    "MAHARAJA SANDWICH": {
      "imagePath": "$imagesPath/MaharajaS.jpg",
      "price": 30,
    },
    "MARGHERITA PIZZA": {
      "imagePath": "$imagesPath/MargheritaPizza.jpg",
      "price": 30,
    },
    "MASALA CHEESE SANDWICH": {
      "imagePath": "$imagesPath/MCSandwich.jpeg",
      "price": 30,
    },
    "MASALA KULCHA": {
      "imagePath": "$imagesPath/MKulcha.png",
      "price": 30,
    },
    "MASALA PAPAD": {
      "imagePath": "$imagesPath/MasalaPapad.jpg",
      "price": 30,
    },
    "MASALA VADAPAV": {
      "imagePath": "$imagesPath/MasalaVadapav.png",
      "price": 30,
    },
    "MAXICAN PIZZA": {
      "imagePath": "$imagesPath/MargheritaPizza.webp",
      "price": 30,
    },
    "MIX VEG KULCHA": {
      "imagePath": "$imagesPath/MvKulcha.png",
      "price": 30,
    },
    "ONION KULCHA": {
      "imagePath": "$imagesPath/OnionKulcha.jpeg",
      "price": 30,
    },
    "PANEER CHILLI KULCHA": {
      "imagePath": "$imagesPath/PCKulcha.jpg",
      "price": 30,
    },
    "PANEER GARLIC KULCHA": {
      "imagePath": "$imagesPath/PGKulcha.jpeg",
      "price": 30,
    },
    "PANEER KULCHA": {
      "imagePath": "$imagesPath/paneerKulcha.jpg",
      "price": 30,
    },
    "PANEER TANDURI.. BURGER'": {
      "imagePath": "$imagesPath/PTBurger.webp",
      "price": 30,
    },
    "PIZZA SANDWICH": {
      "imagePath": "$imagesPath/PizzaSandwich.jpg",
      "price": 30,
    },
    "RAJMA": {
      "imagePath": "$imagesPath/Rajma.webp",
      "price": 30,
    },
    "REGULAR TEA": {
      "imagePath": "$imagesPath/RTea.webp",
      "price": 30,
    },
    "ROSE LASSI": {
      "imagePath": "$imagesPath/RoseLassi.jpg",
      "price": 30,
    },
    "ROSTED PAPAD": {
      "imagePath": "$imagesPath/RostedPapad.webp",
      "price": 30,
    },
    "SALTED LASSI": {
      "imagePath": "$imagesPath/SaltedLassi.webp",
      "price": 30,
    },
    "SPECIAL BURGER": {
      "imagePath": "$imagesPath/SpecialBurger.jpg",
      "price": 30,
    },
    "SPECIAL PIZZA": {
      "imagePath": "$imagesPath/SpecialPizza.jpg",
      "price": 30,
    },
    "SUGAR FREE TEA": {
      "imagePath": "$imagesPath/SugarFree.jpg",
      "price": 30,
    },
    "SWEET LASSI": {
      "imagePath": "$imagesPath/SLassi.jpg",
      "price": 30,
    },
    "TANDOORI PANEER PIZZA": {
      "imagePath": "$imagesPath/TPPizza.webp",
      "price": 30,
    },
    "TANDOORI PANEER SANDWICH": {
      "imagePath": "$imagesPath/TPSandwich.webp",
      "price": 30,
    },
    "VADAPAV": {
      "imagePath": "$imagesPath/vadapav.png",
      "price": 30,
    },
    "VEG CHEESE SANDWICH": {
      "imagePath": "$imagesPath/VegCheeseSandwich.png",
      "price": 30,
    },
    "VEG GRILLED SANDWICH": {
      "imagePath": "$imagesPath/VegGSandwich.jpg",
      "price": 30,
    },
    "VEG RAITA": {
      "imagePath": "$imagesPath/VegRaita.webp",
      "price": 30,
    },
    "VEG BURGER": {
      "imagePath": "$imagesPath/VegBurger.jpg",
      "price": 30,
    },
    "VEG CHEESE BURGER": {
      "imagePath": "$imagesPath/VegCheeseBurger.jpeg",
      "price": 30,
    },
  };
  int? tappedItemPrice;
  String? tappedItemName;
  final TextEditingController _searchController = TextEditingController();
  bool isSearching = false;
  List<String> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = itemName; // Initially, display all items
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearching
            ? TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: "Search",
                ),
                onChanged: (value) {
                  setState(() {
                    // Update filteredItems based on search input
                    filteredItems = itemName
                        .where((item) =>
                            item.toLowerCase().contains(value.toLowerCase()))
                        .toList();
                  });
                },
              )
            : Text("Hot Meals"),
        actions: <Widget>[
          isSearching
              ? IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: red,
                  ),
                  onPressed: () {
                    setState(() {
                      _searchController.clear();
                      isSearching = false;
                      filteredItems = itemName; // Clear the filter
                    });
                  },
                )
              : IconButton(
                  icon: Icon(
                    Icons.search,
                    color: primaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      isSearching = true;
                    });
                  },
                ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 18,
                  childAspectRatio: 0.7),
              itemCount:
                  isSearching ? filteredItems.length : filterdData.length,
              // Use filteredItems when searching is true, otherwise use all items in filterdData
              itemBuilder: (context, index) {
                final item = isSearching
                    ? filteredItems[index]
                    : filterdData.keys.elementAt(index);
                final itemData = filterdData[item];

                return GestureDetector(
                  onTap: () {
                    audioPlayer.play(AssetSource('sounds/beep.mp3'));

                    setState(() {
                      // Play a sound as a one-shot, releasing its resources when it finishes playing.
                      // Audio.load("$imagesPath/beep.mp3")
                      //   ..play()
                      //   ..dispose();
                      isTapped = true;
                      String itemName = item;
                      int prices = itemData?['price'] ?? 0;
                      tappedItemPrice = prices;
                      tappedItemName = itemName;
                      if (itemPriceCount.containsKey(itemName)) {
                        int itemCount = itemPriceCount[itemName] ?? 0;
                        itemPriceCount[itemName] = itemCount + 1;
                        itemPriceCount.forEach((key, value) {
                          print("Printing again from start");
                          print("$key and count is $value");
                          print("it has been done");
                          print(itemPriceCount);
                        });
                      } else {
                        itemPriceCount[itemName] = 1;
                      }
                    });
                  },
                  child: MenuItem(
                    context: context,
                    imagePath: itemData?['imagePath'],
                    text: item,
                  ),
                );
              },
            ),
          ),
          isTapped ? billCountContainer() : const SizedBox(),
        ],
      ),
    );
  }

  Widget billCountContainer() => Container(
        height: MediaQuery.of(context).size.height * 0.17,
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
                            "${tappedItemName ?? 'N/A'}",
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: white),
                          )),
                          Column(
                            children: [
                              Text(
                                "Rs ${tappedItemName != null ? (itemPrices[tappedItemName!] ?? 0).toStringAsFixed(2) : '0.00'}",
                                style: const TextStyle(
                                  color: white,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: MediaQuery.of(context).size.width * 0.1,
                                decoration: BoxDecoration(
                                    border: Border.all(color: white, width: 1)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: IconButton(
                                        onPressed: () {
                                          audioPlayer.play(
                                              AssetSource('sounds/beep.mp3'));

                                          if (tappedItemName != null &&
                                              tappedItemPrice != null) {
                                            final name = tappedItemName!;
                                            final price = tappedItemPrice!;
                                            final currentCount =
                                                itemPriceCount[name] ?? 0;
                                            if (currentCount > 1) {
                                              itemPriceCount[name] =
                                                  currentCount - 1;
                                            } else if (currentCount == 1) {
                                              // If the current count is 1, set it to 0 and display the previous item
                                              itemPriceCount[name] = 0;
                                              final previousItemName =
                                                  getPreviousItem(
                                                      itemPriceCount);
                                              if (previousItemName != null) {
                                                tappedItemName =
                                                    previousItemName;
                                              } else {
                                                isTapped = false;
                                                setState(() {});
                                              }
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
                                              left: 6, top: 4),
                                          child: Text(
                                            "${itemPriceCount[tappedItemName!] ?? 0}.0 ", // Display the count
                                            style: TextStyle(
                                                fontSize: 18, color: white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: IconButton(
                                        onPressed: () {
                                          audioPlayer.play(
                                              AssetSource('sounds/beep.mp3'));

                                          if (tappedItemName != null &&
                                              tappedItemPrice != null) {
                                            final name = tappedItemName!;
                                            final price = tappedItemPrice!;
                                            final currentCount =
                                                itemPriceCount[name] ?? 0;
                                            itemPriceCount[name] =
                                                currentCount + 1;
                                          }
                                          setState(() {});
                                        },
                                        icon: Icon(Icons.add),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 1,
                          )
                        ],
                      ),
                      Container(
                        color: Colors.green.shade700,
                        height: MediaQuery.of(context).size.height * 0.080,
                        width: double.infinity,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            // "Total: Rs 190.00",
                            "Total: Rs ${totalPriceCount(itemPriceCount).toString()}.00",
                            style: const TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
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
                              builder: (context) =>
                                  PrinterScreen([itemPrices])));
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.17,
                      color: Colors.red,
                      child: const Icon(
                        Icons.print,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      );
  String? getPreviousItem(Map<String, int> itemPriceCount) {
    for (var entry in itemPriceCount.entries) {
      if (entry.value > 0) {
        return entry.key;
      }
    }
    return null;
  }

  int totalPriceCount(Map<String, int> priceList) {
    int paisa = 0;
    priceList.forEach((key, value) {
      int rs = itemPrices[key] ?? 0;
      int singleItemPrice = value * rs;
      paisa += singleItemPrice;
    });
    return paisa;
  }
}
