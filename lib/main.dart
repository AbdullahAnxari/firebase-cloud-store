import 'lib.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FirebaseReadApp());
}

class FirebaseReadApp extends StatelessWidget {
  const FirebaseReadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          initialBinding: AppBinding(),
          title: 'Firebase read_cloud_store',
          debugShowCheckedModeBanner: false,
          home: const ReadCloudStoreView(),
        );
      },
    );
  }
}