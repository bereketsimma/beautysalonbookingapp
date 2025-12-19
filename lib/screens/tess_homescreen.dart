import 'package:flutter/material.dart';
import 'package:mybeautybooking_flutter/models/staff.dart';
import 'package:mybeautybooking_flutter/services/api_service.dart';

class TessHomescreen extends StatelessWidget {
  const TessHomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Staff List',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const StaffListPage(),
    );
  }
}

class StaffListPage extends StatefulWidget {
  const StaffListPage({super.key});

  @override
  State<StaffListPage> createState() => _StaffListPageState();
}

class _StaffListPageState extends State<StaffListPage> {
  late Future<List<Staff>> futureStaffs;

  @override
  void initState() {
    super.initState();
    futureStaffs = fetchStaffs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Staff List')),
      body: FutureBuilder<List<Staff>>(
        future: futureStaffs,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Loading spinner while fetching
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Error message
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No staff available.'));
          }

          final staffs = snapshot.data!;
          return ListView.builder(
            itemCount: staffs.length,
            itemBuilder: (context, index) {
              final staff = staffs[index];
              return Card(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                elevation: 3,
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(staff.username![0]), // first letter of name
                  ),
                  title: Text(staff.username ?? 'No Name'),
                  subtitle:
                      Text("${staff.description}\nPhone: ${staff.phone}"),
                  isThreeLine: true,
                ),
              );
            },
          );
        },
      ),
    );
  }
}