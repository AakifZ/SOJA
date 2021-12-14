import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:soja/screens/authenticate/rest.dart';
import 'package:soja/screens/authenticate/sign_in.dart';
import 'package:soja/services/auth.dart';
import 'package:soja/shared/constants.dart';
import 'package:soja/shared/loading.dart';


class deleteAccount extends StatefulWidget {

  final Function? toggleView;
  deleteAccount({this.toggleView});

  @override
  deleteAccountState createState() => deleteAccountState();
}

class deleteAccountState extends State<deleteAccount> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String error = '';
  String uid = "";

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      appBar: AppBar(
        title: Text("Delete Account?"),
      ),
            body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text('Delete Account'.tr),
                    onPressed: () {
                      Fluttertoast.showToast(
                          msg: "Account Deleted!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.purple,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                      //deleteUserAccount(email, password);
                      Navigator.pushAndRemoveUntil( context, MaterialPageRoute(builder: (context) => SignIn()), (Route<dynamic> route) => false, );
                    }
                  )
          ],
        ),
      );

  }

  void deleteUserAccount(String email, String pass) async{
      User user = (await _auth.user) as User;
      AuthCredential authen = EmailAuthProvider.credential(email: email, password: password);

    await user.reauthenticateWithCredential(authen).then((value) {
      value.user!.delete().then((res) {
        Get.offAll(SignIn());
        Get.snackbar("User Account Deleted", "Success");
      });
    }
    ).catchError((onError)=> Get.snackbar("Credential Error", "Aye yo, fix that"));

  }
}