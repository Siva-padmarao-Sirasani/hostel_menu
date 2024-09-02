// /// Author: Shaik Mobin
// /// Created on : 30/12/23
//
// import"package:flutter/material.dart";
// import "package:flutter/services.dart";
// import "package:flutter_svg/flutter_svg.dart";
// import "package:get/get.dart";
// import "package:get/get_core/src/get_main.dart";
// import "package:water_delivery/constants/AppStyles.dart";
// import "package:water_delivery/constants/appColors.dart";
// import "package:water_delivery/screens/Widgets/CustomText.dart";
//
//
// class SignUp extends StatefulWidget {
//   const SignUp({Key? key}) : super(key: key);
//
//   @override
//   State<SignUp> createState() => _SignUpState();
// }
//
// class _SignUpState extends State<SignUp> {
//   TextEditingController mailController = TextEditingController();
//   String? selectedGender;
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController nameController = TextEditingController();
//   TextEditingController ageController = TextEditingController();
//   TextEditingController houseController = TextEditingController();
//   TextEditingController apartmentController = TextEditingController();
//   // final UserController userController =Get.find<UserController>();
//   // ApartmentController apartmentController = Get.find<ApartmentController>();
//   final _formKey = GlobalKey<FormState>();
//
//   //
//   Future _signup( Map<String, dynamic> userData) async {
//     if(_formKey.currentState?.validate()??false){
//       //     // Apartment? apartment = await verifyApartmentCode();
//       //
//       //     if (apartment!=null) {
//       //       await userController.customerRegister(userData: userData,apartment: apartment );
//     } else {
//       ToastService.showToast("Invalid Apartment Code");
//     }
//     //
//   }
//   //
//
//   // Future<Apartment?> verifyApartmentCode() async {
//   //   String code = apartmentCodeController.text.trim();
//   //   debugPrint("Entered Apartment Code : $code");
//   //   Apartment? apartment = await apartmentController.getApartmentByCode(apartmentCode:code );
//   //
//   //   return apartment;
//   // }
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         centerTitle: false,
//         titleSpacing: 0,
//         iconTheme: const IconThemeData(color: AppColors.whiteColor),
//         leadingWidth: 55,
//
//         leading: InkWell(
//           onTap: () {
//             Get.back();
//           },
//           borderRadius: BorderRadius.circular(80),
//           child: Container(
//             padding: const EdgeInsets.all(6),
//             margin: const EdgeInsets.symmetric(horizontal: 8),
//             decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.primaryColor),
//             child: const Center(child: Icon(Icons.keyboard_backspace_rounded,color: AppColors.whiteColor,)),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 6),
//         child: ListView(
//           shrinkWrap: true,
//           children: [
//             Form(
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//
//                   /// Sign up image
//                   // SvgPicture.asset(
//                   //   AppSvgs.signup,
//                   //   height: size.width * .6,
//                   //   width: size.width * .6,
//                   // ),
//                   const SizedBox(height: 16),
//                   CTextField(
//                     controller: nameController,
//                     labelText: 'Name',
//                     validator: (v) {
//                       if (v == null || v.isEmpty) {
//                         return 'Please enter your name';
//                       } else if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(v)) {
//                         return 'Name can only contain letters and spaces';
//                       } else {
//                         return null;
//                       }
//                     },
//                   ),
//                   const SizedBox(height: 16),
//                   CTextField(
//                     controller: ageController,
//                     labelText: 'Age',
//                     validator: (v) {
//                       if (v == null || v.isEmpty) {
//                         return 'Please enter your age';
//                       } else {
//                         int age = int.tryParse(v) ?? 0;
//                         if (age < 18 || age > 110) {
//                           return 'Age must be between 18 and 110';
//                         } else {
//                           return null;
//                         }
//                       }
//                     },
//                   ),
//                   const SizedBox(height: 16),
//
//
//                   SizedBox(
//                     height: 45,
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(8.0),
//                               border: Border.all(
//                                 color: Colors.grey, // Adjust the color as needed
//                               ),
//                             ),
//                             child: InkWell(
//                               onTap: () {
//                                 setState(() {
//                                   selectedGender = 'Male';
//                                 });
//                               },
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   const Padding(
//                                     padding: EdgeInsets.only(left: 12.0),
//                                     child: Text('Male'),
//                                   ),
//                                   Radio(
//                                     value: 'Male',
//                                     groupValue: selectedGender,
//                                     onChanged: (value) {
//                                       setState(() {
//                                         selectedGender = value;
//                                       });
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 12,),
//                         Expanded(
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(8.0),
//                               border: Border.all(
//                                 color: Colors.grey, // Adjust the color as needed
//                               ),
//                             ),
//                             child: InkWell(
//                               onTap: () {
//                                 setState(() {
//                                   selectedGender = 'Female';
//                                 });
//                               },
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   const Padding(
//                                     padding: EdgeInsets.only(left: 12.0),
//                                     child: Text('Female'),
//                                   ),
//                                   Radio(
//                                     value: 'Female',
//                                     groupValue: selectedGender,
//                                     onChanged: (value) {
//                                       setState(() {
//                                         selectedGender = value;
//                                       });
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.baseline,
//                     textBaseline: TextBaseline.alphabetic,
//                     children: [
//                       Baseline(
//                         baseline: 30,
//                         baselineType: TextBaseline.alphabetic,
//                         child: Container(
//                           height: 46,
//                           padding: const EdgeInsets.symmetric(horizontal: 12),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(8.0),
//                             border: Border.all(
//                               color: Colors.grey, // Adjust the color as needed
//                             ),
//                           ),
//                           child: Center(
//                             child: Text(
//                               '+91',
//                               style: AppStyles.semiBoldText(),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 8),
//                       Expanded(
//                         child: CTextField(
//                           controller: phoneController,
//                           labelText: 'Phone',
//                           maxLength: 10,
//                           inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                           validator: (v) {
//                             if (v == null || v.isEmpty) {
//                               return 'Please enter a phone number';
//                             } else if (!RegExp(r"^[0-9]{1,10}$").hasMatch(v)) {
//                               return 'Please enter a valid phone number with up to 10 digits';
//                             } else {
//                               return null;
//                             }
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//
//
//
//
//
//                   const SizedBox(height: 16),
//                   CTextField(
//                     controller: mailController,
//                     labelText: 'Email (Optional)',
//                     validator: (v) {
//                       if (v != null && v.isNotEmpty) {
//                         if (!RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b').hasMatch(v)) {
//                           return 'Please enter a valid email';
//                         }
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 16),
//                   CTextField(
//                     // controller: apartmentCodeController,
//                     labelText: 'Apartment Code',
//                     maxLength: 6,
//                     validator: (v) {
//                       if (v == null || v.isEmpty) {
//                         return 'Please enter Apartment Code';
//                       } else if (v.length != 6) {
//                         return 'Please enter a valid code';
//                       } else {
//                         return null;
//                       }
//                     },
//                   ),
//                   const SizedBox(height: 40),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: ElevatedButton(
//                       onPressed: () async {
//
//                         // Validate the form
//                         if (_formKey.currentState?.validate() ?? false) {
//                           Map<String, dynamic> userData = {
//                             'mail': mailController.text.trim(),
//                             'gender': selectedGender,
//                             'phone': phoneController.text,
//                             'name': nameController.text.trim(),
//                             'age': int.tryParse(ageController.text) ?? 0,
//                             // 'apartmentCode': apartmentCodeController.text.trim(),
//                             'housenumber':houseController,
//                             'apartment/Opposition Name':apartmentController,
//                           };
//                           await _signup(userData);
//
//                           print('User Data: $userData');
//                         }
//                       },
//                       child: const Text('Sign Up'),
//
//                     ),
//                   ),
//                   const SizedBox(height: 60),
//
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }