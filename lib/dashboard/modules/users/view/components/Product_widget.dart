import 'package:flutter/material.dart';
import 'package:mobile_app/dashboard/modules/Cart/Controller/cart_cubit.dart';
import 'package:mobile_app/dashboard/modules/users/model/Entity_model/Product_model.dart';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import '../../../products/controller/Product_cubit.dart';

class ProductItemWidget extends StatelessWidget {
  ProductItemWidget(
      {super.key,
      required this.productModel,
      required this.controller,
      required this.products});
  final ProductModel productModel;
  final ProductCubit controller;
  final List<ProductModel> products;
  final CartCubit controllerCart = CartCubit();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ///product info
              Row(
                children: [
                  if (productModel.Image != null &&
                      (productModel.Image!.isNotEmpty) &&
                      (productModel.Image!.length > 10))
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.memory(
                        (productModel.Image ?? Uint8List(10)),
                        height: 150,
                        width: 150,
                        fit: BoxFit.fill,
                      ),
                    )
                  else
                    Image.asset("assets/phone-image/samsungZfold.jpg",
                        height: 130, width: 100, fit: BoxFit.fill),
                  const SizedBox(
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
                            size: 35,
                          )
                        : const Icon(
                            CupertinoIcons.heart,
                            color: Colors.red,
                            size: 35,
                          ),
                    onTap: () {
                      ////// solve ya omar
                      if (productModel.Favorite == 1) {
                        controller.addToFavourite(productModel.Id ?? 1, 0);
                        // controllerCart.saveData(
                        //     products, productModel.Id! - 1 ?? 0);
                      } else {
                        controller.addToFavourite(productModel.Id ?? 1, 1);
                        // controllerCart.saveData(
                        //     products, productModel.Id! - 1 ?? 0);
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
                    child: productModel.Cart == 1
                        ? const Icon(
                            CupertinoIcons.cart_fill,
                            color: Colors.blue,
                            size: 35,
                          )
                        : const Icon(
                            CupertinoIcons.cart,
                            color: Colors.blue,
                            size: 35,
                          ),
                    onTap: () {
                      if (productModel.Cart == 1) {
                        controller.addToCart(productModel.Id ?? 1, 0);
                        controllerCart.saveData(
                            products, productModel.Id! - 1 ?? 0);
                      } else {
                        controller.addToCart(productModel.Id ?? 1, 1);
                        controllerCart.saveData(
                            products, productModel.Id! - 1 ?? 0);
                      }
                    },
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
