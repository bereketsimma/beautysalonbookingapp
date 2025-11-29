import 'package:flutter/material.dart';

class ArtistCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String role;
  final double rating;
  final int jobs;

  const ArtistCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.role,
    required this.rating,
    required this.jobs,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double cardWidth = constraints.maxWidth;   // full available width
        double imageHeight = cardWidth * 0.55;      // automatic scaling

        return Container(
          margin: const EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(
                  imageUrl,
                  width: double.infinity,
                  height: imageHeight,
                  fit: BoxFit.cover,
                ),
              ),

              // Content
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 4),
                    Text(role, style: TextStyle(
                      fontSize: 13, color: Colors.grey.shade600)),
                    const SizedBox(height: 10),

                    Row(
                      children: [
                        const Icon(Icons.star, size: 16, color: Colors.orange),
                        const SizedBox(width: 4),
                        Text(rating.toString(),
                            style: const TextStyle(fontWeight: FontWeight.w600)),
                        const SizedBox(width: 4),
                        Text("($jobs)",
                            style: TextStyle(color: Colors.grey.shade600)),
                      ],
                    ),
                    const SizedBox(height: 10),

                  
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
