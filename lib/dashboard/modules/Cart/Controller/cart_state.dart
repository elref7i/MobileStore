import 'package:flutter/material.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}
