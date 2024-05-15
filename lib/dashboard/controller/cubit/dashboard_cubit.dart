import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'dashboard_state.dart';

class DashboardController extends Cubit<DashboardState> {
  DashboardController() : super(DashboardChangeState());
  int selectedTapIndex = 0;
  final PageController pageController = PageController();
  void onChangeTabIndex(int idx) {
    selectedTapIndex = idx;
    pageController.jumpToPage(selectedTapIndex);
    emit(DashboardChangeState());
  }
}
