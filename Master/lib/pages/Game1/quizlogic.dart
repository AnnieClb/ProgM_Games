import 'question.dart';

class QuizLogic {
  int _questionIndex = 0;

  List <Question> questions = [
    // question 1
    Question(
        flagName: 'allemagne.jpg',
        answer1: 'Lituanie',
        answer2: 'Espagne',
        answer3: 'Allemagne',
        correctAnswer: 'Allemagne'),
// question 2
    Question(
      flagName: 'Ivoire.jpg',
      answer1: 'Côte ivoire',
      answer2: 'Irlande',
      answer3: 'Inde',
      correctAnswer: 'Côte ivoire'),
// question 3
    Question(
      flagName: 'islande.jpg',
      answer1: 'Cameroun',
      answer2: 'France',
      answer3:  'Islande',
      correctAnswer: 'Islande'),
//question 4
    Question(
      flagName: 'Finlande.jpg',
      answer1: 'Algérie',
      answer2: 'Finlande',
      answer3: 'Grèce',
      correctAnswer: 'Finlande'),
//question 5
    Question(
      flagName: 'togo.jpg',
      answer1: 'Ghana',
      answer2: 'Guinée Equatoriale',
      answer3: 'Togo',
      correctAnswer: 'Togo'),
//question 6
    Question(
      flagName: 'Sud_Korea.jpg',
      answer1: 'Corée du Sud ',
      answer2: 'Corée du Nord',
      answer3: 'Phillipines',
      correctAnswer: 'Corée du Sud'),

 //question 7
    Question(
        flagName: 'france.jpg',
        answer1: 'Algérie',
        answer2: 'France',
        answer3: 'Finlande',
        correctAnswer: 'France'),
//question 8
    Question(
        flagName: 'grece.jpg',
        answer1: 'Grèce',
        answer2: 'France',
        answer3: 'Cambodge',
        correctAnswer: 'Grèce'),
//question 9
    Question(
        flagName: 'macao.jpg',
        answer1: 'Tchad',
        answer2: 'Macao',
        answer3: 'Palestine',
        correctAnswer: 'Macao'),
//question 10
    Question(
        flagName: 'israel.jpg',
        answer1: 'Israel',
        answer2: 'Finlande',
        answer3: 'Somalie',
        correctAnswer: 'Israel'),
//question 11
    /*Question(
        flagName: 'liban.jpg',
        answer1: 'Tunisie',
        answer2: 'Lybie',
        answer3: 'Liban',
        correctAnswer: 'Liban'),
//question 12
    Question(
        flagName: 'irlande.jpg',
        answer1: 'Irlande',
        answer2: 'Inde',
        answer3: 'Italie',
        correctAnswer: 'Irlande'),
//question 13
    Question(
        flagName: 'Sud_Afrique.jpg',
        answer1: 'Palestine',
        answer2: 'Madagascar',
        answer3: 'Afrique du Sud',
        correctAnswer: 'Afrique du Sud'),
//question 14
    Question(
        flagName: 'senegal.jpg',
        answer1: 'Sénégal',
        answer2: 'Bénin',
        answer3: 'Mali',
        correctAnswer: 'Sénégal'),
//question 15
    Question(
        flagName: 'Russi..jpg',
        answer1: 'Russie',
        answer2: 'France',
        answer3: 'Pays Bas',
        correctAnswer: 'Russie'),
//question 16
    Question(
        flagName: 'serbie.jpg',
        answer1: 'Algérie',
        answer2: 'Roumanie',
        answer3: 'Serbie',
        correctAnswer: 'Serbie'),
//question 17
    Question(
        flagName: 'afghan.jpg',
        answer1: 'Palestine',
        answer2: 'Cap Vert',
        answer3: 'Afganistan',
        correctAnswer: 'Afghanistan'),
//question 18
    Question(
        flagName: 'armenie.jpg',
        answer1: 'Suède',
        answer2: 'Kazakhstan',
        answer3: 'Arménie',
        correctAnswer: 'Arménie'),
//question 19
    Question(
        flagName: 'yemen.jpg',
        answer1: 'Yémen',
        answer2: 'Chypre',
        answer3: 'Bostwana',
        correctAnswer: 'Yémen'),
//question 20
    Question(
        flagName: 'Seychelles.jpg',
        answer1: 'Niger',
        answer2: 'Gambie',
        answer3: 'Seychelles',
        correctAnswer: 'Seychelles'),
//question 21
    Question(
        flagName: 'palestine.jpg',
        answer1: 'Soudan',
        answer2: 'Palestine',
        answer3: 'Hongrie',
        correctAnswer: 'Palestine'),
//question 22
    Question(
        flagName: 'somalie.jpg',
        answer1: 'Lituanie',
        answer2: 'Somalie',
        answer3: 'Soudan',
        correctAnswer: 'Somalie'),
//question 23
    Question(
        flagName: 'ouganda.jpg',
        answer1: 'Rwanda',
        answer2: 'Croatie',
        answer3: 'Ouganda',
        correctAnswer: 'Ouganda'),
//question 24
    Question(
        flagName: 'liberia.jpg',
        answer1: 'Algérie',
        answer2: 'Libéria',
        answer3: 'Serbie',
        correctAnswer: 'Libéria'),
//question 25
    Question(
        flagName: 'djibouti.jpg',
        answer1: 'Djibouti',
        answer2: 'Egypte',
        answer3: 'Maurice',
        correctAnswer: 'Djibouti'),
//question 26
    Question(
        flagName: 'moldavie.jpg',
        answer1: 'Angola',
        answer2: 'Eswatini',
        answer3: 'Moldavie',
        correctAnswer: 'Moldavie'),
//question 27
    Question(
        flagName: 'roumanie.jpg',
        answer1: 'Roumanie',
        answer2: 'Tanzanie',
        answer3: 'Estonie',
        correctAnswer: 'Roumanie'),
//question 28
    Question(
        flagName: 'argentine.jpg',
        answer1: 'Algérie',
        answer2: 'Argentine',
        answer3: 'Slovénie',
        correctAnswer: 'Argentine'),
//question 29
    Question(
        flagName: 'benin.jpg',
        answer1: 'Congo',
        answer2: 'Bénin',
        answer3: 'Cameroun',
        correctAnswer: 'Bénin'),
//question 30
    Question(
        flagName: 'suede.jpg',
        answer1: 'Suède',
        answer2: 'Bulgarie',
        answer3: 'Hongrie',
        correctAnswer: 'Suède'),
//question 31
    Question(
        flagName: 'vatican.jpg',
        answer1: 'Pogne',
        answer2: 'Vatican',
        answer3: 'Géorgie',
        correctAnswer: 'Vatican'),
//question 32
    Question(
        flagName: 'Burundi.jpg',
        answer1: 'Burundi',
        answer2: 'Gambie',
        answer3: 'République Centrafricaine',
        correctAnswer: 'Burundi'),
//question 33
    Question(
        flagName: 'montenegro.jpg',
        answer1: 'Tchéquie',
        answer2: 'Monténégro',
        answer3: 'Estonie',
        correctAnswer: 'Monténégro'),
//question 34
    Question(
        flagName: 'Cambodge.jpg',
        answer1: 'Lettonie',
        answer2: 'Cambodge',
        answer3: 'Danemark',
        correctAnswer: 'Cambodge'),
//question 35
    Question(
        flagName: 'taiwan.jpg',
        answer1: 'Taiwan',
        answer2: 'Albanie',
        answer3: 'Turquie',
        correctAnswer: 'Taiwan'),
//question 36
    Question(
        flagName: 'espagne.jpg',
        answer1: 'Espagne',
        answer2: 'Kosovo',
        answer3: 'Chypre',
        correctAnswer: 'Espagne'),
//question 37
    Question(
        flagName: 'norvege.jpg',
        answer1: 'Malte',
        answer2: 'Norvège',
        answer3: 'Erythrée',
        correctAnswer: 'Norvège'),
//question 38
    Question(
        flagName: 'slovaquie.jpg',
        answer1: 'Algérie',
        answer2: 'France',
        answer3: 'Slovaquie',
        correctAnswer: 'Slovaquie'),
//question 39
    Question(
        flagName: 'lituanie.jpg',
        answer1: 'Malawi',
        answer2: 'Lituanie',
        answer3: 'Angola',
        correctAnswer: 'Lituanie'),
//question 40
    Question(
        flagName: 'paysbas.jpg',
        answer1: 'Russie',
        answer2: 'France',
        answer3: 'Pays Bas',
        correctAnswer: 'Pays Bas'),*/
  ];


  String getFlagName(){
    return questions[_questionIndex].flagName;
  }

  // Obtenir les réponses
  String getAnswer1() {
    return questions[_questionIndex].answer1;
  }

  String getAnswer2() {
    return questions[_questionIndex].answer2;
  }

  String getAnswer3() {
    return questions[_questionIndex].answer3;
  }

  String getAnswer4() {
    return questions[_questionIndex].answer1;
  }

  String getAnswer5() {
    return questions[_questionIndex].answer1;
  }

  String getAnswer6() {
    return questions[_questionIndex].answer1;
  }
  String getAnswer7() {
    return questions[_questionIndex].answer1;
  }
  String getAnswer8() {
    return questions[_questionIndex].answer1;
  }
  String getAnswer9() {
    return questions[_questionIndex].answer1;
  }

  String getAnswer10() {
    return questions[_questionIndex].answer1;
  }

 /* String getAnswer11() {
    return questions[_questionIndex].answer1;
  }

  String getAnswer12() {
    return questions[_questionIndex].answer1;
  }
  String getAnswer13() {
    return questions[_questionIndex].answer1;
  }

  String getAnswer14() {
    return questions[_questionIndex].answer1;
  }

  String getAnswer15() {
    return questions[_questionIndex].answer1;
  }

  String getAnswer16() {
    return questions[_questionIndex].answer1;
  }

  String getAnswer17() {
    return questions[_questionIndex].answer1;
  }

  String getAnswer18() {
    return questions[_questionIndex].answer1;
  }

  String getAnswer19() {
    return questions[_questionIndex].answer1;
  }

  String getAnswer20() {
    return questions[_questionIndex].answer1;
  }

  String getAnswer21() {
    return questions[_questionIndex].answer1;
  }

  String getAnswer22() {
    return questions[_questionIndex].answer1;
  }

  String getAnswer23() {
    return questions[_questionIndex].answer1;
  }

  String getAnswer24() {
    return questions[_questionIndex].answer1;
  }
  String getAnswer25() {
    return questions[_questionIndex].answer1;
  }

  String getAnswer26() {
    return questions[_questionIndex].answer1;
  }
  String getAnswer27() {
    return questions[_questionIndex].answer1;
  }

  String getAnswer28() {
    return questions[_questionIndex].answer1;
  }

  String getAnswer29() {
    return questions[_questionIndex].answer1;
  }

  String getAnswer30() {
    return questions[_questionIndex].answer1;
  }

  String getAnswer31() {
    return questions[_questionIndex].answer1;
  }

  String getAnswer32() {
    return questions[_questionIndex].answer1;
  }

  String getAnswer33() {
    return questions[_questionIndex].answer1;
  }
  String getAnswer34() {
    return questions[_questionIndex].answer1;
  }

  String getAnswer35() {
    return questions[_questionIndex].answer1;
  }
  String getAnswer36() {
    return questions[_questionIndex].answer1;
  }
  String getAnswer37() {
    return questions[_questionIndex].answer1;
  }
  String getAnswer38() {
    return questions[_questionIndex].answer1;
  }
  String getAnswer39() {
    return questions[_questionIndex].answer1;
  }
  String getAnswer340() {
    return questions[_questionIndex].answer1;
  }
*/
  // bonne réponse
  String getCorrectAnswer(){
    return questions[_questionIndex].correctAnswer;
  }

  bool isFinshed(){
    // 6 questions
    // 0 1 2 3 4 5
    if (_questionIndex >= questions.length - 1) {
      return true;
    }
    return false;
  }

  nextQuestion() {
    _questionIndex++;
  }
}