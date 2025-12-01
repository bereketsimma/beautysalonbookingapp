import 'package:flutter/material.dart';
import 'package:mybeautybooking_flutter/constants/appcolors.dart';

class ServiceList extends StatelessWidget {
  final List<Map<String, String>> topServices;

  const ServiceList({
    super.key,
    required this.topServices,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: width * 0.25, // responsive height
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: topServices.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final icon = topServices[index]["icon"] ?? "❓";
          final name = topServices[index]["name"] ?? "Unknown";

          return Container(
            width: width * 0.20, // responsive width
            decoration: BoxDecoration(
              color: AppColors.secondary.withOpacity(0.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  icon,
                  style: TextStyle(fontSize: width * 0.10),
                ),
                const SizedBox(height: 6),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: width * 0.035,
                    color: AppColors.textBlack,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
