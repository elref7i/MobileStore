import 'package:flutter/material.dart';
import 'package:mobile_app/core/utils/context_extention.dart';
import 'package:mobile_app/dashboard/modules/Home/view/component/search.dart';
import 'package:mobile_app/utils/colors/colors_constant.dart';
import 'package:mobile_app/widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  //   final List<String> names = <String>[
  //   'men',
  //   's',
  //   's',
  //   's',
  //   's',
  //   's',
  //   's',
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 10, left: 20, right: 20),
        child: Column(
          children: [
            Search(),
            SizedBox(
              height: 50,
            ),
            CustomText(
              text: "Categories",
            ),
            SizedBox(
              height: 20,
            ),
            ListViewCateg(),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "Best Selling",
                  fontSize: 18,
                ),
                CustomText(
                  text: "See All",
                  fontSize: 18,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ListViewProduct(),
          ],
        ),
        // Row(
        //   children: [],
        // ),
      ),
    );
  }



  Widget ListViewCateg() {
    return Container(
      height: 100,
      child: ListView.separated(
        //itemCount: names.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey.shade100,
                ),
                height: 60,
                width: 60,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/images/AirPods-Pro.png"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomText(
                text: "Categories",
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: 20,
        ),
        itemCount: 3,
      ),
    );
  }

  Widget ListViewProduct() {
    return Container(
      height: 200,
      child: ListView.separated(
        //itemCount: names.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: context.width * .4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color.fromARGB(255, 193, 193, 193)),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.shade100,
                  ),
                  width: context.width * .4,
                  child: Container(
                      height: 130,
                      child: Image.asset("assets/images/AirPods-Pro.png",fit: BoxFit.fill,),),
                ),
                SizedBox(
                  height: 5,
                ),
                CustomText(
                  text: "product1",
                  alignment: Alignment.bottomLeft,
                  fontSize: 20,
                ),
                SizedBox(
                  height: 5,
                ),
                CustomText(
                  text: "product1",
                  alignment: Alignment.bottomLeft,
                  fontSize: 15,
                ),
                SizedBox(
                  height: 5,
                ),
                CustomText(
                  text: "price",
                  alignment: Alignment.bottomLeft,
                  fontSize: 15,
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: 20,
        ),
        itemCount: 3,
      ),
    );
  }
}
