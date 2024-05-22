import 'package:mobile_app/dashboard/modules/users/controller/Mobile_cubit.dart';

abstract class ProductState {}

class ProductStateLoading extends ProductState {}

class ProductStateLoaded extends ProductState {}

class ProductStateEmpty extends ProductState {}
