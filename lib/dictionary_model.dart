class DictionaryModel {
  final String wordUz;
  final String wordEng;

  DictionaryModel({required this.wordEng, required this.wordUz});

  Map<String, dynamic> toJson() {
    return {
      'wordUz': this.wordUz,
      'wordEng': this.wordEng,
    };
  }

  factory DictionaryModel.fromJson(Map<String, dynamic> data) {
    return DictionaryModel(wordEng: data["wordEng"], wordUz: data['wordUz']);
  }
}
