import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water_delivery/constants/AppGallery.dart';
import 'package:water_delivery/constants/appColors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  int _bottomNavIndex = 0;
  var pageController = PageController();

  // Variable to hold the currently displayed image
  String? _selectedImage;

  String? _selectedContainer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe5fff2),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Text(
                        'Mobin',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xff15e27d),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your Location',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'Guntur',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color(0xff078c49),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.location_on_outlined),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
                  child: Container(
                    height: 150.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      gradient: const LinearGradient(
                        colors: [Color(0xff2fba53), Color(0xff67e15d)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: const Image(
                        image: AssetImage(AppImages.wat),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: CContainer("1 Lt", AppImages.oneLt),
                      ),
                      CContainer("2 Lt", AppImages.tw),
                      CContainer("5 Lt", AppImages.fiv),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: CContainer("20 Lt", AppImages.twen),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 60,
              child: Container(
                height: 300.0,
                decoration: const BoxDecoration(
                  color: AppColors.whiteColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            // Display the selected image here
                            if (_selectedImage != null)
                              Expanded(
                                child: Image.asset(
                                  _selectedImage!,
                                  height: 150.0,
                                  width: 150.0,
                                  fit: BoxFit.contain,
                                ),
                              ),
                          ],
                        ),
                      ),
                      SizedBox(width: 15.0,),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: AppColors.greyColor.withOpacity(.30),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              buildInkWellContainer("Mobin", "1L", AppImages.oneLt),
                              buildInkWellContainer("Mobin", "2L", AppImages.tw),
                              buildInkWellContainer("Mobin", "5L", AppImages.fiv),
                              buildInkWellContainer("Mobin", "20L", AppImages.twen),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.secondaryColor.withOpacity(0.30),
        child: Image(
          image: AssetImage(AppImages.sub1),
        ),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: AppColors.secondaryColor.withOpacity(0.50),
        elevation: 0,
        splashColor: AppColors.appGreen,
        icons: const [
          CupertinoIcons.house_fill,
          // CupertinoIcons.phone,
          CupertinoIcons.cart,
          // CupertinoIcons.profile_circled,

        ],
        inactiveColor: AppColors.whiteColor,
        activeColor: AppColors.primaryColor,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        gapWidth: 50,
        notchSmoothness: NotchSmoothness.smoothEdge,
        leftCornerRadius: 0,
        rightCornerRadius: 0,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
            pageController.jumpToPage(index);
          });
        },
      ),
    );
  }

  Widget buildInkWellContainer(String name, String volume, String image) {
    bool isSelected = _selectedContainer == image;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedImage = image;
          _selectedContainer = image;
        });
      },
      child: Container(
        width: 100.0,
        padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: isSelected ? AppColors.secondaryColor : Colors.transparent,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(name, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            Text(volume, style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }

  Widget CContainer(String label, String app) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 70.0,
          width: 70.0,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image(
              image: AssetImage(app),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          label,
          style: const TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            color: Colors.orangeAccent,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}
