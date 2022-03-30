import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:desktop_window/desktop_window.dart';
import 'package:lab_expert/HiveEntities/patient.dart';
import 'package:lab_expert/HiveEntities/user.dart';

import 'package:lab_expert/scaffolds/login_scaffold.dart';
import 'package:lab_expert/scaffolds/register_user_scaffold.dart';

import 'Constants/constants.dart';
import 'Singletons/global_hive_box.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    await DesktopWindow.setMaxWindowSize(const Size(1280, 720));
    await DesktopWindow.setMinWindowSize(const Size(720, 505));
  }

  await SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  await Hive.initFlutter();

  // const FlutterSecureStorage secureStorage = FlutterSecureStorage();
  //
  // String? hiveKey = await secureStorage.read(key: Constants.hiveKey);
  // if (hiveKey == null) {
  //   hiveKey = base64Encode(Hive.generateSecureKey());
  //   await secureStorage.write(key: Constants.hiveKey, value: hiveKey);
  // }

  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(PatientAdapter());

  GlobalHiveBox.adminUserBox = await Hive.openBox<User>(Constants.adminUsersVaultKey,
      /*encryptionCipher: HiveAesCipher(base64Decode(hiveKey))*/);

  GlobalHiveBox.regularUserBox = await Hive.openBox<User>(Constants.regularUsersVaultKey,
      /*encryptionCipher: HiveAesCipher(base64Decode(hiveKey))*/);

  GlobalHiveBox.patientsBox = await Hive.openBox<Patient>(Constants.patientVaultKey,
      /*encryptionCipher: HiveAesCipher(base64Decode(hiveKey))*/);

  if (GlobalHiveBox.adminUserBox!.isEmpty && GlobalHiveBox.regularUserBox!.isEmpty) {
    runApp(MaterialApp(
      home: const RegisterUserScaffold(firstPageNoUser: true,),
      theme: ThemeData.dark(),
    ));
  } else {
    runApp(MaterialApp(
      home: LoginScaffold(),
      theme: ThemeData.dark(),
    ));
  }
}
