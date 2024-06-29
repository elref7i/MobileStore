import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/dashboard/modules/Cart/Controller/cart_cubit.dart';
import 'package:mobile_app/dashboard/modules/Cart/Controller/cart_state.dart';
import 'package:mobile_app/dashboard/modules/Cart/View/constantCart.dart';
import 'package:mobile_app/dashboard/modules/users/controller/Mobile_cubit.dart';
import 'package:mobile_app/dashboard/modules/users/model/Entity_model/Product_model.dart';

class ProductItemWidget extends StatelessWidget {
  final ProductModel productModel;
  final ProductCubit controller;
  final List<ProductModel> products;

  ProductItemWidget({
    Key? key,
    required this.productModel,
    required this.controller,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, cartState) {
          final cartCubit = context.read<CartCubit>();

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
                    // Product information
                    Row(
                      children: [
                        if (productModel.image.isNotEmpty)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.asset(
                              productModel.image,
                              height: 150,
                              width: 100,
                              fit: BoxFit.fitWidth,
                            ),
                          )
                        else
                          Image.asset(
                            "assets/phone-image/samsungZfold.jpg",
                            height: 130,
                            width: 100,
                            fit: BoxFit.fill,
                          ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productModel.brand ?? '',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            Text(
                              productModel.model ?? '',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            Text(
                              productModel.availabilityState?.toString() ?? '',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(thickness: 0.5),
                    // Actions
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Favorite
                        InkWell(
                          child: Icon(
                            productModel.favorite == 1
                                ? CupertinoIcons.heart_fill
                                : CupertinoIcons.heart,
                            color: Colors.red,
                            size: 35,
                          ),
                          onTap: () {
                            final newState = productModel.favorite == 1 ? 0 : 1;
                            controller.addToFavourite(
                                productModel.id, newState);
                          },
                        ),
                        // Separator
                        Container(
                          height: 30,
                          width: 0.5,
                          color: Colors.grey,
                        ),
                        // Cart
                        InkWell(
                          child: Icon(
                            productModel.cart == 1
                                ? CupertinoIcons.cart_fill
                                : CupertinoIcons.cart,
                            color: Colors.blue,
                            size: 35,
                          ),
                          onTap: () {
                            if (productModel.cart == 1) {
                              controller.addToCart(productModel.id, 0);
                              cartCubit.removeItem(productModel.id);
                              my_cart.removeWhere(
                                  (element) => element.id == productModel.id);
                              log("deleted with id ${productModel.id}");
                            } else {
                              controller.addToCart(productModel.id, 1);
                              cartCubit.saveData(products, productModel.id - 1);
                              my_cart.add(productModel);
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
