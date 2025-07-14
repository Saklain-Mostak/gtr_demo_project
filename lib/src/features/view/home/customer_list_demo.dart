import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gtr_task/src/core/api/api_path.dart';
import 'package:gtr_task/src/core/constants/images.dart';
import 'package:gtr_task/src/features/models/customer_model.dart';
import 'package:gtr_task/src/features/view/home/allcustomerlist.dart';
import 'package:gtr_task/src/features/view_models/customer_controller.dart';

class CustomerInfoList extends StatelessWidget {
  CustomerInfoList({super.key});

  final customerController = Get.find<CustomerController>();

  @override
  Widget build(BuildContext context) {
    String getFinalImageUrl(String? imagePath) {
      String baseUrl = ApiPath.imageBaseUrl;

      if (imagePath == null || imagePath.isEmpty) {
        return AppImage.gtr;
      }

      if (imagePath.startsWith("http://") || imagePath.startsWith("https://")) {
        return Uri.encodeFull(imagePath);
      }

      return Uri.encodeFull(
        "$baseUrl${imagePath.startsWith("/") ? "" : "/"}$imagePath",
      );
    }

    final customerList1 = customerController.customerList;
    return Obx(() {
      if (customerController.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }

      if (customerList1.isEmpty) {
        return Center(child: Text("no user${customerController.customerList}"));
      }

      return ListView.builder(
        itemCount: customerList1.length,
        itemBuilder: (_, index) {
          final customer1 = customerList1[index];

          final imageUrl = getFinalImageUrl(customer1.imagePath);

          List<Map<String, String>> mapCustomerToList(CustomerList customer) {
            return [
              {"head": "ID", "item": customer.id.toString()},
              {"head": "Name", "item": customer.name.toString()},
              {"head": "Phone", "item": customer.phone.toString()},
              {"head": "Email", "item": customer.email.toString()},
              {
                "head": "Present Address",
                "item": customer.primaryAddress.toString(),
              },
              {
                "head": "Secondary Address",
                "item": customer.secoundaryAddress.toString(),
              },
            ];
          }

          return SizedBox(
            height: 305.h,
            child: AllCustomerList(
              customerData: mapCustomerToList(customer1),
              imageUrl1: imageUrl,
            ),
          );
        },
      );
    });
  }
}
