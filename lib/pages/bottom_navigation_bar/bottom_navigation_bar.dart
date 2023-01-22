import 'package:google_fonts/google_fonts.dart';
import 'package:zencode_assessment/all_screens.dart';
import 'package:zencode_assessment/all_utils.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  BottomNavigationState createState() => BottomNavigationState();
}

class BottomNavigationState extends State<BottomNavigation> {
  int pageIndex = 0;

  final pages = [
    const HomePage(),
    const Page2(),
    const Page3(),
    const Page4(),
    const Page5(),
  ];

  @override
  Widget build(BuildContext context) {
    const SystemUiOverlayStyle(
      systemNavigationBarColor: AppColors.bgColor,
      statusBarColor: AppColors.bgColor,
    );
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                  child: IconButton(
                      padding: EdgeInsets.zero,
                      enableFeedback: false,
                      onPressed: () {
                        setState(() {
                          pageIndex = 0;
                        });
                      },
                      icon: Image.asset(
                        "assets/home.png",
                        color: pageIndex == 0
                            ? AppColors.bgColor
                            : AppColors.greyColor,
                      )),
                ),
                Text(
                  "Home",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: pageIndex == 0
                          ? AppColors.bgColor
                          : AppColors.greyColor),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                  child: IconButton(
                      padding: EdgeInsets.zero,
                      enableFeedback: false,
                      onPressed: () {
                        setState(() {
                          pageIndex = 1;
                        });
                      },
                      icon: Image.asset(
                        "assets/activities.png",
                        color: pageIndex == 1
                            ? AppColors.bgColor
                            : AppColors.greyColor,
                      )),
                ),
                Text(
                  "Activities",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: pageIndex == 1
                          ? AppColors.bgColor
                          : AppColors.greyColor),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                  child: IconButton(
                      padding: EdgeInsets.zero,
                      enableFeedback: false,
                      onPressed: () {
                        setState(() {
                          pageIndex = 2;
                        });
                      },
                      icon: Image.asset(
                        "assets/actions.png",
                        color: pageIndex == 2
                            ? AppColors.bgColor
                            : AppColors.greyColor,
                      )),
                ),
                Text(
                  "Actions",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: pageIndex == 2
                          ? AppColors.bgColor
                          : AppColors.greyColor),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                  child: IconButton(
                      padding: EdgeInsets.zero,
                      enableFeedback: false,
                      onPressed: () {
                        setState(() {
                          pageIndex = 3;
                        });
                      },
                      icon: Image.asset(
                        "assets/offers.png",
                        color: pageIndex == 3
                            ? AppColors.bgColor
                            : AppColors.greyColor,
                      )),
                ),
                Text(
                  "Offers",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: pageIndex == 3
                          ? AppColors.bgColor
                          : AppColors.greyColor),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                  child: IconButton(
                      padding: EdgeInsets.zero,
                      enableFeedback: false,
                      onPressed: () {
                        setState(() {
                          pageIndex = 4;
                        });
                      },
                      icon: Image.asset(
                        "assets/morevert.png",
                        color: pageIndex == 4
                            ? AppColors.bgColor
                            : AppColors.greyColor,
                      )),
                ),
                Text(
                  "More",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: pageIndex == 4
                          ? AppColors.bgColor
                          : AppColors.greyColor),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Activities",
        style: GoogleFonts.poppins(
            color: AppColors.bgColor,
            fontWeight: FontWeight.w600,
            fontSize: 30),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Actions",
        style: GoogleFonts.poppins(
            color: AppColors.bgColor,
            fontWeight: FontWeight.w600,
            fontSize: 30),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Offers",
        style: GoogleFonts.poppins(
            color: AppColors.bgColor,
            fontWeight: FontWeight.w600,
            fontSize: 30),
      ),
    );
  }
}

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "More",
        style: GoogleFonts.poppins(
            color: AppColors.bgColor,
            fontWeight: FontWeight.w600,
            fontSize: 30),
      ),
    );
  }
}