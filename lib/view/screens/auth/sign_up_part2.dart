//extension of sign_up file
part of "sign_up.dart";

bool passwordsAreEqual = true;

class PasswordInput extends ConsumerWidget {
  const PasswordInput({
    Key? key,
    required this.controllerpassword1,
  }) : super(key: key);

  final TextEditingController controllerpassword1;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final signUpInputStates = ref.watch(signUpInputsProvider);
    return PasswordTextField(
      controller: controllerpassword1,
      errorText:signUpInputStates.password.invalid? Password.showEmailErrorText(signUpInputStates.password.error):null ,
      onchanged: (password)=>ref.read(signUpInputsProvider.notifier).onPasswordChange(password),
      hint: "Password",
    );
  }
}

class ConformPasswordInput extends StatefulWidget {
  const ConformPasswordInput({
    Key? key,
    required TextEditingController controllerpassword2,
    required TextEditingController controllerpassword1
  }) : _controllerpassword2 = controllerpassword2 , _controllerpassword1 = controllerpassword1, super(key: key);

  final TextEditingController _controllerpassword2;
  final TextEditingController _controllerpassword1;

  @override
  State<ConformPasswordInput> createState() => _ConformPasswordInputState();
}

class _ConformPasswordInputState extends State<ConformPasswordInput> {

  @override
  Widget build(BuildContext context) {

    return PasswordTextField(
      controller: widget._controllerpassword2,
       errorText:passwordsAreEqual? null : "entered passwords are not equal" ,
      onchanged:(password)=>setState(() {
        
        passwordsAreEqual=password==widget._controllerpassword1.text;
      }),
      hint: "Confirm password",
    );
  }
}

class UsernameInput extends ConsumerWidget {
  const UsernameInput({
    Key? key,
    required TextEditingController controlleruname,
  }) : _controlleruname = controlleruname, super(key: key);

  final TextEditingController _controlleruname;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final signUpInputStates = ref.watch(signUpInputsProvider);
    return InputTextField(
      controller: _controlleruname,
      hint: "Username",
      errorText: signUpInputStates.username.invalid? Uname.showUsernameErrorText(signUpInputStates.username.error) : null,
      onchanged: (username)=>ref.read(signUpInputsProvider.notifier).onUnameChange(username),
    );
  }
}

class EmailInput extends ConsumerWidget {
  const EmailInput({
    Key? key,
    required TextEditingController controlleremail,
  }) : _controlleremail = controlleremail, super(key: key);

  final TextEditingController _controlleremail;
  

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final signUpInputStates = ref.watch(signUpInputsProvider);
    return InputTextField(
      errorText:signUpInputStates.email.invalid? Email.showEmailErrorText(signUpInputStates.email.error):null ,
      onchanged: (email)=>ref.read(signUpInputsProvider.notifier).onEmailChange(email),
      controller: _controlleremail,
      hint: "Email",
    );
  }
}