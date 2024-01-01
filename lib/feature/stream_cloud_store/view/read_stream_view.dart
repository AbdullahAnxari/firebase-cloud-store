import '../../../lib.dart';

class ReadStreamView extends GetView<StreamViewController> {
  const ReadStreamView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: _body,
    );
  }

  AppBar get _appBar => AppBar(
        title: const Text('ReadStreamView'),
      );

  Widget get _body => GetBuilder<StreamViewController>(initState: (_) {
        controller.listenChanges();
      }, builder: (_) {
        return Stack(   
          children: [
            controller.isLoading
                ? const Center(child: CircularProgressIndicator())
                : SafeArea(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Column(
                            children: [
                              const Text(
                                'Read Data from cloud',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              Container(
                                height: 250,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: Column(
                                  children: [
                                    Text(
                                        'My string is ${controller.newModel.stringField!}'),
                                    Text(
                                        'My string is ${controller.newModel.numberField!}'),
                                    Text(controller
                                        .newModel.geopointField!.latitude
                                        .toString()),
                                    Text(controller
                                        .newModel.geopointField!.longitude
                                        .toString()),
                                    Text(controller.newModel.booleanField
                                        .toString()),
                                    Text(controller.newModel.arrayField
                                        .toString()),
                                    Text(controller
                                        .newModel.nestedObject!.nestedNumber
                                        .toString()),
                                    Text(controller
                                        .newModel.nestedObject!.nestedString
                                        .toString()),
                                  ],
                                ),
                              ),
                              const Text(
                                'Write data to cloud store',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              _customForm,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        );
      });

  //*Form
  Widget get _customForm => Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'What your name',
                labelText: 'Name',
              ),
              onChanged: (value) {},
              controller: controller.name,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "PLease enter the text";
                }

                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'What your age',
                labelText: 'age',
              ),
              controller: controller.age,
              onChanged: (value) {},
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "PLease enter the text";
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (controller.name.text.isNotEmpty &&
                    controller.age.text.isNotEmpty) {
                  ScaffoldMessenger.of(Get.context!).showSnackBar(
                    const SnackBar(
                      content: Text('Sending data to firestore'),
                    ),
                  );
                  final newData = controller.newModel.copyWith(
                    stringField: controller.name.text,
                    numberField: int.parse(controller.age.text),
                  );
                  controller.setCloudFireStream(data: newData);
                }
              },
              child: const Text('Submit'),
            )
          ],
        ),
      );
}
