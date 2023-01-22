import 'package:zencode_assessment/all_utils.dart';

class FundsCollectionCard extends StatelessWidget {
  const FundsCollectionCard({
    Key? key,
    required this.path,
    required this.title,
    this.trailingWidget,
    this.subTitleWidget,
    this.balanceWidget,
    this.cardNumberWidget,
  }) : super(key: key);
  final String path;
  final String title;
  final Widget? trailingWidget;
  final Widget? subTitleWidget;
  final Widget? balanceWidget;
  final Widget? cardNumberWidget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
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
                        Column(
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
                        trailingWidget ?? const SizedBox(),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [balanceWidget ?? const SizedBox()],
                    ),
                    const SizedBox(height: 20,),
                  ],
                ),
              ),
              Column(
                children: [
                  const SizedBox(height: 10,),
                  Image.asset(
                    "assets/upload.png",
                    height: 90,
                  ),
                ],
              ),
            ],
          )),
    );
  }
}