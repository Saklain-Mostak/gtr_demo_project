import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gtr_task/src/shared/functions/item_all_customer.dart';
import 'package:gtr_task/src/shared/functions/linedraw.dart';

class AllCustomerList extends StatelessWidget {
  final List<Map<String, String>> customerData;
  final String imageUrl1;
  const AllCustomerList({
    super.key,
    required this.customerData,
    required this.imageUrl1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12.w,bottom: 6.h,right: 12.h),
      child: Container(
        // height: 324.h,
        padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 9.h),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 221, 217, 217),
              blurRadius: 10,
            ),
          ],
          color: Colors.white,
          //const Color.fromARGB(179, 243, 242, 242),
          borderRadius: BorderRadius.all(Radius.circular(16.sp)),
        ),

        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 35.0.w,
                height: 35.0.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black54),
                  image: DecorationImage(
                    onError:
                        (exception, stackTrace) =>
                            // ignore: avoid_print
                            print("777777777777777777777777$exception"),
                    fit: BoxFit.cover,
                    image: NetworkImage(imageUrl1),
                  ),
                ),
              ),
            ),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: customerData.length,
              itemBuilder: (context, index) {
                final item = customerData[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: customerIteam(item["head"]!, item["item"]!),
                    ),
                    if (index != customerData.length - 1) linedraw(),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
