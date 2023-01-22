import 'package:google_fonts/google_fonts.dart';
import 'package:zencode_assessment/all_utils.dart';

class AccountNumberRow extends StatelessWidget {
  const AccountNumberRow({
    Key? key,
    this.trailingWidget,
    this.leadingWidget,
  }) : super(key: key);
  final Widget? trailingWidget;
  final Widget? leadingWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        leadingWidget ??
            Text(" **** 2124",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.w300)),
        trailingWidget ??
            Text("06/25",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.w300))
      ],
    );
  }
}