import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

const kPrimaryColor = Color(0xFFFF6F61);
const kLightCoralPinkColor = Color(0x80FF6F61); // Adjust the opacity as needed

class HygieneScreen extends StatefulWidget {
  const HygieneScreen({Key? key}) : super(key: key);

  @override
  _SafetyBasicsScreenState createState() => _SafetyBasicsScreenState();
}

class _SafetyBasicsScreenState extends State<HygieneScreen> {
  late YoutubePlayerController _controller;
  int _selectedTag = 0;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: 'wZh9HFcRJpw', // Replace with your YouTube video ID
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void changeTab(int index) {
    setState(() {
      _selectedTag = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hygiene & Diapering'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepPurple, width: 2.0),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: YoutubePlayer(
                      controller: _controller,
                      showVideoProgressIndicator: true,
                      progressIndicatorColor: Colors.pinkAccent,
                      onReady: () {
                        // Perform any actions when the player is ready.
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Proper Diaper Changing Techniques",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "Created by bibisit",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.timer,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          " 1 Hour",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: kLightCoralPinkColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: CustomTabView(
                        index: _selectedTag,
                        changeTab: changeTab,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    if (_selectedTag == 0) CourseContent(),
                    if (_selectedTag == 1) Description(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTabView extends StatefulWidget {
  final Function(int) changeTab;
  final int index;

  const CustomTabView({Key? key, required this.changeTab, required this.index})
      : super(key: key);

  @override
  State<CustomTabView> createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView> {
  final List<String> _tags = ["Course Content", "Description"];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        _tags.length,
        (index) => _buildTags(index),
      ),
    );
  }

  Widget _buildTags(int index) {
    return GestureDetector(
      onTap: () {
        widget.changeTab(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .08, vertical: 15),
        decoration: BoxDecoration(
          color: widget.index == index ? kPrimaryColor : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          _tags[index],
          style: TextStyle(
            color: widget.index != index ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Text(
        "Changing diapers is a fundamental aspect of caring for infants and young children, and mastering proper diaper-changing techniques is essential for maintaining the child's comfort, hygiene, and overall well-being.",
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}

class CourseContent extends StatelessWidget {
  const CourseContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0),
      child: SafetyBasicsCourseContent(),
    );
  }
}

class SafetyBasicsCourseContent extends StatefulWidget {
  const SafetyBasicsCourseContent({Key? key}) : super(key: key);

  @override
  _SafetyBasicsCourseContentState createState() =>
      _SafetyBasicsCourseContentState();
}

class _SafetyBasicsCourseContentState extends State<SafetyBasicsCourseContent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TopicCard(
              title: 'Prepare the Changing Area',
              content:
                  'Choose a clean and flat surface for diaper changing, such as a changing table or a diaper-changing mat.',
            ),
            TopicCard(
              title: 'Wash Your Hands',
              content:
                  'Always begin by thoroughly washing your hands with soap and water to prevent the spread of germs.',
            ),
            TopicCard(
              title: 'Gather Supplies',
              content:
                  'Lay out all required supplies before starting the diaper change to minimize disruptions.',
            ),
            TopicCard(
              title: 'Secure the Child',
              content:
                  'Lay the child on the changing surface, using safety straps if available, to prevent accidental falls.',
            ),
            TopicCard(
              title: 'Remove Clothing',
              content:
                  'Gently and carefully undress the child, lifting their legs if needed, and remove any clothing that might interfere with the diaper change.',
            ),
            TopicCard(
              title: 'Remove and Dispose of the Dirty Diaper',
              content:
                  'Wipe the child from front to back, and carefully lift their legs to clean the diaper area thoroughly. Roll up the soiled diaper before placing it in a designated diaper disposal system.',
            ),
          ],
        ),
      ),
    );
  }
}

class TopicCard extends StatelessWidget {
  final String title;
  final String content;

  const TopicCard({Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(content),
          leading: _getIconForTitle(title),
        ),
      ),
    );
  }

  // Function to get an appropriate icon for the title
  Widget _getIconForTitle(String title) {
    switch (title.toLowerCase()) {
      case 'introduction':
        return Icon(Icons.book);
      case 'choking hazards':
        return Icon(Icons.warning);
      case 'household hazards':
        return Icon(Icons.home);
      case 'first aid':
        return Icon(Icons.medical_services);
      case 'anaphylaxis':
        return Icon(Icons.warning);
      case 'cpr & choking':
        return Icon(Icons.favorite);
      default:
        return Icon(Icons.info);
    }
  }
}
