import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pillow/utils/app_colors.dart';
import 'package:my_pillow/widgets/buttons/large_button.dart';
import 'package:my_pillow/widgets/containers/sleep_container.dart';
import 'package:my_pillow/widgets/text_fields/app_text_field.dart';

class ProfileSettingsEmailPage extends StatelessWidget {
  const ProfileSettingsEmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Email"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            right: 16.w,
            left: 16.w,
            bottom: 16.h,
          ),
          child: Column(
            children: [
              SleepContainer(
                child: AppTextField(
                  onChanged: (value) {},
                  value: "lublu_spat@mail.ru",
                  hint: "Enter Email",
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LargeButton(
                      text: "Save",
                      onPressed: () {
                          Navigator.of(context).pop();
                      },
                      backgroundColor: AppColors.lightGreen,
                      shadowColor: AppColors.lemon,
                      textColor: AppColors.darkGreen,
                    ),
                    SizedBox(height: 6.h),
                    LargeButton(
                      text: "Cancel",
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
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