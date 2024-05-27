import 'package:flutter/material.dart';
import 'tesla_page.dart';
import 'redbull_page.dart';
import 'shell_page.dart';
import 'nike_page.dart';
import 'nvidia_page.dart';

class CompanySearchDelegate extends SearchDelegate<String> {
  final List<String> companies = [
    'Tesla',
    'Red Bull',
    'Shell',
    'Nike',
    'Nvidia'
  ];

  final Map<String, Widget> companyPages = {
    'Tesla': TeslaPage(),
    'Red Bull': RedBullPage(),
    'Shell': ShellPage(),
    'Nike': NikePage(),
    'Nvidia': NvidiaPage(),
  };

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView(
      children: companies
          .where((company) => company.toLowerCase().contains(query.toLowerCase()))
          .map((company) => ListTile(
        title: Text(company),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => companyPages[company]!,
            ),
          );
        },
      ))
          .toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty
        ? companies
        : companies.where((company) => company.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]),
          onTap: () {
            query = suggestions[index];
            showResults(context);
          },
        );
      },
    );
  }
}
