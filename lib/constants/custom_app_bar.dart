import './../lib.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key, required this.heading});
  final String heading;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        heading,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          // Set text color
        ),
      ),
    );
  }
}
