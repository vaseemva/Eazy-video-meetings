import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';
import 'package:zoom_clone/provider/user_provider.dart';

class LivePage extends StatelessWidget {
  LivePage({Key? key, required this.liveID, required this.isHost})
      : super(key: key);

  final int appid = int.parse(dotenv.get('ZEGO_APP_ID'));
  final String appsign = dotenv.get("ZEGO_APP_SIGN");
  final String userID = Random().nextInt(900000 + 100000).toString();
  final String liveID;
  final bool isHost;

  @override
  Widget build(BuildContext context) {
    final userprovider = Provider.of<UserProvider>(context, listen: false);
    return SafeArea(
        child: ZegoUIKitPrebuiltLiveStreaming(
            appID: appid,
            appSign: appsign,
            userID: userID,
            userName: userprovider.getUser.username,
            liveID: liveID,
            config: isHost
                ? ZegoUIKitPrebuiltLiveStreamingConfig.host()
                : ZegoUIKitPrebuiltLiveStreamingConfig.audience()));
  }
}
