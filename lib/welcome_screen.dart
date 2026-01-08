import 'package:barcelona_gezi/location_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late VideoPlayerController _controller;

  //Video için gerekli işlemler yapıldı.
  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset('assets/videos/giris_video.mp4')
    ..initialize().then((_) {
      if(_controller.value.isInitialized){
        _controller.play();
        _controller.setLooping(true);
        _controller.setVolume(0.0);
      }
      setState(() {});
    }).catchError((error){
      print("Video yüklenirken hata oluştu: $error");
    });
  }

  //Controller temizlendi.
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _navigateToNextScreen(){
    print('Devam Butonuna Tıklandı - 2. Ekrana geçiş yapılıyor');

    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const LocationSelectionScreen()),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          _controller.value.isInitialized
          ? FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: _controller.value.size.width,
              height: _controller.value.size.height,
              child: VideoPlayer(_controller),
            ),
          )
              : Container(
            color: Colors.blueGrey[900],
                child: const Center(
                  child: CircularProgressIndicator(color: Colors.white)
            ),
          ),

          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black12,
                  Colors.black87,
                  Colors.black87,
                ],
                stops: [0.0, 0.4, 1.0],
              ),
            ),
          ),


          Padding(
              padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const Text(
                  "Gezgin Ruhunu Keşfet",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12.0),

                const Text(
                  "Gideceğin yerleri harita üzerinde işaretle, notlarını kaydet ve mükemmel rotanı planla.",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 17.0,
                  ),
                ),

                const SizedBox(height: 40.0),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                      onPressed: _navigateToNextScreen,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Text(
                        "GEZİYE BAŞLA",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
