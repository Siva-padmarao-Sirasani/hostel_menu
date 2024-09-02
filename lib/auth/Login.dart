import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:water_delivery/auth/Otp.dart';
import 'package:water_delivery/constants/AppGallery.dart';
import 'package:water_delivery/constants/appColors.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();

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
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    children: [
                      Text('Enter Mobile Number',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
                      Text('Please Login For Booking Your Water Order',style: TextStyle(fontSize: 15.0),),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20.0),
                  child: SvgPicture.asset(
                    AppSvgs.log,
                    height: size.width * .75,
                    width: size.width * .75,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: 62.0,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                        child: Center(child: Text('+91')),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: phoneController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                            hintText: 'Enter phone number',
                          ),
                          maxLength: 10,
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    Get.to(()=>OtpScreen(phoneNumber: phoneController.text));
                  },
                  child: Container(
                    height: 40.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: AppColors.secondaryColor,
                    ),
                    child: Center(child: Text("Send Otp",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0,),)),
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
