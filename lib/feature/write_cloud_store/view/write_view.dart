import './../../../lib.dart';

// ignore: must_be_immutable
class WriteView extends GetView<WriteController> {
  WriteView({super.key});

  bool isSwitchOn = false;
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
          primaryColor: Colors.blue,
          hintColor: Colors.blueAccent,
        ),
        child: Scaffold(
          appBar: _appBar,
          body: _body,
        ));
  }

  AppBar get _appBar => AppBar(
        title: Text(
          "Write Data",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            // Set text color
          ),
        ),
      );

  Widget get _body => GetBuilder<WriteController>(
        builder: (_) {
          return SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    // //*String Field
                    _customField(
                      labelText: 'E-Mail',
                      controller: controller.stringController,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                    ),
                    const SizedBox(height: 10),
                    //* Array Field
                    _customField(
                      labelText: 'Array Strings',
                      controller: controller.arrayController,
                      keyboardType: TextInputType.text,
                      obscureText: false,
                    ),
                    SizedBox(height: 10.h),

                    //*Number Field
                    _customField(
                      labelText: 'Number Field',
                      controller: controller.numberController,
                      keyboardType: TextInputType.number,
                      obscureText: false,
                    ),
                    SizedBox(height: 10.h),

                    //*TimeStamp
                    _customField(
                      labelText: 'Timestamp Field',
                      controller: controller.timestampController,
                      keyboardType: TextInputType.text,
                      obscureText: false,
                    ),
                    const SizedBox(height: 20),
                    //*GeoField
                    Row(
                      children: [
                        Expanded(
                          child: _customField(
                            labelText: 'Add Latitude',
                            controller: controller.geoFieldLatitudeController,
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
                            controller: controller.geoFieldLogitudeController,
                            keyboardType: TextInputType.text,
                            obscureText: false,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    //*Nested field
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: _customField(
                            labelText: 'Name String',
                            controller: controller.nestedString1Controller,
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
                            controller: controller.nestedString2Controller,
                            keyboardType: TextInputType.text,
                            obscureText: false,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 10.h),

                    //*Switch
                    Switch(
                      value: controller.boolValue,
                      onChanged: (value) =>
                          controller.changeBooloeanValue(value: value),
                    ),

                    //*Reference
                    _customField(
                      labelText: 'Reference Field',
                      controller: controller.referenceController,
                      keyboardType: TextInputType.text,
                      obscureText: false,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: TextButton(
                        onPressed: () async {
                          if (
                              //*
                              controller.stringController.text.isNotEmpty &&
                                  controller.arrayController.text.isNotEmpty &&
                                  controller
                                      .booleanController.text.isNotEmpty &&
                                  controller.numberController.text.isNotEmpty &&
                                  controller
                                      .timestampController.text.isNotEmpty &&
                                  controller.nestedString1Controller.text
                                      .isNotEmpty &&
                                  controller.nestedString2Controller.text
                                      .isNotEmpty &&
                                  controller.geoFieldLatitudeController.text
                                      .isNotEmpty &&
                                  controller.geoFieldLogitudeController.text
                                      .isNotEmpty &&
                                  controller.referenceController.text.isNotEmpty

                              // nestedObject
                              // geopoint
                              //*
                              ) {
                            final newData = controller.write.copyWith(
                              stringField:
                                  controller.stringController.text.toString(),
                              arrayField: [
                                controller.arrayController.text.toString()
                              ],
                              geopointField: GeoPoint(
                                double.parse(
                                    controller.geoFieldLatitudeController.text),
                                double.parse(
                                    controller.geoFieldLatitudeController.text),
                              ),
                              nestedObject: NestedReadObject(
                                nestedNumber:
                                    controller.nestedString1Controller.text,
                                nestedString:
                                    controller.nestedString1Controller.text,
                              ),
                              numberField: int.tryParse(
                                  controller.numberController.text),
                              timestampField:
                                  Timestamp.fromMillisecondsSinceEpoch(
                                int.tryParse(
                                        controller.timestampController.text) ??
                                    0,
                              ),
                              booleanField: bool.tryParse(
                                  controller.booleanController.text),
                              referenceField: ReferenceField(
                                  referencePath:
                                      controller.referenceController.text),
                            );
                            controller.setData(newData: newData);
                          }
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          elevation: 3.0,
                        ),
                        child: const Text("Create"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );

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
}
