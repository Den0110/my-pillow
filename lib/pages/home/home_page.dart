import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pillow/di/locator.dart';
import 'package:my_pillow/domain/entities/alarm/sleep_time_mapper.dart';
import 'package:my_pillow/navigation/auto_router.gr.dart';
import 'package:my_pillow/pages/alarm/set_sleep_time_details/model/sleep_time_type.dart';
import 'package:my_pillow/pages/home/bloc/set_sleep_time_page_cubit.dart';
import 'package:my_pillow/pages/home/widgets/time_selection.dart';
import 'package:my_pillow/utils/app_colors.dart';
import 'package:my_pillow/utils/app_icons.dart';
import 'package:my_pillow/utils/one_shot_bloc.dart';
import 'package:my_pillow/widgets/buttons/large_button.dart';
import 'package:my_pillow/widgets/sleep_period_picker/sleep_period_picker.dart';
import 'package:progressive_time_picker/progressive_time_picker.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: 25.w,
          right: 25.w,
          bottom: 16.h,
        ),
        child: BlocProvider(
          create: (context) => getIt<SetSleepTimePageCubit>(),
          child: Builder(builder: (context) {
            return Stack(
              children: [
                OneShotBlocConsumer<SetSleepTimePageCubit,
                    SetSleepTimePageState>(
                  listener: (context, state) {
                    if (state is NavToDetails) {
                      context.router.navigate(
                        SetSleepTimeDetailsRoute(initial: state.initialTab),
                      );
                    } else if (state is NavToSleep) {
                      context.router.navigate(const AlarmSleepingRoute());
                    } else if (state is NavToBack) {
                      context.router.pop();
                    }
                  },
                  builder: (context, state) {
                    return state.maybeWhen(
                      (bedTime, wakeUpTime) => SingleChildScrollView(
                        child: Column(
                          children: [
                            SleepPeriodPicker(
                              begin: SleepTimeMapper.toPickedTime(bedTime),
                              end: SleepTimeMapper.toPickedTime(wakeUpTime),
                              onSelectionChange: (
                                PickedTime bedTime,
                                PickedTime wakeUp,
                                bool? b,
                              ) {
                                BlocProvider.of<SetSleepTimePageCubit>(context)
                                    .timeChanged(
                                  bedTime: SleepTimeMapper.toTime(bedTime),
                                  wakeUpTime: SleepTimeMapper.toTime(wakeUp),
                                );
                              },
                            ),
                            SizedBox(
                              height: 35.h,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TimeSelection(
                                    onTap: () {
                                      BlocProvider.of<SetSleepTimePageCubit>(
                                              context)
                                          .editRequested(SleepTimeType.bedtime);
                                    },
                                    icon: AppIcons.bedtime,
                                    title: "BedTime",
                                    time: bedTime,
                                  ),
                                ),
                                Expanded(
                                  child: TimeSelection(
                                    onTap: () {
                                      BlocProvider.of<SetSleepTimePageCubit>(
                                              context)
                                          .editRequested(SleepTimeType.alarm);
                                    },
                                    icon: AppIcons.wakeUp,
                                    title: "WakeUp",
                                    time: wakeUpTime,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      orElse: Container.new,
                    );
                  },
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      LargeButton(
                        onPressed: () {
                          BlocProvider.of<SetSleepTimePageCubit>(context)
                              .sleepClicked();
                        },
                        text: "Sleep now",
                        backgroundColor: AppColors.green,
                        shadowColor: AppColors.yellow,
                        textColor: AppColors.darkGreen,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}