import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';
import 'package:splyshechka/di/locator.dart';
import 'package:splyshechka/models/gender/gender.dart';
import 'package:splyshechka/pages/login/registration/bloc/registration_bloc.dart';
import 'package:splyshechka/pages/login/widgets/gender_selector_field.dart';
import 'package:splyshechka/pages/login/widgets/login_text_field.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_text_styles.dart';
import 'package:splyshechka/widgets/switchers/pick_option/pick_option.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _nickController = TextEditingController();
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    return BlocProvider(
      create: (context) => getIt<RegistrationBloc>(),
      child: BlocSideEffectConsumer<RegistrationBloc, RegistrationBloc,
          RegistrationState, RegistrationCommand>(
        listener: (context, sideEffect) {
          sideEffect.when(
            navToMain: () {
              context.router.navigateBack();
            },
          );
        },
        builder: (context, state) => SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: BackButton(onPressed: () => context.navigateBack()),
            ),
            body: Container(
              padding: EdgeInsets.only(bottom: 50.h, left: 35.w, right: 35.w),
              child: Column(children: [
                Text(
                  "Регистрация",
                  style: TextStyle(
                      fontSize: 26.sp,
                      color: Colors.white,
                      fontFamily: AppTextStyles.fontFamilyOpenSans),
                ),
                SizedBox(height: 50.h),
                LoginTextField(
                  hintText: "Имя",
                  height: 30.h,
                  controller: _nameController,
                ),
                SizedBox(height: 20.h),
                LoginTextField(
                  hintText: "Логин",
                  height: 30.h,
                  controller: _nickController,
                ),
                SizedBox(height: 20.h),
                LoginTextField(
                  hintText: "Почта",
                  height: 30.h,
                  controller: _emailController,
                ),
                SizedBox(height: 20.h),
                LoginTextField(
                  hintText: "Пароль",
                  height: 30.h,
                  controller: _passwordController,
                ),
                SizedBox(height: 20.h),
                PickOption(
                  options: Gender.values.map((e) => e.name).toList(),
                  active: Gender.values.indexWhere((e) => state.gender == e),
                  optionStyle: OptionStyle.backgroundStyle,
                  color: AppColors.stroke,
                  onTap: (int i) {
                    context.read<RegistrationBloc>().add(
                          RegistrationEvent.genderChanged(
                            gender: i == 0 ? Gender.male : Gender.female,
                          ),
                        );
                  },
                ),
                SizedBox(height: 40.h),
                GestureDetector(
                  onTap: () {
                    context.read<RegistrationBloc>().add(
                          RegistrationEvent.signUpClicked(
                            nickname: _nickController.text,
                            fullname: _nameController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                          ),
                        );
                  },
                  child: Container(
                    height: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11.r),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromRGBO(83, 83, 177, 1),
                            offset: Offset(0, 2))
                      ],
                      color: AppColors.greyMain,
                    ),
                    child: Center(
                      child: Text(
                        "Зарегистрироваться",
                        style: TextStyle(
                          color: AppColors.white,
                          fontFamily: AppTextStyles.fontFamilyOpenSans,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
