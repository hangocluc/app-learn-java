import 'package:json_annotation/json_annotation.dart';

part 'question_model.g.dart';

@JsonSerializable()
class QuestionModel {
  @JsonKey(name: '_id')
  final String id;
  final String quizId;
  @JsonKey(name: 'STT')
  final int stt;
  @JsonKey(name: 'question')
  final String content;
  @JsonKey(name: 'answer')
  final List<String> answers;
  final String correctAnswer;

  const QuestionModel({
    required this.id,
    required this.quizId,
    required this.stt,
    required this.content,
    required this.answers,
    required this.correctAnswer,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    final dynamic idRaw = json['_id'];
    final dynamic quizIdRaw = json['quizId'];
    final dynamic sttRaw = json['STT'];
    final dynamic contentRaw = json['question'];
    final List<dynamic> answersRaw = (json['answer'] as List?) ?? const [];
    final dynamic correctRaw = json['correctAnswer'];

    int parsedStt = 0;
    if (sttRaw is num) {
      parsedStt = sttRaw.toInt();
    } else if (sttRaw is String) {
      parsedStt = int.tryParse(sttRaw) ?? 0;
    }

    return QuestionModel(
      id: idRaw?.toString() ?? '',
      quizId: quizIdRaw?.toString() ?? '',
      stt: parsedStt,
      content: contentRaw?.toString() ?? '',
      answers: answersRaw.map((e) => e?.toString() ?? '').toList(),
      correctAnswer: correctRaw?.toString() ?? '',
    );
  }
  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);
}
