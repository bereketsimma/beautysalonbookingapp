import 'package:flutter/material.dart';
import 'package:mybeautybooking_flutter/constants/appcolors.dart';

class ServiceCard extends StatelessWidget {
  final String iconUrl; // Can be emoji or network image
  final String name;

  const ServiceCard({
    super.key,
    required this.iconUrl,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return Container(
      width: width * 0.20,
      decoration: BoxDecoration(
        color: AppColors.secondary.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // If iconUrl starts with "http", use Image.network; otherwise Text
          if (iconUrl.startsWith("http"))
            Image.network(
              iconUrl,
              width: width * 0.12,
              height: width * 0.12,
              fit: BoxFit.contain,
            )
          else
            Text(
              iconUrl,
              style: TextStyle(fontSize: width * 0.10),
            ),
          SizedBox(height: width * 0.02),
          Text(
            name,
            style: TextStyle(
              fontSize: width * 0.035,
              color: AppColors.textBlack,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}





class ServiceList extends StatelessWidget {
  final List<Map<String, String>> topServices;

  const ServiceList({
    super.key,
    required this.topServices,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return SizedBox(
      height: width * 0.25,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: topServices.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final icon = topServices[index]["icon"] ?? "❓";
          final name = topServices[index]["name"] ?? "Unknown";

          return ServiceCard(
            iconUrl: icon,
            name: name,
          );
        },
      ),
    );
  }
}
