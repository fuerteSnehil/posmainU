import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
// import 'package:pos/view-model/constants/constants.dart';
import 'package:pos/view/tab_screen/printerScreen.dart';
import 'package:pos/view/tab_screen/view-model/constants/constants.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({Key? key}) : super(key: key);

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  AudioPlayer audioPlayer = AudioPlayer();

  String? tappedItemName;
  int? tappedItemPrice;
  String? previousTappedItemName;
  int? previousTappedItemPrice;
  Map<String, String> foodItemImages = {
    "CHEESE VADAPAV": "$imagesPath/CVadapav.png",
    "MASALA VADAPAV": "$imagesPath/MasalaVadapav.png",
    "VADAPAV": "$imagesPath/vadapav.png",
    "AMUL TAZAA": "$imagesPath/amul.jpg",
    "ALLO KULCHA": "$imagesPath/AlloKulcha.png",
    "BUTTER KULCHA": "$imagesPath/BKulcha.png",
    "CHEESE CHILLI KULCHA": "$imagesPath/CCKulcha.png",
    "CHEESE GARLIC KULCHA": "$imagesPath/GKulcha.png",
    "CHEESE PANEER KULCHA": "$imagesPath/CPKulcha.png",
    "CHUR CHUR KULCHA": "$imagesPath/ChurKulcha.webp",
    "GARLIC KULCHA": "$imagesPath/GarlicKulcha.png",
    "GOBI KULCHA": "$imagesPath/GobiKulcha.jpg",
    "KULCHA HUB SPECIAL": "$imagesPath/KulchaHS.png",
    "KULCHA PLATTER": "$imagesPath/KulchaPlatter.png",
    "MASALA KULCHA": "$imagesPath/MKulcha.png",
    "MIX VEG KULCHA": "$imagesPath/MvKulcha.png",
    "ONION KULCHA": "$imagesPath/OnionKulcha.jpeg",
    "PANEER CHILLI KULCHA": "$imagesPath/PaneerCKulcha.jpg",
    "PANEER GARLIC KULCHA": "$imagesPath/paneerGarlicK.webp",
    "PANEER KULCHA": "$imagesPath/paneerKulcha.png",
    "CHEESE MASALA PAPAD": "$imagesPath/CMpapad.jpeg",
    "FRY PAPAD": "$imagesPath/FryPapad.jpg",
    "MASALA PAPAD": "$imagesPath/MasalaPapad.jpg",
    "ROASTED PAPAD": "$imagesPath/RostedPapad.webp",
    "CHOCOLATE LASSI": "$imagesPath/CLassi.png",
    "DRY FRUIT LASSI": "$imagesPath/DFLassi.png",
    "GHORVU": "$imagesPath/Ghorvu.png",
    "KULCHA HUB SPECIAL LASSI": "$imagesPath/SLassi.jpg",
    "ROSE LASSI": "$imagesPath/RoseLassi.jpg",
    "SALTED LASSI": "$imagesPath/SaltedLassi.webp",
    "SWEET LASSI": "$imagesPath/SLassi.jpg",
    "BOONDI RAITA": "$imagesPath/BoondiRaita.png",
    "CURD": "$imagesPath/Curd.jpg",
    "VEG RAITA": "$imagesPath/VegRaita.webp",
    "CHEESE": "$imagesPath/cheese.png",
    "CHOLE": "$imagesPath/Chole.jpeg",
    "DAL MAKHANI": "$imagesPath/DalMakhani.jpg",
    "RAJMA": "$imagesPath/Rajma.webp",
    "MASALA SANDWICH": "$imagesPath/MasalaSandwich.png",
    "CHOCOLATE SANDWICH": "$imagesPath/CSandwich.png",
    "MAHARAJA SANDWICH": "$imagesPath/MaharajaS.jpg",
    "MASALA CHEESE SANDWICH": "$imagesPath/MCSandwich.jpeg",
    "PIZZA SANDWICH": "$imagesPath/PizzaSandwich.jpg",
    "TANDOORI PANEER SANDWICH": "$imagesPath/TPSandwich.webp",
    "VEG CHEESE SANDWICH": "$imagesPath/VcheeseSandwich.png",
    "VEG GARLIC SANDWICH": "$imagesPath/VegGSandwich.jpg",
    "DOUBLE CHEESE BURGER": "$imagesPath/DCBurger.jpeg",
    "PANEER TANDOORI BURGER": "$imagesPath/PTBurger.webp",
    "SPECIAL BURGER": "$imagesPath/SpecialBurger.jpg",
    "VEG BURGER": "$imagesPath/VegBurger.jpg",
    "VEG CHEESE BURGER": "$imagesPath/VegCheeseBurger.jpeg",
    "ITALIAN PIZZA": "$imagesPath/pizza.png",
    "MARGHERITA PIZZA": "$imagesPath/MargheritaPizza.jpg",
    "MAXICAN PIZZA": "$imagesPath/pizza.png",
    "SPECIAL PIZZA": "$imagesPath/SpecialPizza.jpg",
    "TANDOORI PANEER PIZZA": "$imagesPath/TPPizza.webp",
    "BUTTER CHEESE MAGGI": "$imagesPath/ButterCMaggi.png",
    "BUTTER MAGGI": "$imagesPath/Bmaggi.png",
    "CHEESE MAGGI": "$imagesPath/CMaggi.jpg",
    "MAGGI": "$imagesPath/Maggi.jpg",
    "ELAICHI TEA": "$imagesPath/ETea.png",
    "GINGER PUDINA TEA": "$imagesPath/GPTea.jpg",
    "REGULAR TEA": "$imagesPath/RTea.webp",
    "SUGAR TEA": "$imagesPath/RTea.webp",
    "BLACK COFFEE": "$imagesPath/ColdBlackC.jpg",
    "HOT BLACK COFFEE": "$imagesPath/hotCoffee.webp",
  };
  Map<String, List<FoodModel>> foodItems = {
    "Vadapav": [
      FoodModel(foodName: "CHEESE VADAPAV", foodCode: '11538', price: 60),
      FoodModel(foodName: "MASALA VADAPAV", foodCode: '11537', price: 40),
      FoodModel(foodName: "VADAPAV", foodCode: '11536', price: 30),
    ],
    "Milk": [
      FoodModel(foodName: "AMUL TAZAA", foodCode: '11477', price: 25),
    ],
    "Kulchas": [
      FoodModel(foodName: "ALLO KULCHA", foodCode: '11480', price: 140),
      FoodModel(foodName: "BUTTER KULCHA", foodCode: '11478', price: 130),
      FoodModel(foodName: "CHEESE CHILLI KULCHA", foodCode: '', price: 190),
      FoodModel(foodName: "CHEESE GARLIC KULCHA", foodCode: '', price: 190),
      FoodModel(foodName: "CHEESE PANEER KULCHA", foodCode: '', price: 100),
      FoodModel(foodName: "CHUR CHUR  KULCHA", foodCode: '11486', price: 180),
      FoodModel(foodName: "GARLIC KULCHA", foodCode: '11493', price: 140),
      FoodModel(foodName: "GOBI KULCHA", foodCode: '11481', price: 140),
      FoodModel(foodName: "KULCHA HUB  SPECIAL", foodCode: '', price: 250),
      FoodModel(foodName: "KULCHA PLATTER", foodCode: '11493', price: 230),
      FoodModel(foodName: "MASALA KULCHA", foodCode: '11479', price: 130),
      FoodModel(foodName: "MIX VEG KULCHA", foodCode: '11484', price: 150),
      FoodModel(foodName: "ONION KULCHA", foodCode: '11482', price: 140),
      FoodModel(foodName: "PANEER CHILLI  KULCHA", foodCode: '', price: 180),
      FoodModel(
          foodName: "PANEER GARLIC KULCHA", foodCode: '11479', price: 180),
      FoodModel(foodName: "PANEER KULCHA", foodCode: '11487', price: 180),
    ],
    "Papad": [
      FoodModel(foodName: "CHEESE MASALA PAPAD", foodCode: '', price: 60),
      FoodModel(foodName: "FRY PAPAD", foodCode: '11496', price: 25),
      FoodModel(foodName: "MASALA PAPAD", foodCode: '11497', price: 40),
      FoodModel(foodName: "ROASTED PAPAD", foodCode: '11538', price: 20),
    ],
    "Lassi": [
      FoodModel(foodName: "CHOCOLATE LASSI", foodCode: '11505', price: 100),
      FoodModel(foodName: "DRY FRUIT LASSI", foodCode: '11506', price: 120),
      FoodModel(foodName: "GHORVU", foodCode: '11508', price: 30),
      FoodModel(foodName: "KULCHA HUB SPECIAL LASSI", foodCode: '', price: 150),
      FoodModel(foodName: "ROSE LASSI", foodCode: '11504', price: 100),
      FoodModel(foodName: "SALTED LASSI", foodCode: '11502', price: 70),
      FoodModel(foodName: "SWEET LASSI", foodCode: '11503', price: 80),
    ],
    "Raita": [
      FoodModel(foodName: "BOONDI RAITA", foodCode: '11509', price: 60),
      FoodModel(foodName: "CURD", foodCode: '11509', price: 50),
      FoodModel(foodName: "VEG RAITA", foodCode: '11510', price: 70),
    ],
    "Extra": [
      FoodModel(foodName: "CHEESE", foodCode: '11485', price: 50),
      FoodModel(foodName: "CHOLE", foodCode: '11499', price: 60),
      FoodModel(foodName: "DAL MAKHANI", foodCode: '11501', price: 40),
      FoodModel(foodName: "RAJMA", foodCode: '11500', price: 60),
    ],
    "Sandwich": [
      FoodModel(foodName: "MASALA SANDWICH", foodCode: '11538', price: 40),
      FoodModel(foodName: "CHOCOLATE SANDWICH", foodCode: '', price: 70),
      FoodModel(foodName: "MAHARAJA SANDWICH", foodCode: '11518', price: 160),
      FoodModel(foodName: "MASALA CHEESE SANDWICH", foodCode: '', price: 140),
      FoodModel(foodName: "PIZZA SANDWICH", foodCode: '11517', price: 150),
      FoodModel(foodName: "TANDOORI PANEER SANDWICH", foodCode: '', price: 100),
      FoodModel(foodName: "VEG CHEESE SANDWICH", foodCode: '', price: 100),
      FoodModel(foodName: "VEG GARLIC SANDWICH", foodCode: '11538', price: 60),
    ],
    "Burger": [
      FoodModel(foodName: "DOUBLE CHEESE BURGER", foodCode: '', price: 100),
      FoodModel(foodName: "PANEER TANDOORI BURGER", foodCode: '', price: 120),
      FoodModel(foodName: "SPECIAL BURGER", foodCode: '11524', price: 120),
      FoodModel(foodName: "VEG BURGER", foodCode: '11520', price: 60),
      FoodModel(foodName: "VEG CHEESE BURGER", foodCode: '', price: 80),
    ],
    "Pizza": [
      FoodModel(foodName: "ITALIAN PIZZA", foodCode: '11526', price: 180),
      FoodModel(foodName: "MARGHERITA PIZZA", foodCode: '11525', price: 150),
      FoodModel(foodName: "MAXICAN PIZZA", foodCode: '11526', price: 180),
      FoodModel(foodName: "SPECIAL PIZZA", foodCode: '11529', price: 180),
      FoodModel(
          foodName: "TANDOORI PANEER PIZZA", foodCode: '11526', price: 200),
    ],
    "Maggi": [
      FoodModel(foodName: "BUTTER CHEESE MAGGI", foodCode: '', price: 120),
      FoodModel(foodName: "BUTTER MAGGI", foodCode: '11531', price: 70),
      FoodModel(foodName: "CHEESE MAGGI", foodCode: '11532', price: 100),
      FoodModel(foodName: "MAGGI", foodCode: '11530', price: 60),
    ],
    "Tea": [
      FoodModel(foodName: "ELAICHI TEA", foodCode: '11542', price: 30),
      FoodModel(foodName: "GINGER PUDINA TEA", foodCode: '11536', price: 40),
      FoodModel(foodName: "REGULAR TEA", foodCode: '11536', price: 30),
      FoodModel(foodName: "SUGAR TEA", foodCode: '11542', price: 30),
    ],
    "Coffee": [
      FoodModel(foodName: "BLACK COFFEE", foodCode: '11540', price: 40),
      FoodModel(foodName: "HOT BLACK COFFEE", foodCode: '11541', price: 40),
    ],
  };

  List<String> foodCategories = [
    "Vadapav",
    "Milk",
    "Kulchas",
    "Papad",
    "Lassi",
    "Raita",
    "Extra",
    "Sandwich",
    "Burger",
    "Pizza",
    "Maggi",
    "Tea",
    "Coffee",
  ];
  late int count = 0;
  List<String> itemName = [
    "CHEESE VADAPAV",
    "MASALA VADAPAV",
    "VADAPAV",
    "AMUL TAZAA",
    "ALLO KULCHA",
    "BUTTER KULCHA",
    "CHEESE CHILLI KULCHA",
    "CHEESE GARLIC KULCHA",
    "CHEESE PANEER KULCHA",
    "CHUR CHUR KULCHA",
    "GARLIC KULCHA",
    "GOBI KULCHA",
    "KULCHA HUB SPECIAL",
    "KULCHA PLATTER",
    "MASALA KULCHA",
    "MIX VEG KULCHA",
    "ONION KULCHA",
    "PANEER CHILLI KULCHA",
    "PANEER GARLIC KULCHA",
    "PANEER KULCHA",
    "CHEESE MASALA PAPAD",
    "FRY PAPAD",
    "MASALA PAPAD",
    "ROASTED PAPAD",
    "CHOCOLATE LASSI",
    "DRY FRUIT LASSI",
    "GHORVU",
    "KULCHA HUB SPECIAL LASSI",
    "ROSE LASSI",
    "SALTED LASSI",
    "SWEET LASSI",
    "BOONDI RAITA",
    "CURD",
    "VEG RAITA",
    "CHEESE",
    "CHOLE",
    "DAL MAKHANI",
    "RAJMA",
    "MASALA SANDWICH",
    "CHOCOLATE SANDWICH",
    "MAHARAJA SANDWICH",
    "MASALA CHEESE SANDWICH",
    "PIZZA SANDWICH",
    "TANDOORI PANEER SANDWICH",
    "VEG CHEESE SANDWICH",
    "VEG GARLIC SANDWICH",
    "DOUBLE CHEESE BURGER",
    "PANEER TANDOORI BURGER",
    "SPECIAL BURGER",
    "VEG BURGER",
    "VEG CHEESE BURGER",
    "ITALIAN PIZZA",
    "MARGHERITA PIZZA",
    "MAXICAN PIZZA",
    "SPECIAL PIZZA",
    "TANDOORI PANEER PIZZA",
    "BUTTER CHEESE MAGGI",
    "BUTTER MAGGI",
    "CHEESE MAGGI",
    "MAGGI",
    "ELAICHI TEA",
    "GINGER PUDINA TEA",
    "REGULAR TEA",
    "SUGAR TEA",
    "BLACK COFFEE",
    "HOT BLACK COFFEE",
  ];

  Map<String, int> itemPrices = {
    "CHEESE VADAPAV": 60,
    "MASALA VADAPAV": 40,
    "VADAPAV": 30,
    "AMUL TAZAA": 25,
    "ALLO KULCHA": 140,
    "BUTTER KULCHA": 130,
    "CHEESE CHILLI KULCHA": 190,
    "CHEESE GARLIC KULCHA": 190,
    "CHEESE PANEER KULCHA": 100,
    "CHUR CHUR  KULCHA": 180,
    "GARLIC KULCHA": 140,
    "GOBI KULCHA": 140,
    "KULCHA HUB  SPECIAL": 250,
    "KULCHA PLATTER": 230,
    "MASALA KULCHA": 130,
    "MIX VEG KULCHA": 150,
    "ONION KULCHA": 140,
    "PANEER CHILLI  KULCHA": 180,
    "PANEER GARLIC KULCHA": 180,
    "PANEER KULCHA": 180,
    "CHEESE MASALA PAPAD": 60,
    "FRY PAPAD": 25,
    "MASALA PAPAD": 40,
    "ROASTED PAPAD": 20,
    "CHOCOLATE LASSI": 100,
    "DRY FRUIT LASSI": 120,
    "GHORVU": 30,
    "KULCHA HUB SPECIAL LASSI": 150,
    "ROSE LASSI": 100,
    "SALTED LASSI": 70,
    "SWEET LASSI": 80,
    "BOONDI RAITA": 60,
    "CURD": 50,
    "VEG RAITA": 70,
    "CHEESE": 50,
    "CHOLE": 60,
    "DAL MAKHANI": 40,
    "RAJMA": 60,
    "MASALA SANDWICH": 40,
    "CHOCOLATE SANDWICH": 70,
    "MAHARAJA SANDWICH": 160,
    "MASALA CHEESE SANDWICH": 140,
    "PIZZA SANDWICH": 150,
    "TANDOORI PANEER SANDWICH": 100,
    "VEG CHEESE SANDWICH": 100,
    "VEG GARLIC SANDWICH": 60,
    "DOUBLE CHEESE BURGER": 100,
    "PANEER TANDOORI BURGER": 120,
    "SPECIAL BURGER": 120,
    "VEG BURGER": 80,
    "VEG CHEESE BURGER": 80,
    "ITALIAN PIZZA": 180,
    "MARGHERITA PIZZA": 150,
    "MAXICAN PIZZA": 180,
    "SPECIAL PIZZA": 180,
    "TANDOORI PANEER PIZZA": 200,
    "BUTTER CHEESE MAGGI": 120,
    "BUTTER MAGGI": 70,
    "CHEESE MAGGI": 100,
    "MAGGI": 60,
    "ELAICHI TEA": 30,
    "GINGER PUDINA TEA": 40,
    "REGULAR TEA": 30,
    "SUGAR TEA": 30,
    "BLACK COFFEE": 40,
    "HOT BLACK COFFEE": 40,
  };
  int currentCategoryIndex = 0;
  int currentFoodIndex = 0;

  // AudioPlayer audioPlayer = AudioPlayer();

  // @override
  // void dispose() {
  //   audioPlayer.dispose();
  //   super.dispose();
  // }

  bool isTapped = false;
  Map<String, int> itemPriceCount = {};
  double totalPrice = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Restaurants',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
        ),
      ),
      body: Container(
        color: white,
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.all(5),
        child: Row(
          children: [
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 1,
              width: MediaQuery.of(context).size.height * 0.12,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: foodCategories.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentCategoryIndex = index;
                        currentFoodIndex = 0;
                      });
                    },
                    child: Row(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.all(5),
                          width: MediaQuery.of(context).size.height * 0.1,
                          height: MediaQuery.of(context).size.height * 0.06,
                          decoration: BoxDecoration(
                            color: currentCategoryIndex == index
                                ? const Color.fromARGB(255, 87, 135, 159)
                                : Colors.blueGrey.shade50,
                            borderRadius: currentCategoryIndex == index
                                ? BorderRadius.circular(17)
                                : BorderRadius.circular(10),
                            border: currentCategoryIndex == index
                                ? Border.all(color: mainAppColor, width: 2)
                                : Border.all(
                                    color: Colors.blueGrey.shade100,
                                    width: 1.6),
                          ),
                          child: Center(
                            child: Text(
                              foodCategories[index],
                              style: TextStyle(
                                fontFamily: "tabfont",
                                // fontSize: 16,
                                color: currentCategoryIndex == index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            /// MAIN BODY
            Expanded(
              child: Container(
                  // height: MediaQuery.of(context).size.height - 40,
                  child: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 20,
                                childAspectRatio: 0.6),
                        itemCount:
                            foodItems[foodCategories[currentCategoryIndex]]
                                    ?.length ??
                                0,
                        itemBuilder: (ctx, index) {
                          String foodName = foodItems[
                                  foodCategories[currentCategoryIndex]]![index]
                              .foodName;
                          String image = foodItemImages[foodName] ?? '';
                          return InkWell(
                            onTap: () {
                              audioPlayer.play(AssetSource('sounds/beep.mp3'));

                              setState(() {
                                String item = foodItems[foodCategories[
                                        currentCategoryIndex]]![index]
                                    .foodName;
                                int prices = foodItems[foodCategories[
                                        currentCategoryIndex]]![index]
                                    .price;
                                tappedItemPrice = prices;
                                tappedItemName = item;
                                isTapped = true;
                                // String item = itemName[index];
                                // int prices;
                                prices = itemPrices[item] ?? 0;
                                tappedItemPrice = itemPrices[item];
                                // tappedItemName = itemName[index];
                                if (itemPriceCount.containsKey(item)) {
                                  int itemCount = itemPriceCount[item] ?? 0;
                                  itemPriceCount[item] = itemCount + 1;
                                  itemPriceCount.forEach((key, value) {
                                    print("Printing again from start");
                                    print("$key and count is $value");
                                    print("it has been done");
                                    print(itemPriceCount);
                                  });
                                } else {
                                  itemPriceCount[item] = 1;
                                }

                                // Call the method to add items to the cart and update the total price
                                // addItemToCart(tappedItemName!, tappedItemPrice!);
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 3, right: 3),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: primaryColor),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12)),
                                  color: Colors.white,
                                ),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Container(
                                          // color: primaryColor,
                                          // height: 120,
                                          // width: 140,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .1,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .4,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(image),
                                              // fit: BoxFit.cover,
                                              // colorFilter: ColorFilter.mode(
                                              //   Colors.black.withOpacity(0.3),
                                              //   BlendMode.darken,
                                              // ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .09,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .3,
                                          child: Column(
                                            children: [
                                              Text(
                                                foodItems[foodCategories[
                                                            currentCategoryIndex]]![
                                                        index]
                                                    .foodName,
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
                                                style: const TextStyle(
                                                  // fontFamily: 'fontmain',
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 1.2,
                                                  fontSize: 13,
                                                ),
                                              ),
                                              Container(
                                                color: white,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .03,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .3,
                                                child: Center(
                                                  child: Text(
                                                    "${foodItems[foodCategories[currentCategoryIndex]]![index].foodCode}",
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: Colors.black,
                                                      fontFamily: "fontmain",
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .03,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .3,
                                          decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 201, 248, 202),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))),
                                          child: const Center(
                                            child: Text(
                                              "ADD",
                                              style: TextStyle(
                                                  fontFamily: 'tabfont',
                                                  color: orange,
                                                  fontSize: 14),
                                            ),
                                          ),
                                        ),
                                      )
                                    ]),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  isTapped ? cartContainer() : const SizedBox(),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }

  Widget cartContainer() => Container(
        height: MediaQuery.of(context).size.height * 0.15,
        width: 278,
        color: primaryColor,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              "${tappedItemName ?? 'N/A'}",
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: white),
                            ),
                          )),
                          Column(
                            children: [
                              Text(
                                "Rs ${tappedItemPrice ?? 0.00}",
                                style: const TextStyle(
                                  color: white,
                                ),
                              ),
                              Container(
                                width: 100,
                                height:
                                    MediaQuery.of(context).size.width * 0.10,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                ),
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
                                        icon: const Icon(Icons.remove),
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
                                            style: const TextStyle(
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

                                          // Implement the logic for increasing the quantity and updating the total price
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
                                        icon: const Icon(Icons.add),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 1,
                          )
                        ],
                      ),
                      // SizedBox(
                      //   height: 11,
                      // ),
                      Container(
                        color: Colors.green.shade700,
                        height: 68,
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
                            )),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PrinterScreen([foodItems])));
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: 10,
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

class FoodModel {
  String foodName;
  String foodCode;
  int price;
  FoodModel({
    required this.foodName,
    required this.foodCode,
    required this.price,
  });
}
