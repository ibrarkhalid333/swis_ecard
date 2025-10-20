import 'package:swisecard/src/auth/screens/login_screen.dart';
import 'package:swisecard/src/auth/screens/signup_screen.dart';
import 'package:swisecard/src/auth/screens/test_screen.dart';
import 'package:swisecard/src/dashboard/dashboard.dart';
import 'package:swisecard/src/ecard/screens/create_ecard.dart';
import 'package:swisecard/src/ecard/screens/manage_ecard.dart';
import 'package:swisecard/src/edit-card/screens/analytics.dart';
import 'package:swisecard/src/edit-card/screens/basic_info.dart';
import 'package:swisecard/src/edit-card/screens/card_settings.dart';
import 'package:swisecard/src/edit-card/screens/ecard_services.dart';
import 'package:swisecard/src/edit-card/screens/edit_profile.dart';
import 'package:swisecard/src/edit-card/screens/edit_theme.dart';
import 'package:swisecard/src/edit-card/screens/media.dart';
import 'package:swisecard/src/edit-card/screens/qr_code.dart';
import 'package:swisecard/src/edit-card/screens/save_in_contact.dart';

class AppRoutes {
  static final dashBoard = Dashboard();
  static const createEcard = CreateEcard();
  static const manageEcard = ManageEcard();
  static const editBasicInfo = EditBasicInfo();
  static const saveInContact = SaveInContact();
  static const editMedia = EditMedia();
  static const editServices = EditServices();
  static const editProfile = EditProfile();
  static const editTheme = EditTheme();
  static const qrCode = QrCode();
  static final analytixs = Analytics();
  static final cardSettings = CardSettings();
  static final signUp = SignupScreen();
  static final login = LoginScreen();
  static final testScreen = TestScreen();
}
