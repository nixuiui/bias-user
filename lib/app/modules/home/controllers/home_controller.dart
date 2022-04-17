import 'package:bias_user/services/auth_service.dart';
import 'package:get/get.dart';
import 'package:bias_user/app/models/order.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:bias_user/app/modules/home/repositories/home_repository.dart';
import 'package:bias_user/app/modules/home/repositories/order_repository.dart';
class HomeController extends GetxController {
  static HomeController get to => Get.find();

  final _homeRepository = HomeRepository();
  final user = AuthService.to.user;

  final version = ''.obs;
  final _orderRepository = OrderRepository();

  var page = 1;
  var limit = 20;
  var scrollThreshold = 200.0;
  var hasReachedMax = false;
  var isLoading = RxBool(false);
  final scrollController = ScrollController();

  final dataList = Rx<List<Order>>([]);
  @override
  void onInit() async {
    scrollController.addListener(_onScroll);
    await loadData();
    super.onInit();
  }

  void _onScroll() async {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    loadDataList(
      loadMore: true, 
      maxScroll: maxScroll, 
      currentScroll: currentScroll
    );
  }
  

  init() async {
    page = 1;
    await loadData();
    var packageInfo = await PackageInfo.fromPlatform();
    version.value = packageInfo.version;
    await Future.delayed(Duration(seconds: 2));
  }

  Future<void> onRefresh() async {
    await loadUser();
    page = 1;
    await loadData();
  }

  Future loadUser() async {
    try {
      user.value = await _homeRepository.getProfile();
    } catch (e) {
      print('error: $e');
    }
  }
  
  loadDataList({
    bool refresh = false,
    bool loadMore = false,
    double maxScroll = 0,
    double currentScroll = 0,
  }) async {
    if(refresh) {
      hasReachedMax = false;
      await loadData();
    } else if(loadMore) {
      if (
        (maxScroll - currentScroll) <= scrollThreshold && 
        !hasReachedMax && 
        !isLoading.value
      ) {
        isLoading.value = false;
        await loadData();
      }
    }
  }

  loadData() async {
    isLoading.value = true;
    try {
      if(page == 1) {
      }
      var currentData = dataList.value.map(
        (e) => Order.fromJson(e.toJson())
      ).toList();
      final response = await _orderRepository.getList(
        page: page, 
        limit: limit, 
      );
      
      if(page == 1) {
        dataList.value = response ?? [];
      } else {
        currentData.addAll(response ?? []);
        dataList.value = currentData;
      }
      updatePage();
    } catch (err) {
      Get.snackbar('Error', '$err');
    }
    isLoading.value = false;
  }

  void updatePage() {
    var length = dataList.value.length;
    if(length%limit > 0) {
      hasReachedMax = true;
    } else {
      page = (length/limit).ceil() + 1;
    }
  }

}

