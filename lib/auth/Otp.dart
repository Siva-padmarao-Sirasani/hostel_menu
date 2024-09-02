import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:water_delivery/constants/AppGallery.dart';
import 'package:water_delivery/constants/appColors.dart';
import 'package:water_delivery/screens/HomeScreen.dart';

class OtpScreen extends StatelessWidget {
  final String phoneNumber;
  final List<TextEditingController> otpControllers = List.generate(6, (_) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());

  OtpScreen({required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 28.0, bottom: 40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Enter Otp", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 35.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(6, (index) {
                      return Container(
                        height: 45.0,
                        width: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: AppColors.secondaryColor.withOpacity(.10),
                        ),
                        child: TextField(
                          controller: otpControllers[index],
                          focusNode: focusNodes[index],
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
                            counterText: '',
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              if (index + 1 != otpControllers.length) {
                                FocusScope.of(context).requestFocus(focusNodes[index + 1]);
                              } else {
                                FocusScope.of(context).unfocus();
                              }
                            } else if (value.isEmpty && index != 0) {
                              FocusScope.of(context).requestFocus(focusNodes[index - 1]);
                            }
                          },
                        ),
                      );
                    }),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't Receive Otp?",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                    TextButton(
                      onPressed: () {
                        // Add resend OTP logic here
                      },
                      child: Text(
                        "ReSend",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: AppColors.orangeColor.withOpacity(0.80),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0, top: 10.0),
                  child: InkWell(
                    onTap: () {
                      bool isOtpValid = otpControllers.every((controller) => controller.text.isNotEmpty);
                      if (isOtpValid) {
                        // Assume OTP is verified successfully
                        Get.offAll(() => Home());
                      }
                    },
                    child: Container(
                      height: 40.0,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: AppColors.secondaryColor,
                      ),
                      child: Center(
                        child: Text(
                          'Verify OTP',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20.0),
                  child: SvgPicture.asset(
                    AppSvgs.ot,
                    height: size.width * .75,
                    width: size.width * .75,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
