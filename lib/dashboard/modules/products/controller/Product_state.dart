part of 'Product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductStateLoading extends ProductState {}

final class ProductStateLoaded extends ProductState {}

final class ProductStateEmpty extends ProductState {}
