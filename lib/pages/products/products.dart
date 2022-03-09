import 'package:sellr/common_imports.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          titleSpacing: 16,
          title: _searchField,
          centerTitle: true,
          leading: Hero(
            tag: "back",
            child: Material(
              type: MaterialType.transparency,
              child: IconButton(
                onPressed: () => Get.back(),
                icon: SvgPicture.asset(
                  Assets.svgIcBack,
                  color: Colors.white,
                  width: 28,
                  height: 28,
                ),
              ),
            ),
          ),
        ),
        body: productsList,
      ),
    );
  }

  Widget get _searchField {
    return Hero(
      tag: "search",
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          height: 48,
          decoration:
              BoxDecoration(color: Colors.white, borderRadius: 24.toRadius()),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  Assets.svgIcSearch,
                  color: Colors.black,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      hintText: "Search ...",
                    ),
                  ).alignCenterLeft(),
                ),
              ),
              // RawMaterialButton(
              //   onPressed: () {},
              //   child: const Icon(
              //     Icons.arrow_forward_rounded,
              //     color: Colors.white,
              //   ),
              //   fillColor: AppColors.colorPrimary,
              //   constraints: const BoxConstraints.tightFor(width: 48, height: 48),
              //   shape: const CircleBorder(),
              // )
            ],
          ),
        ),
      ),
    );
  }

  Widget get productsList {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 10 / 16,
        crossAxisSpacing: 8,
        mainAxisSpacing: 0,
      ),
      itemCount: 10,
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 16),
      itemBuilder: (context, index) {
        return _productCard(index);
      },
    );
  }

  Widget _productCard(int index) {
    return InkWell(
      onTap: () {
        Get.toNamed(NavigationPath.productDetailPage);
      },
      child: Card(
        elevation: 4,
        shape: 12.toRoundedRectRadius(),
        color: Colors.white,
        shadowColor: Colors.grey.withOpacity(0.3),
        margin: const EdgeInsets.only(bottom: 20),
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  color: Colors.grey.withOpacity(0.3),
                  child: Image.asset(
                    Assets.jpgProduct1,
                    fit: BoxFit.cover,
                    width: double.maxFinite,
                    height: double.maxFinite,
                  ),
                ),
              ),
              8.toVerticalSpace(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Ladies Fashion Garments",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  maxLines: 2, style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "\$ 599",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.colorPrimary,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
