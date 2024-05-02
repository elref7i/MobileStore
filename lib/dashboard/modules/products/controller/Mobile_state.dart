part of 'Mobile_cubit.dart';

@immutable
sealed class MobilePhonesState {}

final class MobilePhonesLoading extends MobilePhonesState {}

final class MobilePhonesLoaded extends MobilePhonesState {}

final class MobilePhonesEmpty extends MobilePhonesState {}
