import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mybeautybooking_flutter/constants/appcolors.dart';
import 'package:mybeautybooking_flutter/widgets/staff_card.dart';
import 'package:mybeautybooking_flutter/widgets/staff_jobs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> topServices = [
    {"name": "Manicures", "icon": "💅"},
    {"name": "Facial", "icon": "🧖‍♀️"},
    {"name": "Haircut", "icon": "✂️"},
    {"name": "Waxing", "icon": "🕯️"},
  ];

  final List<Map<String, String>> topArtists = [
    {"name": "Alcina Tisha", "role": "Beauty Artist", "price": "\$39.00/hr", "rating": "4.8"},
    {"name": "Amber Heard", "role": "Beauty Artist", "price": "\$27.00/hr", "rating": "3.6"},
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Padding(
  padding: const EdgeInsets.only(top: 10), // 50 pixels space at the top
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
            // Top Section
            Flexible(
              flex: 1,
              child: Container(
                color: AppColors.secondary,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top Row: Menu + Hi There + Profile
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Ionicons.menu_outline, color: AppColors.textBlack),
                            SizedBox(width: 12),
                            Text(
                              "Hi There",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textBlack,
                              ),
                            ),
                          ],
                        ),
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                              "https://via.placeholder.com/150"),
                        ),
                      ],
                    ),
        
                    SizedBox(height: 16),
        
                    // Search bar with filter button
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: AppColors.lightBackground.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Find your best artist....",
                                border: InputBorder.none,
                                icon: Icon(Icons.search, color: AppColors.textGrey),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(Icons.tune, color: AppColors.background),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        
            // Main Content Section
            SingleChildScrollView(
              child: Flexible(
                flex: 3,
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Top Services
                      Text(
                        "Top Services",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textBlack,
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 100,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: topServices.length,
                          separatorBuilder: (_, __) => SizedBox(width: 12),
                          itemBuilder: (context, index) {
                            return Container(
                              width: 80,
                              decoration: BoxDecoration(
                                color: AppColors.secondary.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(topServices[index]["icon"]!, style: TextStyle(fontSize: 36)),
                                  SizedBox(height: 8),
                                  Text(topServices[index]["name"]!,
                                      style: TextStyle(fontSize: 14, color: AppColors.textBlack)),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20),
              
                      // Top Artist
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Top Artist",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textBlack),
                          ),
                          Text("View all", style: TextStyle(color: AppColors.primary)),
                        ],
                      ),
                      SizedBox(height: 10),SizedBox(
          height: 250,   // Responsive height area for the list
          child: LayoutBuilder(
            builder: (context, constraints) {
        double cardWidth = constraints.maxWidth * 0.55; // responsive card width
        
        return ListView(
          scrollDirection: Axis.horizontal,
          children: [
            SizedBox(
              width: cardWidth,
              child: ArtistCard(
          imageUrl: "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg",
                name: "Alaina",
                role: "Beauty Artist",
                rating: 4.8,
                jobs: 4,
              ),
            ),
             SizedBox(
              width: cardWidth,
              child: ArtistCard(
          imageUrl: "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg",
                name: "Alaina",
                role: "Beauty Artist",
                rating: 4.8,
                jobs: 4,
              ),
            ),
             SizedBox(
              width: cardWidth,
              child: ArtistCard(
          imageUrl: "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg",
                name: "Alaina",
                role: "Beauty Artist",
                rating: 4.8,
                jobs: 4,
              ),
            ),
          ],
        );
            }
          ),
        )
        ,
                      SizedBox(height: 20),
              
                      // Best Artist Near You
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Best Artist Near You", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textBlack)),
                          Text("View all", style: TextStyle(color: AppColors.primary)),
                        ],
                      ),
                      SizedBox(height: 10),
                       SizedBox(
  height: 260,
  child: ListView(
    scrollDirection: Axis.horizontal,
    children: [
      SizedBox(
        width: 200,
        child: JobDoneCard(
          imageUrl: "...",
          artistName: "Amber",
          serviceName: "Hair Coloring",
          rating: 4.7,
        ),
      ),
      SizedBox(
        width: 200,
        child: JobDoneCard(
          imageUrl: "...",
          artistName: "Alaina",
          serviceName: "Facial Treatment",
          rating: 4.8,
        ),
      ),
    ],
  ),
),
     
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: const Color.fromARGB(255, 146, 144, 144),
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Ionicons.home_outline),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.calendar_clear_outline),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.heart_outline),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
