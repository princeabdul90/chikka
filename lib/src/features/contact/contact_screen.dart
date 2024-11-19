/*
* Developer: Abubakar Abdullahi
* Date: 18/11/2024
*/

import 'package:chikka/src/components/components.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ContactView();
  }
}

class ContactView extends StatefulWidget {
  const ContactView({super.key});

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();

    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme.copyWith(
              color: AppColors.onPrimary,
            ),
        title: Text(
          'Select Contact',
          style: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
                color: AppColors.onPrimary,
                fontSize: 18.0,
              ),
        ),
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios_new,
            //color: Colors.white,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSearchNoteTF(),
        ],
      ),
    );
  }

  Widget _buildSearchNoteTF() {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
      child: TextField(
        controller: _searchController,
        cursorColor: AppColors.black,
        onChanged: (val) {},
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: size.width * 0.04,
            ),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.chatOffWhite,
          enabled: true,
          suffixIcon: _searchController.text.isEmpty
              ? const Icon(
                  Icons.search,
                  color: AppColors.primary,
                )
              : IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.cancel,
                    color: AppColors.white,
                  ),
                ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          hintText: 'search by name',
          hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.grey,
                fontSize: size.width * 0.04,
              ),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
