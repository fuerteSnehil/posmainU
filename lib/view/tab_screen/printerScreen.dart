import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pos/view/tab_screen/view-model/constants/constants.dart';

class PrinterScreen extends StatefulWidget {
  final List<Map<String, dynamic>> data;
  PrinterScreen(this.data);

  @override
  State<PrinterScreen> createState() => _PrinterScreenState();
}

class _PrinterScreenState extends State<PrinterScreen> {
  BluetoothPrint bluetoothPrint = BluetoothPrint.instance;
  List<BluetoothDevice> devices = [];
  String deviceMsg = '';
  final f = NumberFormat("\$###,###.00", "en_US");
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => {initPrinter()});
    // TODO: implement initState
    super.initState();
  }

  Future<void> initPrinter() async {
    bluetoothPrint.startScan(timeout: Duration(seconds: 2));
    if (!mounted) return;
    bluetoothPrint.scanResults.listen((val) {
      if (!mounted) return;
      setState(() {
        devices = val;
      });
      if (devices.isEmpty) {
        deviceMsg = "Device not found";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Select Printer',
          ),
          backgroundColor: Colors.blueGrey.shade50,
        ),
        body: devices.isEmpty
            ? Center(
                child: Text(deviceMsg),
              )
            : Expanded(
                child: ListView.builder(
                    itemCount: devices.length,
                    itemBuilder: (c, i) {
                      return ListTile(
                        leading: Icon(
                          MdiIcons.printer,
                          color: primaryColor,
                        ),
                        title: Text(devices[i].name ?? ""),
                        subtitle: Text(devices[i].address ?? ""),
                        onTap: () {
                          startPrint(devices[i]);
                        },
                      );
                    }),
              ));
  }

  Future<void> startPrint(BluetoothDevice device) async {
    if (device != null && device.address != null) {
      await bluetoothPrint.connect(device);
      Map<String, dynamic> config = Map();
      List<LineText> list = [];
      list.add(LineText(
        type: LineText.TYPE_TEXT,
        content: "Restaurant Name",
        weight: 2,
        width: 2,
        height: 2,
        align: LineText.ALIGN_CENTER,
        linefeed: 1,
      ));

      for (var i = 0; i < widget.data.length; i++) {
        if (i < widget.data.length) {
          list.add(LineText(
            type: LineText.TYPE_TEXT,
            content: widget.data[i]['title'] ?? "",
            weight: 0,
            align: LineText.ALIGN_LEFT,
            linefeed: 1,
          ));
          list.add(LineText(
            type: LineText.TYPE_TEXT,
            content: "${f.format(widget.data[i]['price'] ?? 0)}",
            align: LineText.ALIGN_LEFT,
            linefeed: 1,
          ));
        }
      }
    }
  }
}
