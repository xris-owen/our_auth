// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:our_auth/src/cubit/login/login_cubit.dart';


// class PasswordInput extends StatelessWidget {
//   const PasswordInput({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<LoginCubit, LoginState>(
//       buildWhen: ((previous, current) => previous.password != current.password),
//       builder: (context, state) {
//         return TextField(
//           onChanged: (password) {
//             context.read<LoginCubit>().emailChanged(password);
//           },
//           decoration: const InputDecoration(labelText: 'Password'),
//         );
//       },
//     );
//   }
// }
