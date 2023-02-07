import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:moderator_app/app/models/index.dart';
import 'package:moderator_app/app/modules/settings/controllers/settings_controller.dart';
import 'package:moderator_app/app/services/index.dart';
import 'package:timeago/timeago.dart';


class AppDependency {
  initLocationService(LocationService locationService) async {
    var locationService = Get.find<LocationService>();
    locationService.requestingLocation.value = true;
    await locationService.updateUserLocation(checkTimeout: false);
    locationService.requestingLocation.value = false;
  }

  inject() async {
    ByteData data = await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.cer');
    SecurityContext.defaultContext.setTrustedCertificatesBytes(data.buffer.asUint8List());
    final url = Platform.isIOS ? await getLibraryDirectory() : await getApplicationDocumentsDirectory();
    Hive
      ..init(url.path)
      ..registerAdapter(AuthAdapter())
      ..registerAdapter(UserAdapter())
      ..registerAdapter(PointAdapter())
      ..registerAdapter(InstitutionAdapter())
      ..registerAdapter(SectorAdapter())
      ..registerAdapter(ReportTypeAdapter())
      ..registerAdapter(ClusterAdapter())
      ..registerAdapter(CommentAdapter())
      ..registerAdapter(MediaAdapter())
      ..registerAdapter(ModerationHistoryAdapter())
      ..registerAdapter(NameableAdapter())
      ..registerAdapter(ReportStatusAdapter())
      ..registerAdapter(ReportFilterOptionAdapter())
      ..registerAdapter(AreaAdapter())
      ..registerAdapter(ReportAdapter())
      ..registerAdapter(ReportMarkerAdapter())
      ..registerAdapter(RoleAdapter())
      ..registerAdapter(HomePageDataAdapter())
      ..registerAdapter(StatusCountingAdapter())
      ..registerAdapter(MasterNotificationAdapter())
      ..registerAdapter(HtmlPageAdapter())
      ..registerAdapter(AssignmentOptionAdapter())
      ..registerAdapter(NotificationPresetAdapter());

    final authService = AuthService();
    final locationService = LocationService();

    await Future.wait([
      Get.putAsync(() => SettingsService().init()),
      Get.putAsync(() => authService.init()),
    ]);
    Get.put(locationService).init();
    Get.put(InformationService()).init();
    Get.put(SettingsController());

    // if (Platform.isIOS) {
    //   await Firebase.initializeApp(
    //     options: DefaultFirebaseOptions.currentPlatform,
    //   );
    // } else {
    //   await Firebase.initializeApp(
    //     name: 'service_tracker', // Don't use space or iOS will crash
    //     options: DefaultFirebaseOptions.currentPlatform,
    //   );
    // }
    // // await FirebaseAuth.instance.useAuthEmulator('10.0.2.2', 5554);
    // await initializeFCM();

    setLocaleMessages('km', KmMessages());
    authService.updateUser();
    initLocationService(locationService);
  }
}