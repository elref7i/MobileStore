import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mobile_app/core/utils/context_extention.dart';
import 'package:mobile_app/dashboard/modules/Home/view/component/search.dart';
import 'package:mobile_app/utils/colors/colors_constant.dart';
import 'package:mobile_app/utils/colors/custom_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Search(),
              SizedBox(height: 20),
              buildCarouselSlider(),
              SizedBox(height: 30),
              CustomText(
                text: "Categories",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 20),
              ListViewCateg(),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Best Selling",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    text: "See All",
                    fontSize: 18,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              SizedBox(height: 30),
              ListViewProduct(screenWidth: screenWidth),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCarouselSlider() {
    final List<String> imgList = [
      'assets/images/mobile3.png',
      'assets/images/mobile1.png',
      'assets/images/OppoReno.png',
      'assets/images/mobile2.png',
      'assets/images/Beats.png',
      'assets/images/mobile4.png',
      'assets/images/mobile5.png',
      'assets/images/mobile6.png',
      'assets/images/mobile7.png',
      'assets/images/mobile8.png',
      'assets/images/mobile9.png',
    ];

    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        viewportFraction: 1.0,
      ),
      items: imgList
          .map((item) => Container(
                child: Center(
                  child: Image.asset(
                    item,
                    fit: BoxFit.contain,
                    width: 1000,
                  ),
                ),
              ))
          .toList(),
    );
  }

  Widget ListViewCateg() {
    return Container(
      height: 100,
      child: ListView.separated(
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
              SizedBox(height: 10),
              CustomText(
                text: "AIR",
                fontSize: 20,
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 10),
        itemCount: 20,
      ),
    );
  }

  Widget ListViewProduct({required double screenWidth}) {
    return Container(
      height: 250,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: screenWidth * .4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Image.asset(
                    "assets/images/AirPods-Pro.png",
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CustomText(
                    text: "Soundcore",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CustomText(
                    text: "Life P2i",
                    fontSize: 15,
                    color: Colors.grey[700]!,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CustomText(
                    text: "\$700",
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 20),
        itemCount: 3,
      ),
    );
  }
}
