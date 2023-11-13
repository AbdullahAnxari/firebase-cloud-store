import './../../../lib.dart';

class SingleWriteView extends GetView<SingleWriteController> {
  const SingleWriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: _body,
    );
  }

  AppBar get _appBar => AppBar(
        title: const Text(
          'SingleWriteView',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            // Set text color
          ),
        ),
      );

  Widget get _body => GetBuilder<SingleWriteController>(builder: (_) {
        // print("Data in controller: ${controller.someData}");
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                //* Write Singel String Field
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: _customField(
                        labelText: 'E-Mail',
                        controller: controller.singleStringController,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                          // width: double.infinity,
                          height: 50,
                          child: CustomButton(
                              onPressed: () async {
                                if (controller
                                    .singleStringController.text.isNotEmpty) {
                                  controller.setSingleString(
                                    stringField: controller
                                        .singleStringController.text
                                        .toString(),
                                  );
                                }
                              },
                              text: 'create')),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                //* Write Singel int Field
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: _customField(
                        labelText: 'Number String',
                        controller: controller.singleArrayController,
                        keyboardType: TextInputType.text,
                        obscureText: false,
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                          // width: double.infinity,
                          height: 50,
                          child: CustomButton(
                              onPressed: () async {
                                if (controller
                                    .singleNumberController.text.isNotEmpty) {
                                  controller.setSingleNum(
                                    numField: int.tryParse(controller
                                        .singleNumberController.text)!,
                                  );
                                }
                              },
                              text: 'create')),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                //* Write Singel Bool Field
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 50,
                        child: Text(
                          'Boolean Value',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(flex: 3),
                    Expanded(
                      flex: 2,
                      child: Switch(
                        value: controller.boolValue,
                        onChanged: (value) =>
                            controller.changeBooloeanValue(value: value),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                //* Write Singel TimeStamp Field
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: _customField(
                        labelText: 'Timestamp Field',
                        controller: controller.singleTimestampController,
                        keyboardType: TextInputType.text,
                        obscureText: false,
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        // width: double.infinity,
                        height: 50,
                        child: CustomButton(
                            onPressed: () async {
                              if (controller
                                  .singleTimestampController.text.isNotEmpty) {
                                controller.setSingleTimestamp(
                                  timestamp:
                                      Timestamp.fromMillisecondsSinceEpoch(
                                    int.tryParse(controller
                                            .singleTimestampController.text) ??
                                        0,
                                  ),
                                );
                              }
                            },
                            text: 'Time'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                //*GeoField
                Row(
                  children: [
                    Expanded(
                      child: _customField(
                        labelText: 'Add Latitude',
                        controller: controller.singleGeoFieldLatitudeController,
                        keyboardType: TextInputType.number,
                        obscureText: false,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: _customField(
                        labelText: 'Add Logitude',
                        controller: controller.singleGeoFieldLogitudeController,
                        keyboardType: TextInputType.text,
                        obscureText: false,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                //*GeoField Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: CustomButton(
                      onPressed: () async {
                        if (controller.singleGeoFieldLatitudeController.text
                                .isNotEmpty &&
                            controller.singleGeoFieldLogitudeController.text
                                .isNotEmpty) {
                          // double latitude =
                          controller.setSingleGeofield(
                              latitude: double.parse(controller
                                  .singleGeoFieldLatitudeController.text),
                              longitude: double.parse(controller
                                  .singleGeoFieldLogitudeController.text));
                        }
                      },
                      text: 'GeoField'),
                ),

                //*Nested field
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: _customField(
                        labelText: 'Name String',
                        controller: controller.singelNestedStringController,
                        keyboardType: TextInputType.number,
                        obscureText: false,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: _customField(
                        labelText: 'Number String',
                        controller: controller.singleNestedNumberController,
                        keyboardType: TextInputType.text,
                        obscureText: false,
                      ),
                    ),
                  ],
                ),
                
                SizedBox(height: 10.h),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: CustomButton(
                      onPressed: () async {
                        if (controller
                                .singelNestedStringController.text.isNotEmpty &&
                            controller
                                .singleNestedNumberController.text.isNotEmpty) {
                          // double latitude =
                          controller.setsingleNestedField(
                              name:
                                  controller.singelNestedStringController.text,
                              age:
                                  controller.singleNestedNumberController.text);
                        }
                      },
                      text: 'Neseted'),
                ),
                SizedBox(height: 10.h),

                //*Reference
                _customField(
                  labelText: 'Reference Field',
                  controller: controller.singleReferenceController,
                  keyboardType: TextInputType.text,
                  obscureText: false,
                ),

                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: CustomButton(
                      onPressed: () async {
                        String referenceText =
                            controller.singleReferenceController.text.trim();
                        if (referenceText.isNotEmpty) {
                          ReferenceField reference =
                              ReferenceField(referencePath: referenceText);
                          controller.setSingleRefenceField(refName: reference);
                        }
                      },
                      text: 'refence'),
                ),
              ],
            ),
          ),
        );
      });

  Widget _customField({
    required String labelText,
    TextEditingController? controller,
    required TextInputType keyboardType,
    required bool obscureText,
  }) =>
      TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        style: TextStyle(fontSize: 16.sp),
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          contentPadding: EdgeInsets.all(12.0),
        ),
      );

  Widget _customButton({
    required VoidCallback? onPressed,
    required String buttonText,
  }) =>
      TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          elevation: 3.0,
        ),
        child: const Text("Create"),
      );
}
