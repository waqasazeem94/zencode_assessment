import 'package:zencode_assessment/all_utils.dart';

class AccountInfoCard extends StatelessWidget {
  const AccountInfoCard({
    Key? key,
    required this.path,
    required this.title,
    this.trailingWidget,
    this.subTitleWidget,
    this.balanceWidget,
    this.cardNumberWidget,
    this.balanceWidgetTrailing,
  }) : super(key: key);
  final String path;
  final String title;
  final Widget? trailingWidget;
  final Widget? subTitleWidget;
  final Widget? balanceWidget;
  final Widget? cardNumberWidget;
  final Widget? balanceWidgetTrailing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(path, scale: 3),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          subTitleWidget ?? const SizedBox()
                        ],
                      ),
                    ),
                    trailingWidget ?? const SizedBox(),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    balanceWidget ?? const SizedBox(),
                    balanceWidgetTrailing ?? const SizedBox()
                  ],
                ),
                const SizedBox(height: 5),
                cardNumberWidget ?? const SizedBox(),
                const SizedBox(height: 10),
              ],
            ),
          )),
    );
  }
}