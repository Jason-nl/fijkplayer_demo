import 'package:flutter/material.dart';
import 'package:fijkplayer/fijkplayer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Basic Video Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const VideoScreen(
          url: 'https://vod2.bdzybf7.com/20220330/kki9MgAy/index.m3u8'),
    );
  }
}

class VideoScreen extends StatefulWidget {
  final String url;

  const VideoScreen({Key? key, required this.url}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final FijkPlayer player = FijkPlayer();

  _VideoScreenState();

  @override
  void initState() {
    super.initState();
    player.setDataSource(widget.url, autoPlay: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Fijkplayer Example")),
        body: Container(
          alignment: Alignment.center,
          child: FijkView(
            player: player,
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    player.release();
  }
}
