import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/dashboard/modules/users/controller/Mobile_cubit.dart';
import 'package:mobile_app/dashboard/modules/users/view/components/Product_widget.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MobileCubit(),
      child: BlocBuilder<MobileCubit, MobilePhonesState>(
        builder: (context, state) {
          final MobileCubit controller = context.read<MobileCubit>();
          return Scaffold(
            body: state is MobilePhonesLoading
                ? const CircularProgressIndicator()
                : state is MobilePhonesEmpty
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
                        // separatorBuilder: (_, int index) => const Divider(
                        //       height: 1,
                        //       thickness: 5,
                        //     ),
                        itemCount: controller.MobilePhones.length,
                        itemBuilder: (_, int index) {
                          return ProductItemWidget(
                              mobilePhones: controller.MobilePhones[index]);
                        }),
          );
        },
      ),
    );
  }
}
