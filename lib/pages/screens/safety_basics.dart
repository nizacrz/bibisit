import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

const kPrimaryColor = Color(0xFFFF6F61);
const kLightCoralPinkColor = Color(0x80FF6F61); // Adjust the opacity as needed

class SafetyBasicsScreen extends StatefulWidget {
  const SafetyBasicsScreen({Key? key}) : super(key: key);

  @override
  _SafetyBasicsScreenState createState() => _SafetyBasicsScreenState();
}

class _SafetyBasicsScreenState extends State<SafetyBasicsScreen> {
  late YoutubePlayerController _controller;
  int _selectedTag = 0;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: 'yJZv6RP3WaI', // Replace with your YouTube video ID
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
        title: Text('Safety Basics'),
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
                      "Babysitter Basic Training",
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
        "Learn essential babysitting skills and safety measures in this comprehensive basic training course. Whether you're a new babysitter or looking to refresh your skills, this training is designed to equip you with the knowledge and confidence needed to ensure the safety and well-being of the children under your care.",
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
              title: 'Introduction',
              content:
                  'Get an overview of babysitter basics and the importance of safety in babysitting.',
            ),
            TopicCard(
              title: 'Choking Hazards',
              content:
                  'Learn about common choking hazards for children and how to prevent and respond to choking incidents.',
            ),
            TopicCard(
              title: 'Household Hazards',
              content:
                  'Identify potential household hazards and safety measures to ensure a safe environment for children.',
            ),
            TopicCard(
              title: 'First Aid',
              content:
                  'Understand basic first aid techniques for common situations encountered while babysitting.',
            ),
            TopicCard(
              title: 'Anaphylaxis',
              content:
                  'Learn about severe allergic reactions and how to recognize and respond to anaphylaxis.',
            ),
            TopicCard(
              title: 'CPR & Choking',
              content:
                  'Get trained in CPR (Cardiopulmonary Resuscitation) and proper techniques for responding to choking in children.',
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
