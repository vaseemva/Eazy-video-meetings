import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/colors.dart';
import 'package:zoom_clone/widgets/home_meeting_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  onpageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Meet & Chat"),
        centerTitle: true,
        backgroundColor: backgroundColor,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeMeetingButton(
                onpressed: () {},
                icon: Icons.videocam,
                text: "New Meeting",
              ),
              HomeMeetingButton(
                  onpressed: () {},
                  icon: Icons.add_box_rounded,
                  text: "Join Meeting"),
              HomeMeetingButton(
                  onpressed: () {},
                  icon: Icons.calendar_today,
                  text: "Schedule"),
              HomeMeetingButton(
                  onpressed: () {},
                  icon: Icons.arrow_upward_outlined,
                  text: "Share Screen"),
            ],
          ),
          const Expanded(
              child: Center(
            child: Text("Create/Join Meetings with just a click!",style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17  
            ),),
          ))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.comment_bank), label: "Meet & char"),
          BottomNavigationBarItem(
              icon: Icon(Icons.lock_clock), label: "Meetings"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "contacts"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
          BottomNavigationBarItem(
              icon: Icon(Icons.comment_bank), label: "Meet & char"),
        ],
        onTap: onpageChanged,
        currentIndex: _page,
      ),
    );
  }
}
