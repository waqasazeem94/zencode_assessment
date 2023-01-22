import 'package:google_fonts/google_fonts.dart';
import 'package:zencode_assessment/all_utils.dart';

class GiftCard extends StatelessWidget {
  const GiftCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 2,
        child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            // padding:
            //     const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10)),
                          color: AppColors.greenColor,
                          image: DecorationImage(
                              image: AssetImage(
                                "assets/gift2.png",
                              ),
                              scale: 3)),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Zero free first purchase",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'For new users. ',
                            style: GoogleFonts.poppins(
                                fontSize: 12, color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Learn more',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                          decoration: TextDecoration.underline,
                                          color: AppColors.greenColor),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // navigate to desired screen
                                    }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.close,
                        size: 30,
                      ),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}