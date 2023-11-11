import './../../../lib.dart';

// ignore: must_be_immutable
class WriteView extends GetView<WriteCloudStore> {
  WriteView({super.key});

  static TextEditingController stringController = TextEditingController();
  static TextEditingController arrayController = TextEditingController();
  static TextEditingController booleanController = TextEditingController();
  static TextEditingController nestedObjectController = TextEditingController();
  static TextEditingController numberController = TextEditingController();
  static TextEditingController referenceController = TextEditingController();
  static TextEditingController timestampController = TextEditingController();

  bool isSwitchOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: _body,
    );
  }

  AppBar get _appBar => AppBar(
        title: Text(
          "Write Data",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      );

  Widget get _body => GetBuilder<WriteCloudStore>(
        builder: (_) {
          return SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //*String Field
                    _customField(
                      labelText: 'E-Mail',
                      controller: stringController,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                    ),
                    SizedBox(height: 10.h),
                    //* Array Field
                    _customField(
                      labelText: 'Array Field',
                      controller: arrayController,
                      keyboardType: TextInputType.text,
                      obscureText: false,
                    ),
                    SizedBox(height: 10.h),

                    //*Number Field
                    _customField(
                      labelText: 'Number Field',
                      controller: numberController,
                      keyboardType: TextInputType.number,
                      obscureText: false,
                    ),
                    SizedBox(height: 10.h),

                    //*TimeStamp
                    _customField(
                      labelText: 'Timestamp Field',
                      controller: timestampController,
                      keyboardType: TextInputType.text,
                      obscureText: false,
                    ),
                    SizedBox(height: 10.h),
                    TextButton(
                      onPressed: () async {
                        if (
                            //*
                            stringController.text.isNotEmpty &&
                                arrayController.text.isNotEmpty &&
                                // booleanController.text
                                // nestedObjectController
                                numberController.text.isNotEmpty &&
                                // referenceController
                                timestampController.text.isNotEmpty
                            // nestedObject
                            // geopoint
                            //*
                            ) {
                          final newData = controller.write.copyWith(
                            stringField: stringController.text.toString(),
                            arrayField: [arrayController.text.toString()],
                            numberField: int.tryParse(numberController.text),
                            timestampField:
                                Timestamp.fromMillisecondsSinceEpoch(
                              int.tryParse(timestampController.text) ?? 0,
                            ),
                          );
                          controller.setData(newData: newData);
                        }
                      },
                      child: const Text("Create"),
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
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(),
        ),
      );
}
