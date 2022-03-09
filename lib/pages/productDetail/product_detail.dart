import 'package:sellr/common/colors.dart';
import 'package:sellr/common/widgets/common_button.dart';
import 'package:sellr/common_imports.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              width: double.maxFinite,
              height: screenSize.height / 2,
              child: Image.asset(
                Assets.jpgProduct1,
                width: double.maxFinite,
                fit: BoxFit.fitHeight,
              ),
            ),
            Positioned(
              top: 8,
              left: 8,
              right: 8,
              child: Row(
                children: [
                  RawMaterialButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: SvgPicture.asset(
                      Assets.svgIcBack,
                      color: Colors.white,
                      width: 32,
                      height: 32,
                    ),
                    fillColor: AppColors.colorPrimary,
                    constraints:
                        const BoxConstraints.tightFor(width: 48, height: 48),
                    shape: const CircleBorder(),
                  )
                ],
              ),
            ),
            Container(
              height: double.maxFinite,
              color: Colors.white,
              margin: EdgeInsets.only(
                  top: screenSize.height / 2, left: 24, right: 24),
              child: ListView(
                children: [
                  const SizedBox(height: 24),
                  Text(
                    "Ladies Fashion Garments",
                    style: Get.theme.textTheme.headline6,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Rs 599",
                    style: Get.theme.textTheme.headline6
                        ?.copyWith(color: AppColors.colorPrimary),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Arianna Classy American Crepe Women's Kurtis Vol 1 Fabric: American Crepe \nSleeves: Sleeves Are Included\nSize: S - 36 in, M - 38 in, L - 40 in, XL - 42 in, XXL - 44 in\nLength: Up To 46 In",
                    style: Get.theme.textTheme.bodyText2?.copyWith(height: 1.3),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: _shareButton,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget get _shareButton {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.share),
      label: const Text('Share on WhatsApp'),
      style: ElevatedButton.styleFrom(
        primary: Colors.green,
        fixedSize: const Size(300, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
