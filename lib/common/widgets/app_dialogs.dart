import '../../../common_imports.dart';

class AppDialog {
  AppDialog._();

  static showLoader() {
    Get.generalDialog(
        barrierDismissible: false,
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return Material(
            type: MaterialType.transparency,
            child: Center(
              child: Card(
                color: Colors.white,
                shape: 12.toRoundedRectRadius(),
                clipBehavior: Clip.antiAlias,
                child: Container(
                  width: 120,
                  height: 120,
                  color: Colors.white,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: max,
                    mainAxisAlignment: mainAxisCenter,
                    children: const [
                      CircularProgressIndicator(),
                      spaceV16,
                      Text(
                        "Loading...",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
