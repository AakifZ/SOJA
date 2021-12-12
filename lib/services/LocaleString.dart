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
      'Settings': 'Ajustes',
      'Logout': 'Cerrar Sesión',
      'Privacy and Security': 'Privacidad y Seguridad',
      'Choose Your Language': 'Elige tu idioma',
      'Account': 'Cuenta',
      'Change Password': 'Cambia la contraseña',
      'FAQ': 'Preguntas más frecuentes',
      'Terms and Conditions': 'Términos y condiciones',
      'About': 'Acerca de',
      'Profile': 'Perfil',
      'General': 'General',
      'Dark Mode': 'Modo Oscuro'

    },
    //Hindi
    'hi_IN': {
      'hello': 'नमस्ते दुनिया',
      'Language': 'भाषा: हिन्दी',
      'Settings': 'समायोजन',
      'Logout': 'लॉग आउट',
      'Privacy and Security': 'गोपनीयता और सुरक्षा',
      'Choose Your Language': 'अपनी भाषा चुनिए',
      'Account': 'कारण',
      'Change Password': 'पासवर्ड बदलें',
      'FAQ': 'सामान्य प्रश्न',
      'Terms and Conditions': 'नियम और शर्तें',
      'About': 'के बारे में',
      'Profile': 'प्रोफ़ाइल',
      'General': 'आम',
      'Dark Mode': 'डार्क मोड'
    }

  };

}