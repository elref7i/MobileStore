import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_app/core/cubit/parent_cubit.dart';
import 'package:mobile_app/dashboard/modules/Cart/Controller/cart_cubit.dart';
import 'package:mobile_app/dashboard/modules/Cart/Controller/cart_state.dart';
import 'package:mobile_app/dashboard/modules/Cart/Model/cart_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/dashboard/modules/Cart/View/constantCart.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getData(),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: _buildCartList(state.cart),
                ),
              ],
            ),
            bottomNavigationBar: InkWell(
              onTap: () {
                Fluttertoast.showToast(
                  msg: "Payment Successful",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 2,
                  backgroundColor: Color.fromARGB(255, 26, 63, 144),
                  textColor: Colors.black,
                  fontSize: 16.0,
                );
              },
              child: Container(
                // color: Color.fromARGB(255, 45, 93, 171),
                alignment: Alignment.center,
                height: 50.0,
                child: const Text(
                  '',
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCartList(List<Cart> cart) {
    if (cart.isEmpty) {
      return Center(
        child: BlocProvider(
          create: (context) => ParentCubit(),
          child: BlocBuilder<ParentCubit, ParentState>(
            builder: (context, state) {
              return Text(
                'Your Favourite is Empty',
                style: Theme.of(context).textTheme.bodyLarge,
              );
            },
          ),
        ),
      );
    } else {
      return my_cart.isEmpty
          ? Center(
              child: Text("NO items Found"),
            )
          : ListView.builder(
              shrinkWrap: true,
              itemCount: my_cart.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.blueGrey.shade200,
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          my_cart[index].image.toString(),
                          height: 150,
                          width: 80,
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                text: TextSpan(
                                  style:
                                      Theme.of(context).textTheme.bodyLarge ??
                                          TextStyle(
                                            color: Colors.blueGrey.shade800,
                                            fontSize: 16.0,
                                          ),
                                  children: [
                                    TextSpan(
                                      text: '${my_cart[index].brand}\n',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                text: TextSpan(
                                  text: 'Price: ' r"$",
                                  style: TextStyle(
                                    color: Colors.blueGrey.shade800,
                                    fontSize: 16.0,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '${my_cart[index].price}\n',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        BlocListener<CartCubit, CartState>(
                          listener: (context, state) {},
                          child: Builder(
                            builder: (context) {
                              return PlusMinusButtons(
                                addQuantity: () {
                                  context
                                      .read<CartCubit>()
                                      .addQuantity(cart[index].id!);
                                },
                                deleteQuantity: () {
                                  context
                                      .read<CartCubit>()
                                      .deleteQuantity(cart[index].id!);
                                },
                                text: cart[index].quantity.toString(),
                              );
                            },
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            my_cart.remove(my_cart[index]);
                            // context.read<CartCubit>().removeItem(my_cart[index].id!);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Color.fromARGB(255, 32, 77, 155),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
    }
  }
}

class PlusMinusButtons extends StatelessWidget {
  final VoidCallback deleteQuantity;
  final VoidCallback addQuantity;
  final String text;
  const PlusMinusButtons({
    Key? key,
    required this.addQuantity,
    required this.deleteQuantity,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: deleteQuantity, icon: const Icon(Icons.remove)),
        Text(text),
        IconButton(onPressed: addQuantity, icon: const Icon(Icons.add)),
      ],
    );
  }
}

class ReusableWidget extends StatelessWidget {
  final String title, value;
  const ReusableWidget({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            value.toString(),
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
