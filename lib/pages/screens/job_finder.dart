import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class JobFinderMap extends StatefulWidget {
  @override
  _JobFinderMapState createState() => _JobFinderMapState();
}

class _JobFinderMapState extends State<JobFinderMap> {
  late GoogleMapController mapController;
  TextEditingController searchController = TextEditingController();

  // Sample job data
  List<Job> jobs = [
    Job(
        "Nanny",
        "123 Main St, Quezon City, Metro Manila, Philippines",
        LatLng(14.5995, 120.9842),
        ["Experience with infants", "CPR certification"]),
    Job(
        "Babysitter",
        "456 Maple Ave, Manila, Metro Manila, Philippines",
        LatLng(13.4141, 122.5626),
        ["First aid training", "Good communication skills"]),
    Job(
        "Child Care Specialist",
        "789 Oak St, Quezon City, Metro Manila, Philippines",
        LatLng(14.6214, 121.0681),
        ["Child development certification", "Excellent communication skills"]),
    Job(
        "Experienced Babysitter",
        "567 Pine St, Manila, Metro Manila, Philippines",
        LatLng(14.5903, 121.0325),
        ["Previous babysitting experience", "CPR and first aid certified"]),
    Job(
        "Certified Child Care Provider",
        "890 Elm St, Quezon City, Metro Manila, Philippines",
        LatLng(14.6255, 120.9913),
        ["Certification in child care", "Good organizational skills"]),
    Job(
        "Part-time Babysitter",
        "234 Cedar St, Manila, Metro Manila, Philippines",
        LatLng(14.6091, 120.9885),
        ["Flexible schedule", "CPR training"]),
    Job(
        "Night-time Babysitter",
        "876 Birch St, Quezon City, Metro Manila, Philippines",
        LatLng(14.6064, 121.0203),
        ["Experience with bedtime routines", "Available during evenings"]),
    Job(
        "Reliable Babysitter",
        "543 Walnut St, Manila, Metro Manila, Philippines",
        LatLng(14.6037, 120.9731),
        ["Dependable and punctual", "Excellent references"]),
    Job(
        "Fun-loving Babysitter",
        "987 Oakwood Ave, Quezon City, Metro Manila, Philippines",
        LatLng(14.6149, 120.9780),
        ["Engages in creative activities", "Enthusiastic and caring"]),
    Job(
        "Weekend Babysitter",
        "321 Spruce St, Manila, Metro Manila, Philippines",
        LatLng(14.6112, 121.0456),
        ["Available on weekends", "Experience with multiple children"]),
    Job(
        "Live-in Babysitter",
        "654 Pinecrest Ave, Quezon City, Metro Manila, Philippines",
        LatLng(14.5881, 121.0238),
        ["Provides live-in childcare", "Cooks and cleans"]),
    Job(
        "Nanny",
        "123 Main St, Quezon City, Metro Manila, Philippines",
        LatLng(14.5995, 120.9842),
        ["Experience with infants", "CPR certification"]),
    Job(
        "Babysitter",
        "456 Maple Ave, Manila, Metro Manila, Philippines",
        LatLng(13.4141, 122.5626),
        ["First aid training", "Good communication skills"]),
    Job(
        "Child Care Specialist",
        "789 Oak St, Quezon City, Metro Manila, Philippines",
        LatLng(14.6214, 121.0681),
        ["Child development certification", "Excellent communication skills"]),
    Job(
        "Experienced Babysitter",
        "567 Pine St, Manila, Metro Manila, Philippines",
        LatLng(14.5903, 121.0325),
        ["Previous babysitting experience", "CPR and first aid certified"]),
    Job(
        "Certified Child Care Provider",
        "890 Elm St, Quezon City, Metro Manila, Philippines",
        LatLng(14.6255, 120.9913),
        ["Certification in child care", "Good organizational skills"]),
    Job(
        "Part-time Babysitter",
        "234 Cedar St, Manila, Metro Manila, Philippines",
        LatLng(14.6091, 120.9885),
        ["Flexible schedule", "CPR training"]),
    Job(
        "Night-time Babysitter",
        "876 Birch St, Quezon City, Metro Manila, Philippines",
        LatLng(14.6064, 121.0203),
        ["Experience with bedtime routines", "Available during evenings"]),
    Job(
        "Reliable Babysitter",
        "543 Walnut St, Manila, Metro Manila, Philippines",
        LatLng(14.6037, 120.9731),
        ["Dependable and punctual", "Excellent references"]),
    Job(
        "Fun-loving Babysitter",
        "987 Oakwood Ave, Quezon City, Metro Manila, Philippines",
        LatLng(14.6149, 120.9780),
        ["Engages in creative activities", "Enthusiastic and caring"]),
    Job(
        "Weekend Babysitter",
        "321 Spruce St, Manila, Metro Manila, Philippines",
        LatLng(14.6112, 121.0456),
        ["Available on weekends", "Experience with multiple children"]),
    Job(
        "Live-in Babysitter",
        "654 Pinecrest Ave, Quezon City, Metro Manila, Philippines",
        LatLng(14.5881, 121.0238),
        ["Provides live-in childcare", "Cooks and cleans"]),
    Job(
        "Nanny",
        "123 Main St, Quezon City, Metro Manila, Philippines",
        LatLng(14.5995, 120.9842),
        ["Experience with infants", "CPR certification"]),
    Job(
        "Babysitter",
        "456 Maple Ave, Manila, Metro Manila, Philippines",
        LatLng(13.4141, 122.5626),
        ["First aid training", "Good communication skills"]),
    Job(
        "Child Care Specialist",
        "789 Oak St, Cebu City, Cebu, Philippines",
        LatLng(10.3157, 123.8854),
        ["Child development certification", "Excellent communication skills"]),
    Job(
        "Experienced Babysitter",
        "567 Pine St, Davao City, Davao del Sur, Philippines",
        LatLng(7.1907, 125.4553),
        ["Previous babysitting experience", "CPR and first aid certified"]),
    Job(
        "Certified Child Care Provider",
        "890 Elm St, Iloilo City, Iloilo, Philippines",
        LatLng(10.7202, 122.5621),
        ["Certification in child care", "Good organizational skills"]),
    Job(
        "Part-time Babysitter",
        "234 Cedar St, Baguio City, Benguet, Philippines",
        LatLng(16.4026, 120.5960),
        ["Flexible schedule", "CPR training"]),
    Job(
        "Night-time Babysitter",
        "876 Birch St, Cagayan de Oro City, Misamis Oriental, Philippines",
        LatLng(8.4822, 124.6470),
        ["Experience with bedtime routines", "Available during evenings"]),
    Job(
        "Reliable Babysitter",
        "543 Walnut St, Legazpi City, Albay, Philippines",
        LatLng(13.1396, 123.7347),
        ["Dependable and punctual", "Excellent references"]),
    Job(
        "Fun-loving Babysitter",
        "987 Oakwood Ave, Bacolod City, Negros Occidental, Philippines",
        LatLng(10.6840, 122.9563),
        ["Engages in creative activities", "Enthusiastic and caring"]),
    Job(
        "Weekend Babysitter",
        "321 Spruce St, Zamboanga City, Zamboanga del Sur, Philippines",
        LatLng(6.9214, 122.0790),
        ["Available on weekends", "Experience with multiple children"]),
    Job(
        "Live-in Babysitter",
        "654 Pinecrest Ave, Tagaytay City, Cavite, Philippines",
        LatLng(14.1153, 120.9629),
        ["Provides live-in childcare", "Cooks and cleans"]),
    Job(
      "Babysitter Needed",
      "123 Main St, Makati, Metro Manila, Philippines",
      LatLng(14.5562, 121.0211),
      ["Experience with infants", "CPR certification"],
    ),
    Job(
      "Part-time Babysitter",
      "456 Maple Ave, Quezon City, Metro Manila, Philippines",
      LatLng(14.6760, 121.0437),
      ["Flexible schedule", "First aid training"],
    ),
    Job(
      "Weekend Babysitter Wanted",
      "789 Oak St, Manila, Metro Manila, Philippines",
      LatLng(14.5896, 120.9811),
      ["Available on weekends", "Experience with multiple children"],
    ),
    Job(
      "Experienced Babysitter Needed",
      "987 Pine St, Mandaluyong, Metro Manila, Philippines",
      LatLng(14.5794, 121.0359),
      ["Previous babysitting experience", "CPR and first aid certified"],
    ),
    Job(
      "Full-time Nanny Position",
      "654 Cedar St, Pasig, Metro Manila, Philippines",
      LatLng(14.5764, 121.0851),
      ["Experience with toddlers", "Certification in childcare"],
    ),
    Job(
      "Night-time Babysitter",
      "321 Elm St, Taguig, Metro Manila, Philippines",
      LatLng(14.5176, 121.0509),
      ["Experience with bedtime routines", "Available during evenings"],
    ),
    Job(
      "Reliable Babysitter Wanted",
      "876 Oakwood Ave, Quezon City, Metro Manila, Philippines",
      LatLng(14.6776, 121.0386),
      ["Dependable and punctual", "Good communication skills"],
    ),
    Job(
      "Fun-loving Babysitter Needed",
      "543 Walnut St, Makati, Metro Manila, Philippines",
      LatLng(14.5547, 121.0244),
      ["Engages in creative activities", "Enthusiastic and caring"],
    ),
    Job(
      "Live-in Babysitter",
      "890 Pinecrest Ave, Manila, Metro Manila, Philippines",
      LatLng(14.5995, 120.9842),
      ["Provides live-in childcare", "Cooks and cleans"],
    ),
    Job(
      "Weekday Babysitter",
      "234 Birch St, San Juan, Metro Manila, Philippines",
      LatLng(14.6037, 121.0354),
      ["Available on weekdays", "Experience with school-age children"],
    ),
    // Add more job listings as needed
  ];

  List<Job> filteredJobs = [];

  // Default location for the map (Manila, Philippines)
  LatLng _center = LatLng(14.5995, 120.9842);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Finder Map'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search Job',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _searchCity,
                ),
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 10.0,
                  ),
                  markers: _createMarkers(),
                ),
                // Add other UI elements or widgets as needed
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
      // Scattering jobs on the map when it's created
      filteredJobs = List.from(jobs);
    });
  }

  Set<Marker> _createMarkers() {
    return filteredJobs.map((job) {
      return Marker(
        markerId: MarkerId(job.title),
        position: job.location,
        infoWindow: InfoWindow(
          title: job.title,
          snippet: 'Click to view details',
        ),
        onTap: () => _onMarkerTapped(job),
      );
    }).toSet();
  }

  void _onMarkerTapped(Job job) {
    // Show details or navigate to another screen
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(job.title),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Address: ${job.address}'),
              SizedBox(
                height: 5,
              ),
              Text('Job Requirements: ${job.requirements.join(', ')}'),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _applyNow(job),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade300,
                ),
                child: Text('Apply Now'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _applyNow(Job job) async {
    // Replace the phone number with the actual phone number you want to use
    const phoneNumber = 'tel:+1234567890';

    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      // Handle error
      print('Could not launch $phoneNumber');
    }
  }

  void _searchCity() {
    String searchTerm = searchController.text.toLowerCase();

    List<Job> searchResults = jobs
        .where((job) =>
            job.address.toLowerCase().contains(searchTerm) ||
            job.title.toLowerCase().contains(searchTerm))
        .toList();

    setState(() {
      filteredJobs = searchResults;
    });

    // Refresh the markers on the map
    _refreshMarkers();

    // If there's at least one search result, focus on the bounds of all results
    if (searchResults.isNotEmpty) {
      double minLat = searchResults
          .map((job) => job.location.latitude)
          .reduce((a, b) => a < b ? a : b);
      double maxLat = searchResults
          .map((job) => job.location.latitude)
          .reduce((a, b) => a > b ? a : b);
      double minLng = searchResults
          .map((job) => job.location.longitude)
          .reduce((a, b) => a < b ? a : b);
      double maxLng = searchResults
          .map((job) => job.location.longitude)
          .reduce((a, b) => a > b ? a : b);

      mapController.animateCamera(
        CameraUpdate.newLatLngBounds(
          LatLngBounds(
            southwest: LatLng(minLat, minLng),
            northeast: LatLng(maxLat, maxLng),
          ),
          50.0, // padding
        ),
      );
    }
  }

  void _refreshMarkers() {
    // Force a re-build of the widget to update the markers
    setState(() {});
  }
}

class Job {
  final String title;
  final String address;
  final LatLng location;
  final List<String> requirements;

  Job(this.title, this.address, this.location, this.requirements);
}
