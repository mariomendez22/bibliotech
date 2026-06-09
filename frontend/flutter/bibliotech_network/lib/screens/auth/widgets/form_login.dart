import 'package:bibliotech_network/models/personal_model.dart';
import 'package:bibliotech_network/screens/auth/widgets/formfield_login.dart';
import 'package:bibliotech_network/services/auth_service.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {


  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameFocus = FocusNode();
  final passwordFocus = FocusNode();

  final _formKey = GlobalKey<FormState>();

  final authService = AuthService();

  bool isLoading = false;
  bool visiblePassword = true;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    usernameFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }

  Future<void> login() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      setState(() => isLoading = true);

      final response = await authService.login( usuario: usernameController.text.trim(), password: passwordController.text.trim(), );

      if (response['success'] == true) {
        if (!mounted) return;
        Personal().fromJson(response['data']);
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response['message'] ?? 'Credenciales inválidas')),
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }


  @override
  Widget build(BuildContext context) {
      const  style = TextStyle( color: Colors.white);
    return Flexible(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Align(alignment: Alignment.centerLeft,child: Text('Usuario',style: style,),),
            TextFormFieldLogin(
              focusNode: usernameFocus,
              controller: usernameController,
              hintText: 'usuario@empresa',
              keyboard: TextInputType.emailAddress,
              preffixIcon: const Icon(Icons.person,size: 25,color: Colors.white,),
              validator: (value) {
                      if (value!.isEmpty) {
                        return 'Ingresa un nombre de usuario.';
                      }
                      return null;
              },
              onChanged: (value) {
              },
              onFieldSubmitted: (value) async{
                if(value.isNotEmpty && passwordController.text.isNotEmpty) {
                  await login();
                  return;
                }
                  FocusScope.of(context).requestFocus(passwordFocus);
              },
            ),
            const SizedBox(height: 15,),
            const Align(alignment: Alignment.centerLeft,child: Text('Contraseña',style: style,),),
            TextFormFieldLogin(
              focusNode: passwordFocus,
              controller: passwordController,
              hintText: '************',
              keyboard: TextInputType.emailAddress,
              obscureText: visiblePassword,
              preffixIcon: const Icon(Icons.lock_rounded,size: 25,color: Colors.white,),
              suffixIcon: IconButton(
                            onPressed: () =>setState(() =>  visiblePassword = !visiblePassword),
                            icon:  Icon( visiblePassword ?  Icons.visibility_off_outlined : Icons.visibility_outlined,
                              size: 25,
                              color: Colors.white,
                            )
                          ),
              validator: (value) {
                  if (value!.isEmpty) {
                    return ('Ingresa una contraseña');
                  }
                
                  return null;
              },
              onChanged: (value) {
              },
              onFieldSubmitted: (value) async {
                if(value.isNotEmpty && usernameController.text.isNotEmpty) {
                  await login();
                    return;
                }
                FocusScope.of(context).requestFocus(usernameFocus);
              },
            ),
            const SizedBox(height: 25.0),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  elevation: 8,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  backgroundColor: const Color(0xFFFF6B00),
                ),
                onPressed: isLoading ? null : login,
                child: isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text(
                        'Ingresar',
                        style: TextStyle(color: Colors.white),
                      ),
              ),
            ),
            const SizedBox(height: 10,)
          ],
        ),
      ),
    );


    
  }


}


