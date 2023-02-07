import 'dart:convert';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:moderator_app/app/constants/index.dart';
import 'package:moderator_app/app/models/index.dart';
import 'package:moderator_app/app/repositories/index.dart';
import 'package:moderator_app/app/routes/app_pages.dart';
import 'package:moderator_app/app/services/index.dart';
import 'package:moderator_app/firebase_options.dart';
import 'package:moderator_app/locales/index.dart';
import 'package:moderator_app/app/extensions/index.dart';

enum ReceiveNotificationType {
  foreground,
  background,
  openApp,
  initialApp,
}

initializeFCM() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // await messaging.setAutoInitEnabled(true);

  setupToken();

  await messaging.setForegroundNotificationPresentationOptions(
    alert: true, // Required to display a heads up notification
    badge: true,
    sound: true,
  );

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
  } else {
    print('User declined or has not accepted permission');
  }

  FirebaseMessaging.onMessage.listen(firebaseMessagingForegroundHandler);

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  await setupInteractedMessage();
}

revokeFcmToken() {
  FirebaseMessaging.instance.deleteToken();
}

updateFcmTokenOnDatabase() async {
  String? token = await FirebaseMessaging.instance.getToken();

  if (token != null) {
    saveFcmTokenToDatabase(token);
  }
}

saveFcmTokenToDatabase(String token) {
  // Send to server
  try {
    final notificationRepository = NotificationRepository();
    notificationRepository.saveToken(token: token);
  } catch (e) {
    print("Sending FCM token $e");
  }
}

onUpdateFcmToken(String token) async {
  print("Token is $token");
  final authService = Get.find<AuthService>();
  if (authService.isLoggedIn) {
    saveFcmTokenToDatabase(token);
  }
}

Future<void> setupToken() async {
  // Get the token each time the application loads
  String? token = await FirebaseMessaging.instance.getToken();

  await manageTopicSubscription();

  if (token != null) {
    // Save the initial token to the database
    await onUpdateFcmToken(token);
  }

  // Any time the token refreshes, store this in the database too.
  FirebaseMessaging.instance.onTokenRefresh.listen(onUpdateFcmToken);
}

void navigatePageFromPayload(String? payload) async {
  bool isLoggedIn = false;
  try {
    final authService = Get.find<AuthService>();
    isLoggedIn = authService.isLoggedIn;
  } catch (e) {
    print(e);
  }

  if (isLoggedIn) {
    try {
      Map jsonPayload = jsonDecode(payload!);
      dynamic data = jsonPayload['data'];

      final informationService = Get.find<InformationService>();

      if (data is String) {
        data = jsonDecode(data);
      }

      try {
        var route = jsonDecode(jsonPayload['routing']);
        if (route['name'] is String) {
          if (AppPages.routes.any((page) => page.name == route['name'])) {
            if (informationService.splashScreenLoaded) {
              Get.toNamed(
                route['name'],
                arguments: route['arguments'],
                preventDuplicates: false,
              );
            } else {
              informationService.navigateNotification = () {
                Get.toNamed(
                  route['name'],
                  arguments: route['arguments'],
                  preventDuplicates: false,
                );
              };
            }
            return;
          }
        }
      } catch (e) {
        print(e);
      }

      // int id = data['id'];
      if (data['master'] != null) {
        final master = MasterNotification.fromJson(data['master']);
        if (master.notificationableType == 'App\\Models\\Report') {
          if (informationService.splashScreenLoaded) {
            Get.toNamed(
              Routes.routeReportDetail,
              arguments: {
                'id': master.notificationableId,
              },
              preventDuplicates: false,
            );
          } else {
            informationService.navigateNotification = () {
              Get.toNamed(
                Routes.routeReportDetail,
                arguments: {
                  'id': master.notificationableId,
                },
                preventDuplicates: false,
              );
            };
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }
}

void onDidReceiveLocalNotification(int id, String? title, String? body, String? payload) async {
  // display a dialog with the notification details, tap ok to go to another page
  if (Get.context != null && (title != null || body != null)) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: title?.text,
        content: body?.text,
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text(
              LocaleKeys.button_view_detail,
            ),
            onPressed: () async {
              navigatePageFromPayload(payload);
            },
          )
        ],
      ),
    );
  }
}

void onSelectNotification(String? payload) async {
  if (payload != null) {
    debugPrint('notification payload: $payload');
  }
  navigatePageFromPayload(payload);
}

onDidReceiveNotificationResponse(NotificationResponse notificationResponse) async {
  switch (notificationResponse.notificationResponseType) {
    case NotificationResponseType.selectedNotification:
      print("payload no action:");
      print(notificationResponse.payload);
      onSelectNotification(notificationResponse.payload);
      break;
    case NotificationResponseType.selectedNotificationAction:
      print("payload with action:");
      print(notificationResponse.payload);
      // if (notificationResponse.actionId == navigationActionId) {
      onSelectNotification(notificationResponse.payload);
      // }
      break;
  }
}

String? selectedNotificationPayload;

displayNotificationForForegroundMessage(RemoteMessage message) async {
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;

  // If `onMessage` is triggered with a notification, construct our own
  // local notification to show to users using the created channel.
  if (notification != null && android != null) {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // name
      description: 'This channel is used for important notifications.', // description
      importance: Importance.max,
      playSound: true,
    );

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);

    final NotificationAppLaunchDetails? notificationAppLaunchDetails = !kIsWeb && Platform.isLinux ? null : await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
    if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
      selectedNotificationPayload = notificationAppLaunchDetails!.notificationResponse?.payload;
    }

    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('icon_notif');
    const DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings(
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );
    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
      onDidReceiveBackgroundNotificationResponse: onDidReceiveNotificationResponse,
    );

    await flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          icon: android.smallIcon,
          playSound: true,
          color: AppColors.primaryColor,
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker',
          visibility: NotificationVisibility.public,
          // other properties...
        ),
      ),
      payload: jsonEncode(message.data),
    );
  }
}

increaseNotificationCount() async {
  try {
    final informationService = Get.find<InformationService>();
    informationService.increaseNotificationCount();
  } catch (_) {}
}

handleMessage(ReceiveNotificationType type, RemoteMessage message) {
  print("Receive notification type $type");
  if (type == ReceiveNotificationType.foreground) {
    displayNotificationForForegroundMessage(message);
  } else if (type == ReceiveNotificationType.openApp || type == ReceiveNotificationType.initialApp) {
    onSelectNotification(jsonEncode(message.data));
  } else if (type == ReceiveNotificationType.background) {
    // Do nothing on background
  }

  increaseNotificationCount();
  print(message.messageId);
  print(message.data);
  print(message.notification);
}

handleOpenAppMessage(RemoteMessage message) async {
  await handleMessage(ReceiveNotificationType.openApp, message);
}

Future<void> firebaseMessagingForegroundHandler(RemoteMessage message) async {
  handleMessage(ReceiveNotificationType.foreground, message);
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  handleMessage(ReceiveNotificationType.background, message);
}

manageTopicSubscription() async {
  await FirebaseMessaging.instance.subscribeToTopic('moderator');
  // await FirebaseMessaging.instance.unsubscribeFromTopic('weather');
}

Future<void> setupInteractedMessage() async {
  // Get any messages which caused the application to open from
  // a terminated state.
  RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

  // If the message also contains a data property with a "type" of "chat",
  // navigate to a chat screen
  if (initialMessage != null) {
    handleMessage(ReceiveNotificationType.initialApp, initialMessage);
  }

  // Also handle any interaction when the app is in the background via a
  // Stream listener
  FirebaseMessaging.onMessageOpenedApp.listen(handleOpenAppMessage);
}
