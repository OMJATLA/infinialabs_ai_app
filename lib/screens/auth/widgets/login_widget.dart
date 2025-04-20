import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:infinialabs_ai/bloc/app_init/app_init_bloc.dart';
import 'package:infinialabs_ai/bloc/auth/auth_bloc.dart';
import 'package:infinialabs_ai/helper/snackbar_helper.dart';
import 'package:infinialabs_ai/screens/auth/utils/auth_constants.dart';
import 'package:infinialabs_ai/theme/app_colors.dart';
import 'package:infinialabs_ai/utils/app_constants.dart';
import 'package:infinialabs_ai/utils/image_constants.dart';
import 'package:infinialabs_ai/widgets/common/email_form_field.dart';
import 'package:infinialabs_ai/widgets/common/string_form_field.dart';
import 'package:infinialabs_ai/widgets/common/text_buttons.dart';

class LogInWidget extends StatefulWidget {
  final VoidCallback onSignUpPressed;

  const LogInWidget({super.key, required this.onSignUpPressed});

  @override
  State<LogInWidget> createState() => _LogInWidgetState();
}

class _LogInWidgetState extends State<LogInWidget> {
  final _formKey = GlobalKey<FormState>();
  final _logInMap = <String, dynamic>{};
  bool _showPassword = false;

  void _onFieldChanged({required String key, required dynamic val}) =>
      _logInMap[key] = val;

  void _onContinuePressed() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (isValid) {
      BlocProvider.of<AuthBloc>(
        context,
      ).add(AuthLogInEvent(logInMap: _logInMap));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Image.asset(ImageConstants.imageAppLogo, height: 280),
            Text(
              AppConstants.logIn,
              style: Get.textTheme.displaySmall?.copyWith(
                color: AppColors.sThemePColor,
                fontSize: 16,
              ),
            ),
            AppConstants.sizedBoxHeight16,
            _LogInFormFields(
              onEmailOnChanged:
                  (email) =>
                      _onFieldChanged(key: AuthConstants.email, val: email),
              onPassordOnChanged:
                  (password) => _onFieldChanged(
                    key: AuthConstants.password,
                    val: password,
                  ),
              onObscurePress:
                  () => setState(() {
                    _showPassword = !_showPassword;
                  }),
              showPassword: _showPassword,
            ),
            _ContinueBtn(onContinuePressed: _onContinuePressed),
            _SignUpPrompt(onSignUpPressed: widget.onSignUpPressed),
          ],
        ),
      ),
    );
  }
}

class _LogInFormFields extends StatelessWidget {
  final Function(String?) onEmailOnChanged;
  final Function(String?) onPassordOnChanged;
  final VoidCallback onObscurePress;
  final bool showPassword;

  const _LogInFormFields({
    required this.onEmailOnChanged,
    required this.onPassordOnChanged,
    required this.onObscurePress,
    required this.showPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EmailFormField(
          isRequired: true,
          prefixIcon: const Icon(Icons.mail),
          labelText: AppConstants.email,
          onChanged: onEmailOnChanged,
        ),
        AppConstants.sizedBoxHeight20,
        StringFormField(
          isRequired: true,
          obscureText: !showPassword,
          maxLines: 1,
          prefixIcon: const Icon(Icons.lock),
          labelText: AppConstants.password,
          onChanged: onPassordOnChanged,
          suffixIcon: IconButton(
            onPressed: onObscurePress,
            icon: Icon(showPassword ? Icons.visibility_off : Icons.visibility),
          ),
        ),
      ],
    );
  }
}

class _ContinueBtn extends StatelessWidget {
  final VoidCallback onContinuePressed;

  const _ContinueBtn({required this.onContinuePressed});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {},
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoggedInState) {
            Get.showSnackbar(
              GetSuccessSnackBar(msg: AppConstants.logInSuccess),
            );

            BlocProvider.of<AppInitBloc>(
              context,
            ).add(const AppInitLogInEvent());
          } else if (state is AuthLoginFailedState) {
            Get.showSnackbar(
              GetErrorSnackBar(msg: AppConstants.unableToLogInUser),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoggingInState) {
            return const TextButton1Progress(
              margin: EdgeInsets.only(top: 16, bottom: 32),
            );
          }
          return TextButton1(
            onPressed: onContinuePressed,
            margin: const EdgeInsets.only(top: 16, bottom: 32),
            widget: const Text(AppConstants.continuee),
          );
        },
      ),
    );
  }
}

class _SignUpPrompt extends StatelessWidget {
  final VoidCallback onSignUpPressed;

  const _SignUpPrompt({required this.onSignUpPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('${AppConstants.donNotHaveAcc} '),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
            padding: EdgeInsets.zero,
            alignment: AlignmentDirectional.centerStart,
          ),
          onPressed: onSignUpPressed,
          child: Text(
            AppConstants.signUp,
            style: Get.textTheme.displaySmall?.copyWith(
              color: AppColors.sThemePColor,
            ),
          ),
        ),
      ],
    );
  }
}
