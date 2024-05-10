import 'package:flutter/material.dart';
import 'package:kemet/components/custom_appbar.dart';
import 'package:kemet/components/tickets_list_view.dart';
import 'package:kemet/components/total_container.dart';

class TicketsView extends StatefulWidget {
  const TicketsView({super.key});

  @override
  State<TicketsView> createState() => _TicketsViewState();
}

class _TicketsViewState extends State<TicketsView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Column(
        children: [
          const SizedBox(
            height: 55,
          ),
          CustomAppBar(
            title: 'Tickets',
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          const SizedBox(
            height: 10,
          ),
          const Expanded(child: TicketsListView()),
          const SizedBox(
            height: 10,
          ),
          TotalContainer(),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
