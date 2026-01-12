import 'package:audioplayers/audioplayers.dart';

class SoundService {
  static final _player = AudioPlayer()..audioCache.prefix = "";

  static Future<void> play(String filePath) async {
    await _player.stop();
    await _player.play(AssetSource(filePath));
  }
}
