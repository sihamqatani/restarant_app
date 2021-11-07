import 'package:flutter/material.dart';
import 'package:restarant_app/modules/sign_in/sign_in.dart';
import 'package:restarant_app/shared/components/components.dart';
import 'package:restarant_app/shared/networks/local/cash_helper/cash_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingModel {
  String image;
  String title;
  String body;
  OnBoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

var boardController = PageController();

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool isLast = false;
  List<OnBoardingModel> onBoardingmodel = [
    OnBoardingModel(
        title: 'وجبات متعددة',
        body: 'اطلب الان وعيش الطعم الحقيقي',
        image: 'assets/images/31.jpg'),
    OnBoardingModel(
        title: 'عصائرطازجة ',
        body: 'بضغطه زر جرب الانتعاش',
        image: 'assets/images/2.png'),
    OnBoardingModel(
        title: 'حلويات',
        body: 'عيش طعم الحلا الاصلي ',
        image: 'assets/images/33.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        /* appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () {
                submitData();
              },
              child: Text('ابدأ'),
            ),
          ],
        ),*/
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
              child: PageView.builder(
                  onPageChanged: (value) {
                    if (value == onBoardingmodel.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                      print('isLast');
                      submitData();
                    } else {
                      print('is not last');
                      setState(() {
                        isLast = false;
                      });
                    }
                  },
                  itemCount: onBoardingmodel.length,
                  controller: boardController,
                  itemBuilder: (context, index) {
                    return buildBoardItem(onBoardingmodel[index]);
                  }),
            ),
            SizedBox(
              height: 30,
            ),
            SmoothPageIndicator(
              effect: SwapEffect(
                activeDotColor: Colors.red[200]!,
                spacing: 10,
                dotColor: Colors.grey,
              ),
              controller: boardController,
              count: onBoardingmodel.length,
            ),
            SizedBox(
              height: 24,
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                decoration: ShapeDecoration(
                  shape: StadiumBorder(),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.pink[300]!, Colors.red[200]!],
                  ),
                ),
                child: MaterialButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: StadiumBorder(),
                    child: Text(
                      'ابدأ الان',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          wordSpacing: 2,
                          letterSpacing: 2,
                          fontFamily: 'Cairo'),
                    ),
                    onPressed: () {
                      submitData();
                    }))

            /* Row(
              children: [
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      submitData();
                    } else {
                      boardController.nextPage(
                          duration: Duration(microseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.red[200],
                )
              ],
            )*/
          ]),
        ),
      ),
    );
  }

  void submitData() {
    CashHelper.saveData(key: 'onBoarding', value: true).then((value) {
      print('hello');
      navigateAndFinish(context, SignIn());
    });
  }

  Widget buildBoardItem(OnBoardingModel onBoardingmodel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Image(
            image: AssetImage(
              onBoardingmodel.image,
            ),
            fit: BoxFit.cover,
          )),
          SizedBox(
            height: 20,
          ),
          Text(
            onBoardingmodel.title,
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: Colors.red[300]),
          ),
          SizedBox(
            height: 20,
          ),
          Text(onBoardingmodel.body,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  ?.copyWith(color: Colors.red[100], fontSize: 14)),
        ],
      ),
    );
  }
}
