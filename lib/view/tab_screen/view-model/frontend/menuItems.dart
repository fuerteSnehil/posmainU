import 'package:flutter/material.dart';
import 'package:pos/view/tab_screen/view-model/constants/constants.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.context,
    required this.imagePath,
    required this.text,
  });

  final BuildContext context;
  final String imagePath;
  final String text;

  @override
  Widget build(BuildContext context) => Container(
        // width: MediaQuery.of(context).size.width * .30,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 3, right: 3),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: primaryColor),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      color: Colors.white,
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height * .1,
                              width: MediaQuery.of(context).size.width * .4,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(imagePath),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              height: MediaQuery.of(context).size.height * .04,
                              width: MediaQuery.of(context).size.width * .3,
                              child: Text(
                                text,
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
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 5, right: 5, bottom: 1),
                            child: Container(
                              height: MediaQuery.of(context).size.height * .03,
                              width: MediaQuery.of(context).size.width * .3,
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 201, 248, 202),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
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
              ),

              // Stack(
              //   children: [
              //     Container(
              //         height: MediaQuery.of(context).size.height * 0.15,
              //         width: MediaQuery.of(context).size.width * 0.28,
              //         decoration: BoxDecoration(
              //           shape: BoxShape.circle,
              //           image: DecorationImage(
              //             image: AssetImage(imagePath),
              //             fit: BoxFit.cover,
              //             colorFilter: ColorFilter.mode(
              //               Colors.black.withOpacity(0.2),
              //               BlendMode.darken,
              //             ),
              //           ),
              //         )),
              //     Positioned(
              //       bottom: 0,
              //       left: 0,
              //       right: 0,
              //       child: Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 3),
              //         child: Container(
              //           height: MediaQuery.of(context).size.height * 0.055,
              //           width: MediaQuery.of(context).size.width * 0.070,
              //           decoration: BoxDecoration(
              //             gradient: LinearGradient(
              //               colors: [
              //                 Colors.transparent,
              //                 Colors.blueGrey.shade200,
              //               ],
              //               begin: Alignment.topCenter,
              //               end: Alignment.bottomCenter,
              //             ),
              //             borderRadius: const BorderRadius.only(
              //               topLeft: Radius.circular(14),
              //               topRight: Radius.circular(14),
              //             ),
              //             border: const Border(
              //               top: BorderSide(
              //                 color: primaryColor,
              //                 width: 1.6,
              //               ),
              //               // left: BorderSide(
              //               //   color: primaryColor,
              //               //   width: 1.6,
              //               // ),
              //               // right: BorderSide(
              //               //   color: primaryColor,
              //               //   width: 1.6,
              //               // ),
              //             ),
              //           ),
              //           child: Center(
              //             child: Text(
              //               text,
              //               maxLines: 2,
              //               textAlign: TextAlign.center,
              //               style: const TextStyle(
              //                 fontSize: 13,
              //                 color: white,
              //                 fontWeight: FontWeight.w700,
              //                 overflow: TextOverflow.visible,
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //     )
              //   ],
              // ),
            )
          ],
        ),
      );
}
