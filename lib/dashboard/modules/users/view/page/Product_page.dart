import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/dashboard/modules/users/controller/Mobile_cubit.dart';
import 'package:mobile_app/dashboard/modules/users/controller/Mobile_state.dart';
import 'package:mobile_app/dashboard/modules/users/view/components/Product_widget.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: ProductCubit.instance,
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          final ProductCubit controller = context.read<ProductCubit>();
          return Scaffold(
            body: state is ProductStateLoading
                ? const Center(child: CircularProgressIndicator())
                : state is ProductStateEmpty
                    ? const Center(
                        child: Icon(
                          CupertinoIcons.delete,
                          size: 100,
                          color: Colors.blue,
                        ),
                      )
                    : ListView.builder(
                        itemBuilder: (_, int index) => ProductItemWidget(
                          productModel: controller.products[index],
                          controller: controller,
                          products: controller.products,
                        ),
                        itemCount: controller.products.length,
                      ),
          );
        },
      ),
    );
  }
}
