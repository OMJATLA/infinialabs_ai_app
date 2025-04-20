import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:infinialabs_ai/bloc/app_init/app_init_bloc.dart';
import 'package:infinialabs_ai/cubit/user/user_load_cubit.dart';
import 'package:infinialabs_ai/data%20provider/user/user_repository.dart';
import 'package:infinialabs_ai/model/explore_item.dart';
import 'package:infinialabs_ai/model/user.dart';
import 'package:infinialabs_ai/screens/dashboard/utils/dashboard_constants.dart';
import 'package:infinialabs_ai/theme/app_colors.dart';
import 'package:infinialabs_ai/utils/app_constants.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => UserLoadCubit(
            userRepository: RepositoryProvider.of<UserRepository>(context),
          )..loadUser(),
      child: const _DashBoardWidget(),
    );
  }
}

class _DashBoardWidget extends StatelessWidget {
  const _DashBoardWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserLoadCubit, UserLoadState>(
      builder: (context, state) {
        if (state is UserLoadedState) {
          return _DashBoardContent(user: state.user);
        } else if (state is UserLoadFailedState) {
          return const Text('User load failed');
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class _DashBoardContent extends StatelessWidget {
  final User user;

  const _DashBoardContent({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hi ${user.name}',
          style: Get.textTheme.displaySmall?.copyWith(fontSize: 18),
        ),
        titleSpacing: 16,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
          IconButton(
            onPressed: () {
              BlocProvider.of<AppInitBloc>(
                context,
              ).add(const AppInitLogOffEvent());
            },
            icon: const Icon(Icons.logout_outlined),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppConstants.healthcareSupportMessage,
              style: Get.textTheme.titleSmall?.copyWith(fontSize: 14),
            ),
            const _ExploreSection(),
          ],
        ),
      ),
    );
  }
}

class _ExploreSection extends StatelessWidget {
  const _ExploreSection();

  Widget _buildCard(ExploreItem item) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.colorWhite,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(2, 2)),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: item.color,
            radius: 24,
            child: Icon(item.icon),
          ),
          AppConstants.sizedBoxHeight12,
          Text(item.label, textAlign: TextAlign.center),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppConstants.sizedBoxHeight20,
        Text(
          AppConstants.explore,
          style: Get.textTheme.displaySmall?.copyWith(fontSize: 18),
        ),
        AppConstants.sizedBoxHeight16,
        GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.3,
          children:
              DashboardConstants.exploreItems
                  .map((item) => _buildCard(item))
                  .toList(),
        ),
      ],
    );
  }
}
