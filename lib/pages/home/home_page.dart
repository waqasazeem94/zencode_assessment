import 'package:google_fonts/google_fonts.dart';
import 'package:zencode_assessment/all_screens.dart';
import 'package:zencode_assessment/all_utils.dart';
import 'package:zencode_assessment/pages/home/components/account_number_row.dart';
import 'package:zencode_assessment/pages/home/components/title_row.dart';
import 'package:zencode_assessment/widgets/funds_Collection_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bool _pinned = true;

  final bool _snap = true;

  final bool _floating = true;

  int floatingAppBarIndex = 0;
  late ScrollController controller;

  @override
  void initState() {
    super.initState();
    floatingAppBarIndex = 0;
    controller = ScrollController()..addListener(onScroll);
  }

  void onScroll() {
    double scrollOffset = controller.offset;
    if (scrollOffset > 80) {
      floatingAppBarIndex = 1;
      setState(() {});
    } else {
      floatingAppBarIndex = 0;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: DefaultTabController(
        length: 3,
        child: Container(
          color: AppColors.bgColor,
          child: NestedScrollView(
            controller: controller,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  backgroundColor: AppColors.bgColor,
                  elevation: 0,
                  excludeHeaderSemantics: true,
                  pinned: _pinned,
                  snap: _snap,
                  floating: _floating,
                  actionsIconTheme: const IconThemeData(opacity: 0.0),
                  expandedHeight: 170.0,
                  title: Text("Hi, John! ",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: Colors.white)),
                  flexibleSpace: FlexibleSpaceBar(
                    expandedTitleScale: 2.0,
                    titlePadding: const EdgeInsets.only(top: 30),
                    centerTitle: true,
                    title: SizedBox(
                      height: 50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          floatingAppBarIndex == 0
                              ? Text(
                                  "Available Balance",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w300, fontSize: 8),
                                )
                              : const SizedBox(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "₾ 4,562.52",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                              const Icon(Icons.keyboard_arrow_down,
                                  size: 15, color: Colors.white),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    Image.asset("assets/scanner.png", height: 42, width: 42),
                    const SizedBox(width: 10),
                    Image.asset("assets/headphone.png", height: 42, width: 42),
                    const SizedBox(width: 10),
                  ],
                  systemOverlayStyle: const SystemUiOverlayStyle(
                    systemNavigationBarColor: AppColors.bgColor,
                    statusBarColor: AppColors.bgColor,
                  ),
                ),
                SliverPersistentHeader(
                  delegate: _SliverAppBarDelegate(
                    PreferredSize(
                      preferredSize:
                          Size.fromHeight(AppBar().preferredSize.height + 10),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        elevation: 2,
                        child: SizedBox(
                          height: 42,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              color: Colors.white,
                            ),
                            child: TabBar(
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.black,
                              unselectedLabelStyle:
                                  Theme.of(context).textTheme.headlineMedium,
                              labelStyle:
                                  Theme.of(context).textTheme.headlineMedium,
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                color: AppColors.greenColor,
                              ),
                              tabs: const [
                                Tab(text: 'Accounts'),
                                Tab(text: 'Crypto'),
                                Tab(text: 'NFT')
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  pinned: true,
                  floating: true,
                ),
              ];
            },
            body: Container(
              color: AppColors.greyBgColor,
              child: TabBarView(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          TitleRow(
                            title: "My Cards",
                            trailingWidget: TextButton(
                              onPressed: () {},
                              child: Text(
                                "+ Get a Card",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(color: AppColors.greenColor),
                              ),
                            ),
                          ),
                          AccountInfoCard(
                            path: "assets/gelcard.png",
                            title: "My Mastercard in GEL",
                            trailingWidget: Image.asset(
                              "assets/mastercard.png",
                              scale: 3,
                            ),
                            balanceWidget: Text(
                              " ₾ 2,562.52",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            cardNumberWidget: const AccountNumberRow(),
                          ),
                          const SizedBox(height: 10),
                          AccountInfoCard(
                            path: "assets/eur.png",
                            title: "My VISA in EUR",
                            trailingWidget: Image.asset(
                              "assets/visa.png",
                              scale: 3,
                            ),
                            balanceWidget: Text(
                              " € 562.52",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            cardNumberWidget: const AccountNumberRow(),
                          ),
                          const SizedBox(height: 10),
                          const TitleRow(title: "Collecting Funds"),
                          const SizedBox(height: 10),
                          FundsCollectionCard(
                            path: "assets/donations.png",
                            title: "My Startup Donations",
                            subTitleWidget: Text(
                              " Donations (50)",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w300, fontSize: 12),
                            ),
                            balanceWidget: Text(
                              " € 562.52",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                          ),
                          const SizedBox(height: 10),
                          TitleRow(
                            title: "Other",
                            trailingWidget: TextButton(
                              onPressed: () {},
                              child: Text(
                                "+ Link",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(color: AppColors.greenColor),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          AccountInfoCard(
                            path: "assets/tbccard.png",
                            title: "My TBC Card",
                            trailingWidget: Image.asset(
                              "assets/mastercard.png",
                              scale: 3,
                            ),
                            balanceWidget: Text(
                              "BOGB12341213412345678",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(color: Colors.black),
                            ),
                            cardNumberWidget: const AccountNumberRow(),
                          ),
                          const SizedBox(height: 10),
                          AccountInfoCard(
                            path: "assets/bogcard.png",
                            title: "My BOG Card",
                            trailingWidget: Image.asset(
                              "assets/visa.png",
                              scale: 3,
                            ),
                            balanceWidget: Text(
                              "BOGB12341213412345678",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(color: Colors.black),
                            ),
                            cardNumberWidget: const AccountNumberRow(),
                          ),
                          const SizedBox(height: 10),
                          AccountInfoCard(
                            path: "assets/tbccard.png",
                            title: "My TBC Account",
                            balanceWidget: Text(
                              "BOGB12341213412345678",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(color: Colors.black),
                            ),
                            balanceWidgetTrailing: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                RichText(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  text: TextSpan(
                                    text: '55.60 ',
                                    style: GoogleFonts.poppins(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'EUR',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall
                                            ?.copyWith(
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            cardNumberWidget: const AccountNumberRow(
                              trailingWidget: Text("₾ 136.22"),
                              leadingWidget: SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
                  const Center(child: Text("SECOND TAB")),
                  const Center(child: Text("THIRD TAB")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final PreferredSize _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height + 80;

  @override
  double get maxExtent => _tabBar.preferredSize.height + 80;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.greyBgColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          )),
      child: Column(
        children: [
          const GiftCard(),
          _tabBar,
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

// SliverAppBar(
//   backgroundColor: Colors.white,
//   elevation: 0,
//   expandedHeight: 100.0,
//   shape: ContinuousRectangleBorder(
//       borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(50),
//           topRight: Radius.circular(50))),
//   pinned: true,
//   primary: false,
//   flexibleSpace: FlexibleSpaceBar(
//     expandedTitleScale: 2.0,
//     titlePadding: const EdgeInsets.only(top: 30),
//     centerTitle: true,
//     title: Column(
//       children: [
//         Container(
//           height: 80,
//           width: 100,
//           color: Colors.green,
//         ),
//         Align(
//           alignment: Alignment.center,
//           child: TabBar(
//             labelColor: Colors.white,
//             unselectedLabelColor: Colors.grey,
//             tabs: [
//               Container(
//                   height: 40,
//                   width: 70,
//                   color: Color(0xff14DC9C),
//                   child: Tab(text: "Tab 1")),
//               Tab(
//                   icon: Icon(Icons.lightbulb_outline),
//                   text: "Tab 2"),
//             ],
//           ),
//         ),
//       ],
//     ),
//   ),
// ),
// SliverPadding(
//   padding: const EdgeInsets.all(1.0),
//   sliver: SliverList(
//     delegate: SliverChildListDelegate([
//       Container(
//         height: 80,
//         width: 100,
//         color: Colors.green,
//       ),
//       Container(
//         color: Colors.white,
//         child: const TabBar(
//           labelColor: Colors.black87,
//           unselectedLabelColor: Colors.grey,
//           tabs: [
//             Tab(icon: Icon(Icons.info), text: "Tab 1"),
//             Tab(
//                 icon: Icon(Icons.lightbulb_outline),
//                 text: "Tab 2"),
//           ],
//         ),
//       ),
//     ]),
//   ),
// ),