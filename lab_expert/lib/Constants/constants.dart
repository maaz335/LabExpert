import 'package:uuid/uuid.dart';

class Constants {
  static const String _hiveKey = "bf06c232-6291-432a-a548-8e4d8428b65e";
  static const String _regularUsersVaultKey = "regular_users";
  static const String _adminUsersVaultKey = "admin_users";
  static const String _patientVaultKey = "patients";
  static const String _reportTemplateVaultKey = "report_template";
  static const String _patientReportsVaultKey = "patient_reports";

  static const String _secretFileName = "4fd16ce1-f972-4dfd-bd7c-d23da490cced";

  static String get hiveKey => _hiveKey;
  static String get regularUsersVaultKey => _regularUsersVaultKey;
  static String get adminUsersVaultKey => _adminUsersVaultKey;
  static String get patientVaultKey => _patientVaultKey;
  static String get reportTemplateVaultKey => _reportTemplateVaultKey;
  static String get patientReportsVaultKey => _patientReportsVaultKey;

  static String get secretFileName => _secretFileName;
}