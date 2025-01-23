import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb/bloc/bloc/imdb_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  State<VideoPage> createState() => VideoPageState();
}

class VideoPageState extends State<VideoPage> {
  YoutubePlayerController? _controller;
  bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();

    // Trigger the Bloc event to fetch data
    BlocProvider.of<ImdbBloc>(context).add(FetchImdbEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: const Color(0xffF5C418),
        leading: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Center(
            child: Image.asset(
              "assets/logo.png",
              width: 100,
              height: 100,
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.notifications),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocBuilder<ImdbBloc, ImdbState>(
          builder: (context, state) {
            if (state is ImbdblocLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is ImbdblocError) {
              return const Center(child: Text('Failed to load video.'));
            }

            if (state is ImbdblocLoaded) {
              final videoUrl = state.data.imdbLink.toString();
              final videoId = YoutubePlayer.convertUrlToId(videoUrl);

              if (videoId == null) {
                return const Center(child: Text('Invalid YouTube URL.'));
              }

              _controller ??= YoutubePlayerController(
                initialVideoId: videoId,
                flags: const YoutubePlayerFlags(
                  mute: false,
                  autoPlay: true,
                  loop: false,
                  hideControls: false,
                ),
              );

              return SingleChildScrollView(
                child: Column(
                  children: [
                    YoutubePlayer(
                      controller: _controller!,
                      showVideoProgressIndicator: true,
                      onReady: () {
                        setState(() {
                          _isPlayerReady = true;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      child: Text(_controller?.value.isPlaying == false
                          ? 'Play'
                          : 'Pause'),
                      onPressed: _isPlayerReady
                          ? () {
                              if (_controller!.value.isPlaying) {
                                _controller!.pause();
                              } else {
                                _controller!.play();
                              }
                            }
                          : null,
                    ),
                  ],
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
