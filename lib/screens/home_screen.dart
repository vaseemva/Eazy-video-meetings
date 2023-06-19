import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoom_clone/provider/user_provider.dart';
import 'package:zoom_clone/screens/live_page.dart';
import 'package:zoom_clone/utils/colors.dart';
import 'package:zoom_clone/widgets/home_meeting_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller =
      TextEditingController(text: Random().nextInt(900000 + 100000).toString());
  int _page = 0;
  onpageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<UserProvider>(context, listen: false);
      provider.refreshUser();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Eazy Live Streamings"),
        centerTitle: true,
        backgroundColor: backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: HomeMeetingButton(
                onpressed: () =>
                    jumptoLive(context, liveId: _controller.text, isHost: true),
                icon: Icons.videocam,
                text: "New Live",
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: HomeMeetingButton(
                  onpressed: () => jumptoLive(context,
                      liveId: _controller.text, isHost: false),
                  icon: Icons.add_box_rounded,
                  text: "Join Live"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.comment_bank), label: "Create/Join"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
        onTap: onpageChanged,
        currentIndex: _page,
      ),
    );
  }

  jumptoLive(BuildContext context,
      {required String liveId, required bool isHost}) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => LivePage(liveID: liveId, isHost: isHost),
    ));
  }
}
