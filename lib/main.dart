import 'package:zencode_assessment/all_utils.dart';
import 'package:zencode_assessment/pages/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:zencode_assessment/pages/home/home_page.dart';
import 'package:zencode_assessment/utils/app_theme.dart';

void main() {
  runApp(const AppBarApp());
}

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.buildTheme(),
          home: child,
        );
      },
      child: BottomNavigation(),
    );
  }
}

class SettingsScreen extends StatelessWidget {

  const SettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(AppBar().preferredSize.height),
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  color: Colors.grey[200],
                ),
                child: TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    color: Colors.pink,
                  ),
                  tabs: const [
                    Tab(
                      text: 'Basic',
                    ),
                    Tab(
                      text: 'Advanced',
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text(
                'Basic Settings',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Center(
              child: Text(
                'Advanced Settings',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class SliverAppBarExample extends StatefulWidget {
  const SliverAppBarExample({super.key});

  @override
  State<SliverAppBarExample> createState() => _SliverAppBarExampleState();
}

class _SliverAppBarExampleState extends State<SliverAppBarExample> {
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;

// [SliverAppBar]s are typically used in [CustomScrollView.slivers], which in
// turn can be placed in a [Scaffold.body].
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: 160.0,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('SliverAppBar'),
              background: FlutterLogo(),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
              child: Center(
                child: Text('Scroll to see the SliverAppBar in effect.'),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.black12,
                  height: 100.0,
                  child: Center(
                    child: Text('$index', textScaleFactor: 5),
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: OverflowBar(
            overflowAlignment: OverflowBarAlignment.center,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text('pinned'),
                  Switch(
                    onChanged: (bool val) {
                      setState(() {
                        _pinned = val;
                      });
                    },
                    value: _pinned,
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text('snap'),
                  Switch(
                    onChanged: (bool val) {
                      setState(() {
                        _snap = val;
                        // Snapping only applies when the app bar is floating.
                        _floating = _floating || _snap;
                      });
                    },
                    value: _snap,
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text('floating'),
                  Switch(
                    onChanged: (bool val) {
                      setState(() {
                        _floating = val;
                        _snap = _snap && _floating;
                      });
                    },
                    value: _floating,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


const double borderRadius = 10.0;

class CustomSwitchState extends StatefulWidget {
  const CustomSwitchState({super.key});

  @override
  CustomSwitchStateState createState() => CustomSwitchStateState();
}

class CustomSwitchStateState extends State<CustomSwitchState>
    with SingleTickerProviderStateMixin {
  PageController? _pageController;
  int activePageIndex = 0;

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: _menuBar(context),
              ),
              Expanded(
                flex: 2,
                child: PageView(
                  controller: _pageController,
                  physics: const ClampingScrollPhysics(),
                  onPageChanged: (int i) {
                    FocusScope.of(context).requestFocus(FocusNode());
                    setState(() {
                      activePageIndex = i;
                    });
                  },
                  children: <Widget>[
                    ConstrainedBox(
                      constraints: const BoxConstraints.expand(),
                      child: const Center(
                        child: Text("Place Bid"),
                      ),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints.expand(),
                      child: Center(
                        child: Text("Buy Now"),
                      ),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints.expand(),
                      child: Center(
                        child: Text("Products"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget _menuBar(BuildContext context) {
    return Container(
      width: 300.0,
      height: 50.0,
      decoration: const BoxDecoration(
        color: Color(0XFFE0E0E0),
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(borderRadius)),
              onTap: _onPlaceBidButtonPress,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(vertical: 15),
                alignment: Alignment.center,
                decoration: (activePageIndex == 0)
                    ? const BoxDecoration(
                        color: Colors.green,
                        borderRadius:
                            BorderRadius.all(Radius.circular(borderRadius)),
                      )
                    : null,
                child: Text(
                  "Place Bid",
                  style: (activePageIndex == 0)
                      ? TextStyle(color: Colors.white)
                      : TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(borderRadius)),
              onTap: _onBuyNowButtonPress,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(vertical: 15),
                alignment: Alignment.center,
                decoration: (activePageIndex == 1)
                    ? const BoxDecoration(
                        color: Colors.green,
                        borderRadius:
                            BorderRadius.all(Radius.circular(borderRadius)),
                      )
                    : null,
                child: Text(
                  "Buy Now",
                  style: (activePageIndex == 1)
                      ? const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)
                      : const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              onTap: _onBuyProductsButtonPress,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(vertical: 15),
                alignment: Alignment.center,
                decoration: (activePageIndex == 2)
                    ? const BoxDecoration(
                        color: Colors.green,
                        borderRadius:
                            BorderRadius.all(Radius.circular(borderRadius)),
                      )
                    : null,
                child: Text(
                  "Products",
                  style: (activePageIndex == 2)
                      ? const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)
                      : const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onPlaceBidButtonPress() {
    _pageController?.animateToPage(0,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onBuyNowButtonPress() {
    _pageController?.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onBuyProductsButtonPress() {
    _pageController?.animateToPage(2,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }
}