import '../../../lib.dart';

class SingleReadView extends GetView<SingleReadController> {
  const SingleReadView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: _body,
    );
  }

  AppBar get _appBar => AppBar(
        title: Text(
          "Read Single Data",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      );

  Widget get _body => GetBuilder<SingleReadController>(
        initState: (state) async {
          await SingleFirestoreReadRepository.getDocSnap();
        },
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //*String
                _rowText(heading: "Name", value: controller.singleString),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    onPressed: controller.getSingleString,
                    text: 'String',
                  ),
                ),

                //*Int
                _rowText(
                    heading: 'Age',
                    value: controller.singelInt != null
                        ? controller.singelInt.toString()
                        : "N/A"),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    onPressed: controller.getSingleInt,
                    text: 'Int',
                  ),
                ),

                // //*Bool
                _rowText(
                    heading: 'Student',
                    value: controller.singleBool.toString()),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    onPressed: controller.getSingleBool,
                    text: 'Bool',
                  ),
                ),

                // //*Timestamp
                _rowText(
                    heading: 'TimeStamp',
                    value: controller.singleTimestamp != null
                        ? controller.singleTimestamp!.toDate().toString()
                        : "N/A"),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                      onPressed: controller.getsingleTimestamp,
                      text: 'TimeStamp'),
                ),

                // //*GeoPoint Latitude
                _rowText(
                    heading: 'Latitude',
                    value: controller.singleGeopoint != null
                        ? controller.singleGeopoint!.latitude.toString()
                        : 'N/A'),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                      onPressed: controller.getSingleGeopoint,
                      text: 'GeoPoint'),
                ),

                // //*GeoPoint Longitude
                _rowText(
                  heading: 'Longitude',
                  value: controller.singleGeopoint != null
                      ? controller.singleGeopoint!.longitude.toString()
                      : 'N/A',
                ),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                      onPressed: controller.getSingleGeopoint,
                      text: 'GeoPoint'),
                ),

                // * Array
                ...List.generate(
                  controller.singleArrayField?.length ?? 0,
                  (index) {
                    return _rowText(
                      heading: index.toString(),
                      value: controller.singleArrayField != null
                          ? (controller.singleArrayField![index])
                          : 'N/A',
                    );
                  },
                ),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                      onPressed: controller.getSingleArrayField,
                      text: 'Tap to get the array'),
                ),

                //*NestedObject
                TextButton(
                  onPressed: controller.getSingleNestedObject,
                  child: const Text('Nested Object'),
                ),
                _rowText(
                    heading: 'String Field',
                    value: controller.singleNestedObject != null
                        ? (controller.singleNestedObject!.nestedString)
                        : "N/A"),
                _rowText(
                    heading: 'Nested Number',
                    value: controller.singleNestedObject != null
                        ? (controller.singleNestedObject!.nestedNumber
                            .toString())
                        : "N/A"),
              ],
            ),
          );
        },
      );
}

Widget _rowText({
  required String heading,
  required String value,
}) =>
    Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //*
          Text(
            heading,
            overflow: TextOverflow.clip,
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
      ),
    );
