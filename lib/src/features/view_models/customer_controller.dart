import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:gtr_task/src/features/models/customer_model.dart';
import 'package:gtr_task/src/features/services/customer_api_service.dart';

class CustomerController extends GetxController {


var customerList = <CustomerList>[].obs;
  var pageInfo = PageInfo().obs;
  var lastPage = 1.obs;
  var isLoading = false.obs;
  var isLastPage = false.obs;
  var sortedBy = "Balance".obs;

  @override
  void onInit() {
    fetchCustomers();
    super.onInit();
  }

  Future<void> fetchCustomers() async {
    if (isLoading.value || isLastPage.value) return;

    isLoading.value = true;

    try {
      // final response = await CustomerApiService.fetchcategories(pageNo.value, pageSize.value, sortedBy.value);
      final response = await CustomerApiService.fetchcategories(
        pageInfo.value.pageNo ?? 1,
        pageInfo.value.pageSize ?? 20,
        sortedBy.value,
      );

      if (response.customerList != null) {
        customerList.addAll(response.customerList!);
        final totalPages = response.pageInfo?.pageCount ?? 0;
        if (pageInfo.value.pageNo! >= totalPages) {
          isLastPage.value = true;
        } else {
          pageInfo.value.pageNo = (pageInfo.value.pageNo ?? 0) + 1;
        }
      }
    } catch (e) {
      Future.delayed(Duration(milliseconds: 100), () {
        if (kDebugMode) {
          print("$e");
        }
        CircularProgressIndicator();
      });
    } finally {
      isLoading.value = false;
    }
  }

  
  bool get hasMore {
    final page = pageInfo.value.pageNo;
    final last = lastPage.value;

    // ignore: unnecessary_null_comparison
    if (page != null && last != null) {
      return page <= last;
    } else {
      return false;
    }
  }




                



}
