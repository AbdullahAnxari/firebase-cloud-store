import '../../../lib.dart';


class ReadView extends GetView<ReadController> {
  ReadView({super.key});
  final TextEditingController stringFieldController = TextEditingController();
  final WriteController writeController = WriteController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: _body,
    );
  }

  AppBar get _appBar => AppBar(
        title: Text(
          "Read Data",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      );

  Widget get _body => GetBuilder<ReadController>(
        builder: (_) {
          return   SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    //* Write String
                    _customField(
                      labelText: 'E-Mail',
                      controller: stringFieldController,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                    ),
                    TextButton(
                      onPressed: () async {
                        if (stringFieldController.text.isNotEmpty) {
                          final newData = writeController.write.copyWith(
                            stringField: stringFieldController.text.toString(),
                          );
                        writeController.setData(newData: newData);
                        }
                      },
                      child: const Text("Create"),
                    ),

                    //*Reading data 
                    TextButton(
                      onPressed: controller.fetchData,
                      child: const Text("Fetch"),
                    ),
                    _rowText(
                        heading: "Name",
                        value: controller.read.stringField ?? "N/A"),
                    _rowText(
                        heading: "Age",
                        value:
                            (controller.read.numberField ?? "N/A").toString()),
                    _rowText(
                        heading: "IsDeveloper",
                        value:
                            (controller.read.booleanField ?? "N/A").toString()),
                    _rowText(
                        heading: "FSc",
                        value: controller.read.nestedObject != null
                            ? (controller.read.nestedObject!.nestedString!)
                            : "N/A"),
                    _rowText(
                        heading: "Matric",
                        value: controller.read.nestedObject != null
                            ? (controller.read.nestedObject!.nestedNumber!)
                            : "N/A"),
                    _jobExperienceList(),
                    _rowText(
                        heading: "Today Time:",
                        value: controller.read.timestampField != null
                            ? (controller.read.timestampField!
                                .toDate()
                                .toString())
                            : "N/A"),
                    _rowText(
                        heading: "Current Location Lat:",
                        value: controller.read.geopointField != null
                            ? (controller.read.geopointField!.latitude
                                .toString())
                            : "N/A"),
                    _rowText(
                        heading: "Current Location Lng:",
                        value: controller.read.geopointField != null
                            ? (controller.read.geopointField!.longitude
                                .toString())
                            : "N/A"),
                  ],
                ),
              ),
            ),
          );
        },
      );

  Widget _rowText({
    required String heading,
    required String value,
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //*
          Text(
            heading,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
            ),
          ),
          //
          SizedBox(width: 16.w),

          //*
          Text(value)
        ],
      );

  Widget _jobExperienceList() {
    if (controller.read.arrayField == null) {
      return const Text("N/A");
    } else if (controller.read.arrayField!.isEmpty) {
      return const Text("Job Experience is Empty");
    } else {
      return Column(
        children: [
          Text(
            "JobExperience: ",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
            ),
          ),
          ...List.generate(
            controller.read.arrayField!.length,
            (index) => Text(
              controller.read.arrayField![index],
            ),
          )
        ],
      );
    }
  }

  Widget _customField(
          {required String labelText,
          TextEditingController? controller,
          required TextInputType keyboardType,
          required bool obscureText}) =>
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
