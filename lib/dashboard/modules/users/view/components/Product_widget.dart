import 'package:flutter/material.dart';
import 'package:mobile_app/dashboard/modules/users/model/Entity_model/Product_model.dart';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import '../../../products/controller/Product_cubit.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({
    super.key,
    required this.productModel,
    required this.controller,
  });
  final ProductModel productModel;
  final ProductCubit controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey, width: 0.5),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ///product info
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.memory(
                      (productModel.Image ?? Uint8List(10)),
                      height: 50,
                      width: 50,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productModel.Brand ?? 'Samsung Galaxy',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        productModel.Model ?? 'S Series',
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Text(
                        (productModel.AvailabilityState ?? 0).toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Divider(
                thickness: 0.5,
              ),

              ///actions
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ///like
                  InkWell(
                    child: productModel.Favorite == 1
                        ? const Icon(
                            CupertinoIcons.heart_fill,
                            color: Colors.red,
                          )
                        : const Icon(
                            CupertinoIcons.heart,
                            color: Colors.red,
                          ),
                    onTap: () {
                      if (productModel.Favorite == 1) {
                        controller.addToFavourite(productModel.Id ?? 0, false);
                      } else {
                        controller.addToFavourite(productModel.Id ?? 0, true);
                      }
                    },
                  ),

                  ///divider
                  Container(
                    height: 30,
                    width: 0.5,
                    color: Colors.grey,
                  ),

                  ///cart
                  InkWell(
                    child: productModel.Cart == true
                        ? const Icon(
                            CupertinoIcons.cart,
                            color: Colors.blue,
                          )
                        : const Icon(
                            CupertinoIcons.cart,
                            color: Colors.blue,
                          ),
                    onTap: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
