// import 'package:flutter/material.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// import 'package:pos/view-model/constants/constants.dart';
// import 'package:pos/view/home/productDashBoard.dart';

// class AdminDashboard extends StatefulWidget {
//   const AdminDashboard({super.key});

//   @override
//   State<AdminDashboard> createState() => _AdminDashboardState();
// }

// class _AdminDashboardState extends State<AdminDashboard> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: Text(''),
//           actions: <Widget>[
//             Row(
//               children: [
//                 Container(
//                   height: double.infinity,
//                   width: 60,
//                   decoration: BoxDecoration(
//                     color: Colors.grey.shade500,
//                   ),
//                   child: IconButton(
//                     icon: Icon(MdiIcons.calculator),
//                     onPressed: () {
//                       // Add your search action here
//                     },
//                   ),
//                 ),
//                 Container(
//                   height: double.infinity,
//                   width: 60,
//                   decoration: BoxDecoration(color: Colors.red),
//                   child: IconButton(
//                     icon: Icon(MdiIcons.fire),
//                     onPressed: () {
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (context) => ProductDashBoard(),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 Container(
//                   height: double.infinity,
//                   width: 55,
//                   decoration: BoxDecoration(color: Colors.teal.shade800),
//                   child: IconButton(
//                     icon: Icon(Icons.flag),
//                     onPressed: () {
//                       // Add your search action here
//                     },
//                   ),
//                 ),
//                 Container(
//                   height: double.infinity,
//                   width: 60,
//                   decoration: BoxDecoration(color: Colors.teal.shade300),
//                   child: IconButton(
//                     icon: Icon(Icons.restaurant),
//                     onPressed: () {
//                       // Add your notifications action here
//                     },
//                   ),
//                 ),
//                 Container(
//                   height: double.infinity,
//                   width: 60,
//                   // width: MediaQuery.of(context).size.width * 0.1,
//                   decoration: BoxDecoration(color: Colors.teal),
//                   child: IconButton(
//                     icon: Icon(Icons.search),
//                     onPressed: () {
//                       // Add your settings action here
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ],
//           backgroundColor: primaryColor),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(
//               decoration: BoxDecoration(color: primaryColor),
//               child: Text(
//                 'InvoicePro',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                 ),
//               ),
//             ),
//             ListTile(
//               leading: Icon(
//                 Icons.calendar_month,
//                 color: primaryColor,
//               ),
//               title: Text('Upcoming order'),
//               onTap: () {
//                 // Add your navigation logic here
//               },
//             ),
//             ListTile(
//               leading: Icon(
//                 Icons.more_vert,
//                 color: primaryColor,
//               ),
//               title: Text('Reports'),
//               onTap: () {
//                 // Add your navigation logic here
//               },
//             ),
//             ListTile(
//               leading: Icon(
//                 MdiIcons.currencyRupee,
//                 color: primaryColor,
//               ),
//               title: Text('Customer credits'),
//               onTap: () {
//                 // Add your navigation logic here
//               },
//             ),
//             ListTile(
//               leading: Icon(
//                 Icons.sync,
//                 color: primaryColor,
//               ),
//               title: Text('Sync Data'),
//               onTap: () {
//                 // Add your navigation logic here
//               },
//             ),
//             Divider(
//               color: Colors.grey.shade400,
//               thickness: 1,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 20),
//               child: Text(
//                 'Setting',
//                 style: TextStyle(fontSize: 17, color: Colors.grey.shade700),
//               ),
//             ),
//             ListTile(
//               leading: Icon(
//                 Icons.settings,
//                 color: primaryColor,
//               ),
//               title: Text('Master setting'),
//               onTap: () {
//                 // Add your navigation logic here
//               },
//             ),
//             ListTile(
//               leading: Icon(
//                 MdiIcons.printer,
//                 color: primaryColor,
//               ),
//               title: Text('Printer setting'),
//               onTap: () {
//                 // Add your navigation logic here
//               },
//             ),
//             ListTile(
//               leading: Icon(
//                 MdiIcons.receiptTextEdit,
//                 color: primaryColor,
//               ),
//               title: Text('Bill setting'),
//               onTap: () {
//                 // Add your navigation logic here
//               },
//             ),
//             ListTile(
//               leading: Icon(
//                 MdiIcons.account,
//                 color: primaryColor,
//               ),
//               title: Text('Account setting'),
//               onTap: () {
//                 // Add your navigation logic here
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Center(child: Text('HOME')),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:pos/view/home/productDashBoard.dart';
import 'package:pos/view/tab_screen/calculator_screen.dart';
import 'package:pos/view/tab_screen/ProfileScreen.dart';
import 'package:pos/view/tab_screen/restaurant_screen.dart';
import 'package:pos/view/tab_screen/view-model/constants/constants.dart';
import 'package:pos/view/tab_screen/cstmUserScreen.dart';

// class MainScreen extends StatefulWidget {
//   late AnimationController resizableController;
// //  const MainScreen({super.key});
//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }
class AdminDashboard extends StatefulWidget {
  late AnimationController resizableController;
  final String Uid;
  AdminDashboard({required this.Uid, super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int currentIndex = 0;
  List<Widget> pageview = [];

  @override
  void initState() {
    super.initState();
    pageview = [
      PLUCalculatorScreen(
        phoneNumber: widget.Uid,
      ),
      ProductDashBoard(),
      RestaurantScreen(),
      CstmUserScreen(uid: widget.Uid),
    ];
  } //why widget is giving error

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageview[currentIndex],
      bottomNavigationBar: Container(
        height: 55,
        width: 20,
        color: Colors.white,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Expanded(
              child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              setState(
                () {
                  currentIndex = 0;
                },
              );
            },
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedContainer(
                    duration: Duration(seconds: 1),
                    curve: Curves.bounceOut,
                    width: currentIndex == 0 ? 25 : 0,
                    height: 4,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Icon(
                    listOfIcons[0],
                    size: 22,
                    color: currentIndex == 0 ? primaryColor : Colors.black38,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ]),
          )),
          Expanded(
              child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              setState(
                () {
                  currentIndex = 1;
                },
              );
            },
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedContainer(
                    duration: Duration(seconds: 1),
                    curve: Curves.bounceOut,
                    width: currentIndex == 1 ? 25 : 0,
                    height: 4,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Icon(
                    listOfIcons[1],
                    size: 22,
                    color: currentIndex == 1 ? primaryColor : Colors.black38,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ]),
          )),
          Expanded(
              child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              setState(
                () {
                  currentIndex = 2;
                },
              );
            },
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedContainer(
                    duration: Duration(seconds: 1),
                    curve: Curves.bounceOut,
                    width: currentIndex == 2 ? 25 : 0,
                    height: 4,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Icon(
                    listOfIcons[2],
                    size: 22,
                    color: currentIndex == 2 ? primaryColor : Colors.black38,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ]),
          )),
          Expanded(
              child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              setState(
                () {
                  currentIndex = 3;
                },
              );
            },
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedContainer(
                    duration: Duration(seconds: 1),
                    curve: Curves.bounceOut,
                    width: currentIndex == 3 ? 25 : 0,
                    height: 4,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Icon(
                    listOfIcons[3],
                    size: 22,
                    color: currentIndex == 3 ? primaryColor : Colors.black38,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ]),
          ))
        ]),
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.calculate,
    Icons.local_fire_department,
    Icons.restaurant,
    Icons.account_circle_outlined,
  ];
}
