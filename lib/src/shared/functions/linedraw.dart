  import 'package:flutter/material.dart';

Container linedraw() {
    return Container(
              width: double.infinity,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 0.50,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Colors.black.withValues(alpha: 0.10),
                  ),
                ),
              ),
            );
  }