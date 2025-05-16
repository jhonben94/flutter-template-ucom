// ignore_for_file: deprecated_member_use

import 'package:finpay/config/images.dart';
import 'package:finpay/config/textstyle.dart';
import 'package:finpay/controller/profile_controller.dart';
import 'package:finpay/main.dart';
import 'package:finpay/view/profile/notification_screen.dart';
import 'package:finpay/view/profile/widget/custom_row.dart';
import 'package:finpay/view/profile/widget/notification_view.dart';
import 'package:finpay/view/profile/widget/social_view.dart';
import 'package:finpay/view/splash/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final profileController = Get.put(ProfileController());
  @override
  void initState() {
    setState(() {
      if (AppTheme.isLightTheme == false) {
        profileController.darkMode.value = true;
      } else {
        profileController.darkMode.value = false;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int light = 1;
    int dark = 2;
    changeColor(int color) {
      if (color == light) {
        MyApp.setCustomeTheme(context, 6);
      } else {
        MyApp.setCustomeTheme(context, 7);
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.isLightTheme == false
            ? HexColor('#15141f')
            : Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Theme.of(context).textTheme.titleLarge!.color,
          ),
        ),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        color: AppTheme.isLightTheme == false
            ? HexColor('#15141f')
            : Theme.of(context).appBarTheme.backgroundColor,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Configuración",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                ),
                const SizedBox(height: 32),
                Text(
                  "General",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xffA2A0A8),
                      ),
                ),
                const SizedBox(height: 16),
                notificationView(
                  context,
                  "Modo Oscuro",
                  CupertinoSwitch(
                    value: profileController.darkMode.value,
                    activeColor: HexColor(AppTheme.primaryColorString!),
                    onChanged: (v) {
                      setState(() {
                        profileController.darkMode.value = v;
                        if (v == true) {
                          changeColor(dark);
                        } else {
                          changeColor(light);
                        }
                      });
                    },
                  ),
                ),
                const SizedBox(height: 22),
                customRow(
                  context,
                  "Resetear Contraseña",
                ),
                const SizedBox(height: 32),
                InkWell(
                  onTap: () {
                    Get.to(
                      const NotificationScreen(),
                      transition: Transition.downToUp,
                      duration: const Duration(milliseconds: 500),
                    );
                  },
                  child: customRow(
                    context,
                    "Notificaciones",
                  ),
                ),
                const SizedBox(height: 32),
                customRow(
                  context,
                  "Configuración de Privacidad",
                ),
                const SizedBox(height: 32),
                customRow(
                  context,
                  "Centro de Ayuda",
                ),
                const SizedBox(height: 32),
                customRow(
                  context,
                  "Contactanos",
                ),
                const SizedBox(height: 32),
                InkWell(
                  onTap: () {
                    Get.offAll(const SplashScreen());
                  },
                  child: customRow(
                    context,
                    "Salir",
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  "Contactanos",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xffA2A0A8),
                      ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    socialView(
                      AppTheme.isLightTheme == false
                          ? DefaultImages.twitterdark
                          : DefaultImages.twitter,
                    ),
                    socialView(
                      AppTheme.isLightTheme == false
                          ? DefaultImages.facebookDark
                          : DefaultImages.facebook,
                    ),
                    socialView(
                      AppTheme.isLightTheme == false
                          ? DefaultImages.tiktokDark
                          : DefaultImages.tikTok,
                    ),
                    socialView(
                      AppTheme.isLightTheme == false
                          ? DefaultImages.instagramDark
                          : DefaultImages.instagram,
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    "Salir",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xffFB4E4E),
                        ),
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: Text(
                    "Dispositivos Moviles 2025 1.0",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff9EA3AE),
                        ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
