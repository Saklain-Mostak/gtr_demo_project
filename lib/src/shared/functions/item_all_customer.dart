import 'package:flutter/material.dart';
import 'package:gtr_task/src/core/constants/text_style.dart';

SizedBox customerIteam(String textItemHead, String textItem) {
  return SizedBox(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Expanded(
          child: Text(
            textItemHead,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.titlemedium.copyWith(
              color: const Color.fromARGB(255, 138, 145, 145),
              fontWeight: FontWeight.w100,
            ),
          ),
        ),

        Expanded(
          child: Text(
            textAlign: TextAlign.end,
            textItem,

            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: AppTextStyle.titlemedium.copyWith(color: Colors.black),
          ),
        ),
      ],
    ),
  );
}
