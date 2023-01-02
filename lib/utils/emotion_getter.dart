enum EEmotion { likeColor, loveColor, hahaColor, angryColor, randomColor }

class EmotionNameGetter {
  final Map<EEmotion, String> _emotionName = {
    EEmotion.likeColor: 'assets/icons/Color/LikeColor.svg',
    EEmotion.loveColor: 'assets/icons/Color/LoveColor.svg',
    EEmotion.hahaColor: 'assets/icons/Color/HahaColor.svg',
    EEmotion.angryColor: 'assets/icons/Color/AngryColor.svg',
    EEmotion.randomColor: 'assets/icons/Color/RandomColor.svg'
  };

  getEmotionAsset(EEmotion emotion) {
    print("${_emotionName[emotion]}");
    return _emotionName[emotion];
  }
}
