import 'package:flutter/material.dart';
import 'package:mobile_app/core/utils/context_extention.dart';
import 'package:mobile_app/dashboard/modules/Home/view/component/search.dart';
import 'package:mobile_app/utils/colors/colors_constant.dart';
import 'package:mobile_app/widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: [
              Search(),
              SizedBox(
                height: 30,
              ),
              CustomText(
                text: "Categories",
                color: Colors.black,
                fontSize: 20,
              ),
              SizedBox(
                height: 20,
              ),
              ListViewCateg(),
              SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Best Selling",
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  CustomText(
                    text: "See All",
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              ListViewProduct(),
            ],
          ),
        ),
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
                  color: ccolor.gray2,
                ),
                height: 60,
                width: 60,
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Image.asset("assets/images/AirPods-Pro.png"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CustomText(
                text: "AIR",
                fontSize: 20,
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: 10,
        ),
        itemCount: 20,
      ),
    );
  }

  Widget ListViewProduct() {
    return Container(
      height: 350,
      child: ListView.separated(
        //itemCount: names.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: context.width * .4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ccolor.gray2,
                  ),
                  width: context.width * 4,
                  child: Container(
                    height: 180,
                    child: Image.asset(
                      "assets/images/AirPods-Pro.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                CustomText(
                  text: "Soundcore",
                  alignment: Alignment.bottomLeft,
                  fontSize: 20,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: "Life P2i",
                  alignment: Alignment.bottomLeft,
                  fontSize: 15,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: "\$700",
                  alignment: Alignment.bottomRight,
                  fontSize: 18,
                  color: Color.fromARGB(255, 8, 169, 8),
                ),
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
