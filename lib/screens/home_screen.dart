import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mybeautybooking_flutter/constants/appcolors.dart';
import 'package:mybeautybooking_flutter/widgets/drawer.dart';
import 'package:mybeautybooking_flutter/widgets/staff_card.dart';
import 'package:mybeautybooking_flutter/widgets/staff_jobs.dart';
import 'package:mybeautybooking_flutter/widgets/service_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Sample top services data used by ServiceList.
  final List<Map<String, String>> topServices = [
    {"icon": "💇‍♀️", "name": "Haircut"},
    {"icon": "💆‍♀️", "name": "Facial"},
    {"icon": "💅", "name": "Manicure"},
    {"icon": "💇‍♀️", "name": "Haircut"},
    {"icon": "💆‍♀️", "name": "Facial"},
    {"icon": "💅", "name": "Manicure"},
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(userEmail: 'Vj0eF@example.com'),

      // Custom AppBar with top section
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(160),
        child: Container(
          color: AppColors.secondary,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Ionicons.menu_outline, color: AppColors.textBlack),
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                  ),
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage("https://via.placeholder.com/150"),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Search bar with filter button
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
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
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
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

      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Services
              Text(
                "Top Services",
                style: TextStyle(
                  fontSize: mediaQuery.size.width * 0.05,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textBlack,
                ),
              ),
              const SizedBox(height: 10),
              ServiceList(topServices: topServices),
              const SizedBox(height: 20),

              // Top Artist
              _buildSectionHeader("Top Artist"),
              const SizedBox(height: 10),
              SizedBox(
                height: mediaQuery.size.height * 0.28,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    double cardWidth = constraints.maxWidth * 0.55;
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
                            name: "Amber",
                            role: "Beauty Artist",
                            rating: 4.7,
                            jobs: 3,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),

              // Best Artist Near You
              _buildSectionHeader("Best Artist Near You"),
              const SizedBox(height: 10),
              SizedBox(
                height: mediaQuery.size.height * 0.30,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: mediaQuery.size.width * 0.5,
                      child: JobDoneCard(
                        imageUrl: "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg",
                        artistName: "Amber",
                        serviceName: "Hair Coloring",
                        rating: 4.7,
                      ),
                    ),
                    SizedBox(width: mediaQuery.size.width * 0.05),
                    SizedBox(
                      width: mediaQuery.size.width * 0.5,
                      child: JobDoneCard(
                        imageUrl: "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg",
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

  // Section Header Widget
  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.05,
            fontWeight: FontWeight.bold,
            color: AppColors.textBlack,
          ),
        ),
        Text("View all", style: TextStyle(color: AppColors.primary)),
      ],
    );
  }
}
