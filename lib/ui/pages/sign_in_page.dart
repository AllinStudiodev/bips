part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    context
        .bloc<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: mainColor)));
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ListView(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 50),
                    SizedBox(
                        height: 100, child: Image.asset("assets/logo.png")),
                    Container(
                      margin: EdgeInsets.only(top: 40, bottom: 40),
                      child: Text("B Park",
                          style: blackTextFont.copyWith(fontSize: 25)),
                    ),
                    TextField(
                      onChanged: (text) {
                        setState(() {
                          isEmailValid = EmailValidator.validate(text.trim());
                        });
                      },
                      controller: emailController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: "Email Address",
                          hintText: "Email Address"),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      onChanged: (text) {
                        setState(() {
                          isPasswordValid = text.length >= 6;
                        });
                      },
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: "Password",
                          hintText: "Password"),
                    ),
                    Center(
                      child: Container(
                        height: 50,
                        width: 50,
                        margin: EdgeInsets.only(top: 40, bottom: 30),
                        child: isSigningIn
                            ? SpinKitFadingCircle(color: mainColor)
                            : FloatingActionButton(
                                elevation: 0,
                                child: Icon(Icons.arrow_forward,
                                    color: isEmailValid && isPasswordValid
                                        ? Colors.white
                                        : Color(0xFFBEBEBE)),
                                backgroundColor: isEmailValid && isPasswordValid
                                    ? mainColor
                                    : Color(0xFFE4E4E4),
                                onPressed: isEmailValid && isPasswordValid
                                    ? () async {
                                        setState(() {
                                          isSigningIn = true;
                                        });

                                        SignInSignUpResult result =
                                            await AuthServices.signIn(
                                                emailController.text.trim(),
                                                passwordController.text);

                                        if (result.user == null) {
                                          setState(() {
                                            isSigningIn = false;
                                          });

                                          Flushbar(
                                            duration: Duration(seconds: 4),
                                            flushbarPosition:
                                                FlushbarPosition.TOP,
                                            backgroundColor: Color(0xFFFF5C83),
                                            message: result.message,
                                          )..show(context);
                                        }
                                      }
                                    : null),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
