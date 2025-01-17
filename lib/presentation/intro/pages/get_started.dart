import 'package:flutter/material.dart';
import 'package:smoothie_plays_mobile/core/configs%20/assets/app_image.dart';
import 'package:smoothie_plays_mobile/core/configs%20/theme/app_colors.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            // width: double.infinity,
            // height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      AppImages.introBG,
                    ))),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      'assets/images/logosmall.png',
                      width: 250,
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  'Enjoy Listening to Music with SM',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 21),
                Text(
                  'Welcome to the ultimate music streaming app . Get along with your favourite music at your hand. Stay tuned for new music',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey,
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                AppButton(
                  onPressed: () {},
                  title: 'Get Started',
                ),
              ],
            ),
          ),
          Container(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.15),
          )
        ],
      ),
    );
  }
}
