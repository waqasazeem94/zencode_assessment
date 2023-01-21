import 'package:zencode_assessment/all_utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  final bool _pinned = true;

  final bool _snap = true;

  final bool _floating = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Color(0xff14DC9C),
                elevation: 0,
                excludeHeaderSemantics: true,
                pinned: _pinned,
                snap: _snap,
                floating: _floating,
                actionsIconTheme: const IconThemeData(opacity: 0.0),
                expandedHeight: 170.0,
                title: const Text("Hi, John! "),
                flexibleSpace: FlexibleSpaceBar(
                  expandedTitleScale: 2.0,
                  titlePadding: const EdgeInsets.only(top: 30),
                  centerTitle: true,
                  title: SizedBox(
                    height: 95,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("€91.99", textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                ),
                actions: [
                  Image.asset("assets/scanner.png", height: 42, width: 42),
                  const SizedBox(width: 5),
                  Image.asset("assets/headphone.png", height: 42, width: 42),
                ],
                systemOverlayStyle: const SystemUiOverlayStyle(
                  systemNavigationBarColor: Color(0xff14DC9C),
                  statusBarColor: Color(0xff14DC9C),
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Container(
                          height: 40,
                          width: 70,
                          color: Color(0xff14DC9C),
                          child: Tab(text: "Tab 1")),
                      Tab(icon: Icon(Icons.lightbulb_outline), text: "Tab 2"),
                    ],
                  ),
                ),
                pinned: true,
                floating: true,
              ),
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
            ];
          },
          body: Container(
            color: Colors.white,
            child: const TabBarView(
              children: <Widget>[
                Text("FIRST TAB"),
                Text("SECOND TAB"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height + 100;

  @override
  double get maxExtent => _tabBar.preferredSize.height + 100;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: Column(
        children: [
          Container(
            height: 80,
            width: 100,
            child: Text("dajkdanks"),
          ),
          Container(
            child: _tabBar,
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}