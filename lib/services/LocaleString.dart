import 'package:get/get.dart';

class LocalString extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {

    //English
    'en_US': {
      'hello': 'Hello World',
    },
    //Spanish
    'es_SP': {
      'hello': "Hola Mundo",
      'Language': 'Cambia Idíoma',
      'Settings': 'Ajustes'
    },
    //Hindi
    'hi_IN': {
      'hello': 'नमस्ते दुनिया',
      'Language': 'भाषा: हिन्दी',
      'Settings': 'समायोजन'
    }

  };

}