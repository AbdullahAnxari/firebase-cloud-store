import '../../lib.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: _body,
    );
  }

  AppBar get _appBar => AppBar(
        title: const Text(
          'Firebase Cloud Store',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.deepPurpleAccent),
        ),
      );

  Widget get _body => GetBuilder<HomeController>(
        initState: (_) => controller.getConnectivity(),
        builder: (_) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 80,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => WriteView());
                      },
                      child: const Text("WriteCloudStore"),
                    ),
                  ),
                  SizedBox(height: 50.h),
                  SizedBox(
                    width: double.infinity,
                    height: 80,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => ReadView());
                      },
                      child: const Text("ReadCloudStore"),
                    ),
                  ),
                  SizedBox(height: 50.h),
                  SizedBox(
                    width: double.infinity,
                    height: 80,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => const SingleWriteView());
                      },
                      child: const Text("SingleWriteCloudStore"),
                    ),
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    width: double.infinity,
                    height: 80,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => const SingleReadView());
                      },
                      child: const Text("SingleReadCloudStore"),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
}
