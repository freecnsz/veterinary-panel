// import 'dart:convert';

// import 'package:flutter_boilerplate/models/user_model.dart';
// import 'package:flutter_boilerplate/shared_preferences/shared_preferences.dart';

// class Me{
//   Me._();
//   static final Me _instance = Me._();


//   User _myInfo = User();
//   User get myInfo => _myInfo;

//   set myInfo(User value) {
//     _myInfo = value;
//   }
//   Future<bool> logInAndSaveInfo(User myNewInfo) async {
//     try {
//       final SPService prefs = await SPService.getInstance();
//       await prefs.setString('myInfo', myNewInfo.toRawJson());
//       setMe = myNewInfo;
//       return true;
//     } on Exception {
//       return false;
//     }
//   }

//   Future<bool> get logOutAndSaveInfo async {
//     try {
//       final SPService prefs = await SPService.getInstance();
//       await prefs.setString('myInfo', "");
//       setMe =  User();
//       return true;
//     } on Exception {
//       return false;
//     }
//   }


// // otomatik oturum açma init state de çağırılacak
//   Future<bool> get autoLogIn async {
//     try {
//       final SPService prefs = await SPService.getInstance();
//       final String? savedInfo = prefs.getString('myInfo');
     
//       if (savedInfo != null && savedInfo != "") {
//         var mySavedInfo = User.fromJson(jsonDecode(savedInfo));
//         setMe = mySavedInfo;
//         return true;
//       } else {
//         return false;
//       }
//     } on Exception {
//       return false;
//     }
//   }
// }