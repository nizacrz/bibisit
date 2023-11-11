import 'package:bibisit/pages/screens/hygiene.dart';
import 'package:bibisit/pages/screens/job_finder.dart';
import 'package:bibisit/pages/screens/safety_basics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final User? currentUser;
  HomePage({Key? key, this.currentUser}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser!;

  String getGreeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning,';
    } else if (hour < 17) {
      return 'Good Afternoon,';
    } else {
      return 'Good Evening,';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Extract the first name from the display name
    List<String> nameParts = user.displayName?.split(' ') ?? [];
    String firstName = nameParts.isNotEmpty ? nameParts.first : '';
    String displayName = user.displayName ?? 'Trainee User';

    List<CategoryCardData> categories = [
      CategoryCardData(
        title: 'Safety Basics',
        imagePath: 'assets/images/safety-first.png',
      ),
      CategoryCardData(
        title: 'Hygiene',
        imagePath: 'assets/images/hygiene.png',
      ),
      CategoryCardData(
        title: 'Soon',
        imagePath: '',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
                top: 12.0, right: 15.0), // Adjust the padding as needed
            child: IconButton(
              onPressed: () {
                // Handle search icon press
              },
              icon: Icon(
                Icons.search,
                size: 35,
              ),
              color: Colors.black87,
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  getGreeting(),
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 35,
                    fontFamily: 'Coolvetica',
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "${firstName ?? 'Trainee User'} 👋",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Coolvetica',
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Image.asset(
                  'assets/images/banner.png', // Replace with the actual path to your image
                  width: double.infinity,
                  height: 200, // Adjust the height as needed
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 10,
                ),

                //Find a Job Map Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => JobFinderMap()),
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.work,
                          size: 24,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Find a Job",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      primary: Colors.red.shade400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Courses',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 30,
                        fontFamily: 'Coolvetica',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryCard(
                      data: categories[index],
                      onPressed: () {
                        print('Navigating to ${categories[index].title}');
                        // Navigate to the corresponding screen based on the category
                        if (categories[index].title == 'Safety Basics') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SafetyBasicsScreen(),
                            ),
                          );
                        } else if (categories[index].title == 'Hygiene') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HygieneScreen(),
                            ),
                          );
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCardData {
  final String title;
  final String imagePath;

  CategoryCardData({
    required this.title,
    required this.imagePath,
  });
}

class CategoryCard extends StatelessWidget {
  final CategoryCardData data;
  final VoidCallback onPressed;

  CategoryCard({
    required this.data,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          image: DecorationImage(
            image: AssetImage(data.imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.7),
              ],
            ),
          ),
          child: Center(
            child: Text(
              data.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.normal,
                fontFamily: 'Tahun',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
