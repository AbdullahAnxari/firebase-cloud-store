import './../lib.dart';

//* Custom button widget
class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
    final TextEditingController stringController = TextEditingController();

   CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}