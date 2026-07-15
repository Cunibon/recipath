import 'package:audioplayers/audioplayers.dart';

class SoundService {
  static final _player = AudioPlayer()
    ..audioCache.prefix = ""
    ..setAudioContext(
      AudioContext(
        iOS: AudioContextIOS(category: .playback, options: {.mixWithOthers}),
        android: AudioContextAndroid(
          audioFocus: .none,
          contentType: .sonification,
          usageType: .alarm,
          audioMode: .normal,
        ),
      ),
    );

  static Future<void> play(String filePath) async {
    await _player.stop();
    await _player.play(AssetSource(filePath));
  }
}
