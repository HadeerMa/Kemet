import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemet/cubit/tickets_cubit.dart';
import 'package:kemet/views/tickets_view.dart';


class Tickets extends StatefulWidget {
  const Tickets({super.key});
  @override
  State<Tickets> createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
            create: (context) => TicketsCubit(),
          child:const Scaffold(
            body: TicketsView(),
          ),
    );
  }
}
