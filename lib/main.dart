import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:kzn/bottom_nav/bottombar.dart';
import 'package:kzn/providers/blog_provider.dart';
import 'package:kzn/providers/course_provider.dart';
import 'package:kzn/providers/subscription_provider.dart';
import 'package:kzn/providers/user_provider.dart';
import 'package:kzn/ui/routes/about_route.dart';
import 'package:kzn/ui/routes/admin_login_route.dart';
import 'package:kzn/ui/routes/course_route.dart';
import 'package:kzn/ui/routes/enrollment_route.dart';
import 'package:kzn/ui/routes/login_route.dart';
import 'package:kzn/ui/routes/main_route.dart';
import 'package:kzn/ui/routes/privacy-policy.dart';
import 'package:kzn/ui/routes/subscription_check_route.dart';
import 'package:kzn/ui/routes/subscription_route.dart';
import 'package:kzn/ui/routes/tnc_route.dart';
import 'package:provider/provider.dart';

import 'controller/main_controller.dart';
import 'ui/routes/edit_courses.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling a background message ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.subscribeToTopic('enrollment');
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  print('User granted permission: ${settings.authorizationStatus}');

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => UserProvider()),
    ChangeNotifierProvider(create: (_) => CourseProvider()),
    ChangeNotifierProvider(create: (_) => SubscriptionProvider()),
    ChangeNotifierProvider(create: (_) => BlogProvider()),
    // ChangeNotifierProvider(create: (_) => VlogProvider()),
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void selectNotification(String? payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }
    await Get.toNamed(payload!);
  }

  Future<void> setUpForegroundNotification() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("@mipmap/ic_launcher");
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
            onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    //Initialization Setting
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    //Initialization and When user tap on notification,onSelectNotification callback is called.
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
    //OnSelectNotification Callback Function
////
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'Channel ID: 1',
      'your channel name',
      channelDescription: 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      sound: RawResourceAndroidNotificationSound('noti'),
      ticker: 'ticker',
    );
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: IOSNotificationDetails(sound: "noti.mp3"));
    //LIsten Notification
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      final noti = message.notification!;
      await flutterLocalNotificationsPlugin.show(
          0, //ID
          noti.title,
          noti.body,
          platformChannelSpecifics,
          payload: message.data["route"]);
    });
  }

  @override
  void initState() {
    super.initState();
    setUpForegroundNotification();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(MainController()); //Make Globle,
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "A 1 Online Learning Center",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: MainRoute.routeName,
        routes: {
          EditCourses.routeName: (contect) => EditCourses(),
          EnrollmentRoute.routeName: (context) => EnrollmentRoute(),
          AdminLoginRoute.routeName: (context) => AdminLoginRoute(),
          MainRoute.routeName: (context) => BottomBar(),
          LoginRoute.routeName: (context) => LoginRoute(),
          SubscriptionRoute.routeName: (context) => SubscriptionRoute(),
          CourseRoute.routeName: (context) => CourseRoute(),
          AboutRoute.routeName: (context) => AboutRoute(),
          TnCRoute.routeName: (context) => TnCRoute(),
          PrivacyPolicyRoute.routeName: (context) => PrivacyPolicyRoute(),
          SubscriptionCheckRoute.routeName: (context) =>
              SubscriptionCheckRoute()
        });
  }

  //For iOS App
  void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {
    Get.snackbar(title ?? "null", body ?? "null");
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
