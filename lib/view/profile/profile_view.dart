// ignore_for_file: deprecated_member_use

import 'package:finpay/config/images.dart';
import 'package:finpay/config/textstyle.dart';
import 'package:finpay/view/profile/chat_screen.dart';
import 'package:finpay/view/profile/edit_profile_screen.dart';
import 'package:finpay/view/profile/setting_screen.dart';
import 'package:finpay/view/profile/widget/income_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      color: AppTheme.isLightTheme == false
          ? HexColor('#15141f')
          : HexColor(AppTheme.primaryColorString!),
      child: Padding(
        padding: EdgeInsets.only(
          top: AppBar().preferredSize.height,
        ),
        child: Container(
          height: Get.height - 96,
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            color: AppTheme.isLightTheme == false
                ? const Color(0xff211F32)
                : Theme.of(context).appBarTheme.backgroundColor,
          ),
          child: ListView(
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.zero,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(
                              const SettingScreen(),
                              transition: Transition.downToUp,
                              duration: const Duration(milliseconds: 500),
                            );
                          },
                          child: Icon(
                            Icons.settings,
                            color:
                                Theme.of(context).textTheme.titleLarge!.color,
                            size: 25,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            SizedBox(
                              height: 70,
                              width: 70,
                              child: Image.asset(
                                DefaultImages.avatar,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              height: 28,
                              width: 28,
                              child: SvgPicture.asset(
                                DefaultImages.camera,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 23),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hernan Silgueira",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              height: 28,
                              width: 116,
                              decoration: BoxDecoration(
                                color:
                                    const Color(0xffF6A609).withOpacity(0.10),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Member Gold ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: const Color(0xffF6A609),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  SvgPicture.asset(
                                    DefaultImages.ranking,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Expanded(child: SizedBox()),
                        InkWell(
                          onTap: () {
                            Get.to(const EditProfileScreen(),
                                transition: Transition.downToUp,
                                duration: const Duration(milliseconds: 500));
                          },
                          child: Text(
                            "Modificar Perfil",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: HexColor(AppTheme.primaryColorString!),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Text(
                      "Descripción general",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        incomeContainer(
                          context,
                          "Ingresos Netos",
                          "\$4,500",
                          DefaultImages.income,
                        ),
                        const SizedBox(width: 16),
                        incomeContainer(
                          context,
                          "Gastos",
                          "\$1,691",
                          DefaultImages.outcome,
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      height: 122,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: AppTheme.isLightTheme == false
                            ? const Color(0xff323045)
                            : HexColor(AppTheme.primaryColorString!)
                                .withOpacity(0.05),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Gastos de la semana",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xff52525C),
                                  ),
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 16,
                                  width: (Get.width / 2) - 63.5,
                                  decoration: BoxDecoration(
                                    color:
                                        HexColor(AppTheme.primaryColorString!),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                Container(
                                  height: 16,
                                  width: (Get.width / 2) - 63.5,
                                  decoration: BoxDecoration(
                                    color:
                                        HexColor(AppTheme.primaryColorString!)
                                            .withOpacity(0.10),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(4),
                                      topRight: Radius.circular(4),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Text(
                                  "\$124",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                      ),
                                ),
                              ],
                            ),
                            Text(
                              "\$124 queda para gastar",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xffA2A0A8),
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    InkWell(
                      onTap: () {
                        Get.to(
                          const ChatScreen(),
                          transition: Transition.downToUp,
                          duration: const Duration(milliseconds: 500),
                        );
                      },
                      child: SizedBox(
                        height: 80,
                        width: Get.width,
                        child: SvgPicture.asset(
                          AppTheme.isLightTheme == false
                              ? DefaultImages.chatcsDark
                              : DefaultImages.chatDialog,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Text(
                        "Te uniste a Dispositivos moviles en mayo de 2025. Ha pasado casi un mes desde entonces y nuestra misión sigue siendo la misma: ayudarte a administrar mejor tus finanzas..",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              height: 1.8,
                              color: const Color(0xffA2A0A8),
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
