// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:gtr_task/src/core/constants/images.dart';
// import 'package:gtr_task/src/features/models/customer_model.dart';
// import 'package:gtr_task/src/features/view/demolist1/allcustomerlist.dart';
// import 'package:gtr_task/src/features/view_models/customer_controller.dart';

// class CustomerListScreenDemo extends StatelessWidget {
//   CustomerListScreenDemo({super.key});

//   final CustomerController customerController = Get.put(CustomerController());

//   String getFinalImageUrl(String? imagePath) {
//     const String baseUrl = "https://www.pqstec.com/InvoiceApps";

//     if (imagePath == null || imagePath.isEmpty) {
//       return AppImage.gtr;
//     }

//     if (imagePath.startsWith("http://") || imagePath.startsWith("https://")) {
//       return Uri.encodeFull(imagePath);
//     }

//     return Uri.encodeFull(
//       "$baseUrl${imagePath.startsWith("/") ? "" : "/"}$imagePath",
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final itenCount =
//         customerController.customerList.length +
//         (customerController.hasMore ? 1 : 0);

//     return Obx(() {
//       if (customerController.isLoading.value &&
//           customerController.customerList.isEmpty) {
//         return Center(
//           child: Padding(
//             padding: EdgeInsets.all(30.w),
//             child: const CircularProgressIndicator(),
//           ),
//         );
//       }

//       return Padding(
//         padding: EdgeInsets.only(top: 9.h, bottom: 9.h),
//         child: ListView.builder(
//           scrollDirection: Axis.vertical,
//           itemCount: itenCount,

//           itemBuilder: (_, index) {
//             final customer1 = customerController.customerList[index];
//             final String imageUrl = getFinalImageUrl(customer1.imagePath);
//             print("qqqqqqqqqqqqqqqqqqqqqqqqqqq$itenCount");

//             // if (index >= customerController.customerList.length) {
//             //   return Center(
//             //     child: Padding(
//             //       padding: EdgeInsets.symmetric(vertical: 20.h),
//             //       child: const CircularProgressIndicator(
//             //         color: Colors.blueAccent,
//             //       ),
//             //     ),
//             //   );
//             // }

//             print("00000000000000000000000000000$imageUrl");

//             List<Map<String, String>> mapCustomerToList(
//               CustomerList customer,
//             ) {
//               return [
//                 {"head": "ID", "item": customer.id.toString()},

//                 {"head": "Name", "item": customer.name.toString()},
//                 {"head": "Email", "item": customer.email.toString()},
//                 {
//                   "head": "Present Address",
//                   "item": customer.primaryAddress.toString(),
//                 },
//                 {
//                   "head": "Secondary Address",
//                   "item": customer.secoundaryAddress.toString(),
//                 },
//               ];
//             }

//             return AllCustomerList(
//               customerData: mapCustomerToList(customer1),
//               imageUrl1: imageUrl,
//             );
//           },
//         ),
//       );
//     });
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/get_instance.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:gtr_task/src/core/constants/images.dart';
// import 'package:gtr_task/src/features/models/customer_model.dart';
// import 'package:gtr_task/src/features/view/demolist1/allcustomerlist.dart';
// import 'package:gtr_task/src/features/view_models/customer_controller.dart';

// class CustomerInfoList extends StatelessWidget {
//    CustomerInfoList({super.key});
// CustomerController customerController=Get.put(CustomerController());
//   @override
//   Widget build(BuildContext context) {

//     return Obx(()=>ListView.builder(
//       itemCount: 3,
//       itemBuilder: (_, index) {

//   final customer1 = customerController.customerList[index];

//         List<Map<String, String>> mapCustomerToList(CustomerList customer) {
//           return [
//             {"head": "ID", "item": customer.id.toString()},

//             {"head": "Name", "item": customer.name.toString()},
//             {"head": "Email", "item": customer.email.toString()},
//             {
//               "head": "Present Address",
//               "item": customer.primaryAddress.toString(),
//             },
//             {
//               "head": "Secondary Address",
//               "item": customer.secoundaryAddress.toString(),
//             },
//           ];
//         }

//         return SizedBox(
//           height: 700.h,
//           child: AllCustomerList(
//             customerData: mapCustomerToList(customer1),
//             imageUrl1: AppImage.gtr,
//           ),
//         );
//       },
//     )

//     );

//   }
// }

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
   // const String baseUrl = "https://www.pqstec.com/InvoiceApps";
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

          final imageUrl=getFinalImageUrl(customer1.imagePath);

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
