
import 'package:zencode_assessment/all_utils.dart';

class TitleRow extends StatelessWidget {
  const TitleRow({
    Key? key,
    required this.title,
    this.trailingWidget,
  }) : super(key: key);
  final String title;
  final Widget? trailingWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        trailingWidget ?? const SizedBox(),
      ],
    );
  }
}