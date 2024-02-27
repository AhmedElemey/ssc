import 'package:flutter/material.dart';
import 'package:ssc/src/features/bottom_nav_bar/presentation/pages/nav_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Image.asset(
              "assets/images/main_bg.png",
              width: screenWidth,
              height: screenHeight,
              fit: BoxFit.cover,
            ),
            Center(
              child: Container(
                width: screenWidth * 0.9,
                height: screenHeight * 0.67,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          "assets/images/NCM_logoW.png",
                        ),
                      ),
                      Center(
                        child: buildText("Login", Colors.indigoAccent,
                            FontWeight.w500, 32.0),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 4.0, bottom: 2),
                              child: buildText(
                                  "Username",
                                  Colors.indigo.shade400,
                                  FontWeight.w500,
                                  14.0),
                            ),
                            TextFormField(
                              controller: userNameController,
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                border: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                errorBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                filled: true,
                                fillColor:
                                    Colors.indigo.shade100.withOpacity(0.5),
                                isCollapsed: true,
                                suffixIconConstraints:
                                    const BoxConstraints(maxWidth: 45),
                                contentPadding: const EdgeInsets.only(
                                    top: 17, bottom: 15, right: 20),
                                //  suffixIcon: widget.suffixIcon,
                                hintText: "Sample Username",
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                        color: Colors.indigo.shade400),
                                prefix: const Padding(
                                    padding: EdgeInsets.only(left: 20.0)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 4.0, bottom: 2, top: 20),
                              child: buildText(
                                  "Password",
                                  Colors.indigo.shade400,
                                  FontWeight.w500,
                                  14.0),
                            ),
                            TextFormField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                border: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                errorBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                filled: true,
                                fillColor:
                                    Colors.indigo.shade100.withOpacity(0.5),
                                isCollapsed: true,
                                suffixIconConstraints:
                                    const BoxConstraints(maxWidth: 45),
                                contentPadding: const EdgeInsets.only(
                                    top: 17, bottom: 15, right: 20),
                                //  suffixIcon: widget.suffixIcon,
                                hintText: "*******",
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                        color: Colors.indigo.shade400),
                                prefix: const Padding(
                                    padding: EdgeInsets.only(left: 20.0)),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              width: screenWidth,
                              height: screenHeight * 0.07,
                              child: ElevatedButton(
                                onPressed: userNameController.text.isNotEmpty &&
                                        passwordController.text.isNotEmpty
                                    ? () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const BottomNavBar(),
                                          ),
                                        );
                                      }
                                    : () {},
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    shadowColor: Colors.black12,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    primary: Colors.indigo.shade400,
                                    onSurface: Colors.indigo.shade400),
                                child: Text(
                                  "Login",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: screenHeight / 20.6,
                            ),
                            Center(
                              child: buildText(
                                  "Forgot Password?",
                                  Colors.indigo.shade400,
                                  FontWeight.w500,
                                  14.0),
                            ),
                            SizedBox(
                              height: screenHeight / 40.6,
                            ),
                            Center(
                              child: RichText(
                                text: TextSpan(
                                  text: "Not a member? ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          overflow: TextOverflow.ellipsis,
                                          color: Colors.indigo.shade400),
                                  children: [
                                    TextSpan(
                                      text: " Register",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              overflow: TextOverflow.ellipsis,
                                              color: Colors.blue),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Text buildText(text, color, fontWeight, size) {
    return Text(
      text,
      style: TextStyle(color: color, fontWeight: fontWeight, fontSize: size),
    );
  }
}
