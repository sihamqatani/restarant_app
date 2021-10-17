import 'package:flutter/material.dart';
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
        title: 'Screen 1',
        body: 'we have tasty foods',
        image: 'assets/images/31.jpg'),
    OnBoardingModel(
        title: 'Screen 2',
        body: 'we have tasty foods',
        image: 'assets/images/2.png'),
    OnBoardingModel(
        title: 'Screen 3',
        body: 'we have tasty foods',
        image: 'assets/images/33.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {},
            child: Text('Skip'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          Expanded(
            child: PageView.builder(
                onPageChanged: (value) {
                  if (value == onBoardingmodel.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                    print('isLast');
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
          Row(
            children: [
              SmoothPageIndicator(
                effect: SwapEffect(
                  activeDotColor: Colors.red[200]!,
                  spacing: 10,
                  dotColor: Colors.grey,
                ),
                controller: boardController,
                count: onBoardingmodel.length,
              ),
              Spacer(),
              FloatingActionButton(
                onPressed: () {},
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.white,
                ),
                backgroundColor: Colors.red[200],
              )
            ],
          )
        ]),
      ),
    );
  }

  Widget buildBoardItem(OnBoardingModel onBoardingmodel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
