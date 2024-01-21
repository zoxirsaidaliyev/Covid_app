import 'package:covid_app/screen/home_screen1.dart';
import 'package:flutter/material.dart';
import 'package:covid_app/parametres/parametr.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  double width = 0;
  double heigth = 0;
  double boxHeigth = 10;
  int page = 0;
  PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    heigth = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SafeArea(child: SizedBox()),
          Container(
            margin: EdgeInsets.only(top: 20),
            alignment: Alignment.center,
            child: Text(
              'COVID Advices',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(height: heigth * 0.05),
          Expanded(
            child: PageView(
                controller: controller,
                physics: const BouncingScrollPhysics(),
                onPageChanged: (value) {
                  setState(() {
                    page = value;
                  });
                },
                children: List.generate(data.length, (index) {
                  return getOnboarding(data[index]);
                })),
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(data.length, (index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: page == index ? Colors.black : Colors.black.withOpacity(0.2),
                ),
              );
            }),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
              style: ButtonStyle(
                minimumSize: const MaterialStatePropertyAll(Size(56, 56)),
                backgroundColor: const MaterialStatePropertyAll(Colors.black),
                shape: MaterialStateProperty.all(ContinuousRectangleBorder(borderRadius: BorderRadius.circular(24))),
              ),
              onPressed: () {
                if (page != data.length - 1) {
                  setState(() {
                    page++;
                    controller.animateToPage(page, duration: const Duration(milliseconds: 400), curve: Curves.linear);
                  });
                } else {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
                }
              },
              child: const Icon(Icons.navigate_next)),
          SizedBox(height: heigth * 0.07),
        ],
      ),
    );
  }

  getOnboarding(Models models) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(models.image, fit: BoxFit.fill, height: heigth * 0.35),
        Text(models.subTitle, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(models.title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
        ),
      ],
    );
  }
}
