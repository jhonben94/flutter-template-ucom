// ignore_for_file: avoid_function_literals_in_foreach_calls, library_private_types_in_public_api, deprecated_member_use

import 'package:finpay/config/images.dart';
import 'package:finpay/controller/login_controller.dart';
import 'package:finpay/view/login/otp_auth_screen.dart';
import 'package:finpay/view/login/password_recovery_screen.dart';
import 'package:finpay/view/signup/signup_screen.dart';
import 'package:finpay/view/tab_screen.dart';
import 'package:finpay/widgets/custom_button.dart';
import 'package:finpay/widgets/custom_textformfield.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../config/textstyle.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginController = Get.put(LoginController());
  final List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
  ];

  @override
  void initState() {
    loginController.isVisible.value = false;
    _focusNodes.forEach((node) {
      node.addListener(() {
        setState(() {});
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return false;
        },
        child: InkWell(
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            color: AppTheme.isLightTheme == false
                ? const Color(0xff15141F)
                : const Color(0xffFFFFFF),
            child: Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: AppBar().preferredSize.height,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const Icon(Icons.arrow_back),
                  const SizedBox(
                    height: 38,
                  ),
                  Text(
                    "Bienvenido!",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                        ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Ingrese a cuenta",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: const Color(0xffA2A0A8),
                        ),
                  ),

                  Expanded(
                    child: ListView(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        Column(
                          children: [
                            const SizedBox(height: 30),
                            Obx(() {
                              return CustomTextFormField(
                                focusNode: _focusNodes[0],
                                prefix: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: SvgPicture.asset(
                                    DefaultImages.phone,
                                    color: _focusNodes[0].hasFocus
                                        ? HexColor(AppTheme.primaryColorString!)
                                        : const Color(0xffA2A0A8),
                                    // color:  HexColor(AppTheme.secondaryColorString!)
                                  ),
                                ),
                                hintText: "Celular",
                                inputType: TextInputType.phone,
                                textEditingController:
                                    loginController.mobileController.value,
                                capitalization: TextCapitalization.none,
                                limit: [
                                  LengthLimitingTextInputFormatter(10),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              );
                            }),
                            const SizedBox(height: 24),
                            Obx(() {
                              return CustomTextFormField(
                                focusNode: _focusNodes[1],
                                sufix: InkWell(
                                  focusColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  splashColor:
                                      const Color.fromARGB(0, 78, 8, 8),
                                  onTap: () {
                                    loginController.isVisible.value =
                                        !loginController.isVisible.value;
                                  },
                                  child: Padding(
                                      padding: const EdgeInsets.all(14.0),
                                      child: SvgPicture.asset(
                                        DefaultImages.eye,
                                      )),
                                ),
                                prefix: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: SvgPicture.asset(
                                    DefaultImages.pswd,
                                    color: _focusNodes[1].hasFocus
                                        ? HexColor(AppTheme.primaryColorString!)
                                        : const Color(0xffA2A0A8),
                                    // color:  HexColor(AppTheme.secondaryColorString!)
                                  ),
                                ),
                                hintText: "Clave",
                                obscure: loginController.isVisible.value == true
                                    ? false
                                    : true,
                                textEditingController:
                                    loginController.pswdController.value,
                                capitalization: TextCapitalization.none,
                                limit: [
                                  FilteringTextInputFormatter
                                      .singleLineFormatter,
                                ],
                                inputType: TextInputType.visiblePassword,
                              );
                            }),
                            const SizedBox(height: 16),
                            InkWell(
                              focusColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: () {
                                print(loginController.mobileController.value
                                    .toString());
                                print(loginController.pswdController.value);
                                /*  Get.to(
                                  const PasswordRecoveryScreen(),
                                  transition: Transition.rightToLeft,
                                  duration: const Duration(milliseconds: 500),
                                ); */
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "Olvidaste tu clave ?",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: HexColor(
                                              AppTheme.primaryColorString!),
                                        ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 32),
                            InkWell(
                              focusColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: () {
                                print(loginController
                                    .mobileController.value.text);
                                print(
                                    loginController.pswdController.value.text);
                                if (loginController
                                    .pswdController.value.text.isNotEmpty) {
                                  Get.to(
                                    const TabScreen(),
                                    transition: Transition.rightToLeft,
                                    duration: const Duration(milliseconds: 500),
                                  );
                                }
                              },
                              child: customButton(
                                  HexColor(AppTheme.primaryColorString!),
                                  "Ingresar",
                                  HexColor(AppTheme.secondaryColorString!),
                                  context),
                            ),
                            InkWell(
                              focusColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: () {
                                Get.to(
                                  const SignUpScreen(),
                                  transition: Transition.rightToLeft,
                                  duration: const Duration(milliseconds: 500),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 24),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("No tienes una cuenta ?",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                color:
                                                    const Color(0xff9CA3AF))),
                                    Text(" Registrarse",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              color: HexColor(
                                                  AppTheme.primaryColorString!),
                                            ))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Container(
                                height: 1,
                                color: const Color(0xffE8E8E8),
                              ),
                            ),
                            /* const Padding(
                              padding: EdgeInsets.only(left: 16.0, right: 16),
                              child: Text("Or login with"),
                            ), */
                            Expanded(
                              child: Container(
                                height: 1,
                                color: const Color(0xffE8E8E8),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 16),
                        /* Container(
                          height: 56,
                          width: Get.width,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffE8E8E8)),
                            borderRadius: BorderRadius.circular(16),
                            color: HexColor(AppTheme.secondaryColorString!),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 17.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: SvgPicture.asset(
                                    DefaultImages.ggl,
                                    //color:  HexColor(AppTheme.secondaryColorString!)
                                  ),
                                ),
                                const Spacer(),
                                InkWell(
                                  focusColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () {},
                                  child: Text(
                                    "Login with Google",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          color: const Color(0xff15141F),
                                        ),
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20), */
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
