import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/dashboard/modules/products/controller/Product_cubit.dart';
import 'package:mobile_app/dashboard/modules/products/view/components/Product_widget.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(),
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          final ProductCubit controller = context.read<ProductCubit>();
          return Scaffold(
            body: state is ProductStateLoading
                ? const CircularProgressIndicator()
                : state is ProductStateEmpty
                    ? const Center(
                        child: Icon(
                        CupertinoIcons.delete,
                        size: 100,
                        color: Color.fromARGB(255, 193, 18, 18),
                      ))
                    : GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                        itemCount: controller.products.length,
                        itemBuilder: (_, int index) {
                          return ProductItemWidget(
                              mobilePhones: controller.products[index]);
                        }),
          );
        },
      ),
    );
  }
}
