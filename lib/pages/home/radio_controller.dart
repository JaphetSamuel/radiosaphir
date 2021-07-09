import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get/get.dart';

class RadioController extends GetxController {
  var played = false.obs;
  final audioUrl = "https://radio13.pro-fhi.net:19073/stream";
  final audioPlayer = AssetsAudioPlayer();

  @override
  void onInit() {
    playPause();
    super.onInit();
  }

  void playPause() {
    try {
      Audio.liveStream(audioUrl);
      print("Playing");
    } catch (e) {
      Get.snackbar(
          "Problème de connexion", "Verfiez que vous êtes bien connecté");
    }
  }
}
