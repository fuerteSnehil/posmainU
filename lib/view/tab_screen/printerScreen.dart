import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pos/view/tab_screen/view-model/constants/constants.dart';
import 'package:pos/view/tab_screen/view-model/widgets/inception_component/starDivider.dart';

class PrinterScreen extends StatefulWidget {
  final List<Map<String, dynamic>> data;
  PrinterScreen(this.data);

  @override
  State<PrinterScreen> createState() => _PrinterScreenState();
}

class _PrinterScreenState extends State<PrinterScreen> {
  String date = DateFormat("yyyy-MM-dd").format(DateTime.now());
  int subTotal = 0;

  @override
  void initState() {
    super.initState();
    calculateSubTotal();
  }

  void calculateSubTotal() {
    subTotal = 0;
    for (var item in widget.data) {
      subTotal += (item['totalPrice'] as int); // Explicitly cast to int
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        // title: Text(
        //   'Galaxy',
        //   style: TextStyle(
        //     fontFamily: "tabfont",
        //   ),
        // ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                color: white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              'SHOP NAME',
                              style: TextStyle(
                                  fontFamily: "tabfont",
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.4),
                            ),
                          ),
                          Text('Address: Gurugram, Haryana , ${date}'),
                          Text('Telp: +91 6123456789'),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .03,
                          ),
                          Text(
                            '* * * * * * * * * * * * * * * * * * * * * * * *',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black54),
                          ),
                          Text(
                            'RECEIPT',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1.5),
                          ),
                          Text(
                            '* * * * * * * * * * * * * * * * * * * * * * * *',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black54),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .01,
                          ),
                        ],
                      ),
                      // Headers for Item Name, Quantity, and Individual Price
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              'Item Name',
                              style: TextStyle(
                                fontFamily: "tabfont",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Quantity',
                              style: TextStyle(
                                fontFamily: "tabfont",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 40),
                            child: Expanded(
                              flex: 1,
                              child: Text(
                                'Price',
                                style: TextStyle(
                                  fontFamily: "tabfont",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      // Dynamically generated list of items
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: widget.data.map((item) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(flex: 3, child: Text(item['name'])),
                                Expanded(
                                    flex: 1,
                                    child: Text('${item['quantity']}')),
                                Expanded(
                                    flex: 1,
                                    child: Text('₹${item['individualPrice']}')),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .01,
                      ),
                      Center(
                        child: Text(
                          '* * * * * * * * * * * * * * * * * * * * * * * *',
                          style: TextStyle(fontSize: 20, color: Colors.black54),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5),
                          ),
                          Text(
                            '₹$subTotal', // Display the calculated sub-total
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
                    Icon(
                      MdiIcons.printer,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .02,
                    ),
                    Text(
                      'Print Receipt',
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ],
                ),
                onPressed: () async {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
