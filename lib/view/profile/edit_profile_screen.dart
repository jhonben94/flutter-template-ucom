// ignore_for_file: deprecated_member_use

import 'package:finpay/config/images.dart';
import 'package:finpay/config/textstyle.dart';
import 'package:finpay/widgets/custom_container.dart';
import 'package:finpay/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.isLightTheme == false
            ? HexColor('#15141f')
            : HexColor(AppTheme.primaryColorString!).withOpacity(0.05),
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
        title: Text(
          "Mi cuenta",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            color: AppTheme.isLightTheme == false
                ? HexColor('#15141f')
                : HexColor(AppTheme.primaryColorString!).withOpacity(0.05),
            child: ListView(
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.zero,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 32),
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: AppTheme.isLightTheme == false
                                ? const Color(0xffF5F7FE)
                                : HexColor(AppTheme.primaryColorString!)
                                    .withOpacity(0.05),
                            foregroundImage: const AssetImage(
                              DefaultImages.profile,
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
                      const SizedBox(height: 32),
                      CustomTextField(
                        hintText: "Ingrese nombre de usuario",
                        widget: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SvgPicture.asset(
                            DefaultImages.profileUser,
                          ),
                        ),
                        color: AppTheme.isLightTheme == false
                            ? const Color(0xff211F32)
                            : const Color(0xffF9F9FA),
                        radius: 16,
                        textEditingController:
                            TextEditingController(text: "Hernan Silgueira"),
                        inputType: TextInputType.name,
                      ),
                      const SizedBox(height: 24),
                      CustomTextField(
                        hintText: "Ingrese numero de celular",
                        widget: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SvgPicture.asset(
                            DefaultImages.call,
                          ),
                        ),
                        color: AppTheme.isLightTheme == false
                            ? const Color(0xff211F32)
                            : const Color(0xffF9F9FA),
                        radius: 16,
                        textEditingController:
                            TextEditingController(text: "0812 345 6789"),
                        inputType: TextInputType.number,
                      ),
                      const SizedBox(height: 24),
                      CustomTextField(
                        hintText: "Ingrese contraseña",
                        widget: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SvgPicture.asset(
                            DefaultImages.lock,
                          ),
                        ),
                        color: AppTheme.isLightTheme == false
                            ? const Color(0xff211F32)
                            : const Color(0xffF9F9FA),
                        radius: 16,
                        textEditingController:
                            TextEditingController(text: "1234567"),
                        isObsecure: true,
                        sufix: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SvgPicture.asset(
                            DefaultImages.invisible,
                          ),
                        ),
                        inputType: TextInputType.visiblePassword,
                      ),
                      const SizedBox(height: 24),
                      CustomTextField(
                        hintText: "Enter bank",
                        widget: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SvgPicture.asset(
                            DefaultImages.flag,
                          ),
                        ),
                        color: AppTheme.isLightTheme == false
                            ? const Color(0xff211F32)
                            : const Color(0xffF9F9FA),
                        radius: 16,
                        textEditingController:
                            TextEditingController(text: "Paraguay"),
                        sufix: Padding(
                          padding: const EdgeInsets.only(top: 16, right: 15),
                          child: Text(
                            "Cambiar",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: HexColor(AppTheme.primaryColorString!),
                                ),
                          ),
                        ),
                        inputType: TextInputType.name,
                      ),
                      const SizedBox(height: 120),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
              bottom: MediaQuery.of(context).padding.bottom + 14,
            ),
            child: CustomButton(
              title: "Guardar Cambios",
              onTap: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
