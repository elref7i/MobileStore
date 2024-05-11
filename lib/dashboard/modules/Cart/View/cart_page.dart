import 'package:flutter/material.dart';
import 'package:mobile_app/utils/colors/colors_constant.dart';
import 'package:mobile_app/widgets/custom_button.dart';
import 'package:mobile_app/widgets/custom_text.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      height: 160,
                      child: Row(
                        children: [
                          Container(
                            width: 150,
                            child: Image.asset(
                              "assets/images/Portable.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40, top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  fontSize: 20,
                                  text: "Product One",
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                CustomText(
                                  color: Color.fromARGB(255, 8, 169, 8),
                                  text: "\$200",
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: 120,
                                  color: ccolor.gray2,
                                  height: 40,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.add,
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      CustomText(
                                        text: '1',
                                        alignment: Alignment.center,
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(bottom: 15),
                                        child: Icon(
                                          Icons.minimize,
                                          color: Colors.black,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: 4,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 15,
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Total",
                        fontSize: 22,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomText(
                        text: "\$2000",
                        fontSize: 18,
                        color: Color.fromARGB(255, 8, 169, 8),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add your checkout functionality here
                    },
                    child: CustomText(
                      text: "CheckOut",
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // Change the color here
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
