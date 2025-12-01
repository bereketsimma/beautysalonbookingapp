import 'package:flutter/material.dart';

class JobDoneCard extends StatelessWidget {
  final String imageUrl;
  final String artistName;
  final String serviceName;
  final double rating;

  const JobDoneCard({
    super.key,
    required this.imageUrl,
    required this.artistName,
    required this.serviceName,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    // Screen width for responsiveness
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive sizes
    final double cardRadius = screenWidth * 0.03;
    final double imageHeight = screenWidth * 0.35;
    final double titleSize = screenWidth * 0.046;
    final double subtitleSize = screenWidth * 0.035;
    final double ratingSize = screenWidth * 0.042;
    final double starIconSize = screenWidth * 0.045;
    final double padding = screenWidth * 0.03;

    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(bottom: padding * 0.8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(cardRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Responsive image
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(cardRadius)),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                height: imageHeight,
                fit: BoxFit.cover,
              ),
            ),
      
            Padding(
              padding: EdgeInsets.all(padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Service name
                  Text(
                    serviceName,
                    style: TextStyle(
                      fontSize: titleSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
      
                  SizedBox(height: padding * 0.4),
      
                  // Artist name
                  Text(
                    "Done by $artistName",
                    style: TextStyle(
                      fontSize: subtitleSize,
                      color: Colors.grey.shade600,
                    ),
                  ),
      
                  SizedBox(height: padding * 0.6),
      
                  // Rating
                  Row(
                    children: [
                      Icon(Icons.star, size: starIconSize, color: Colors.orange),
                      SizedBox(width: padding * 0.4),
                      Text(
                        rating.toString(),
                        style: TextStyle(
                          fontSize: ratingSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
