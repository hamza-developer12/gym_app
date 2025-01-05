import 'package:flutter/material.dart';
import 'package:gym_app/layouts/user_page_layout.dart';
import 'package:gym_app/providers/coins_provider.dart';
import 'package:gym_app/screens/admin/approve_request_screen.dart';
import 'package:provider/provider.dart';

class CoinsRequestScreen extends StatefulWidget {
  const CoinsRequestScreen({super.key});

  @override
  State<CoinsRequestScreen> createState() => _CoinsRequestScreenState();
}

class _CoinsRequestScreenState extends State<CoinsRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return UserPageLayout(
      screenTitle: "Coins Request",
      child: Consumer<CoinsProvider>(builder: (context, coinsProvider, child) {
        return FutureBuilder(
          future: coinsProvider.getCoinsRequests(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No coin requests found.'));
            } else {
              final coinRequests = snapshot.data;
              return ListView.builder(
                itemCount: coinRequests!.length,
                itemBuilder: (context, index) {
                  final request = coinRequests[index];
                  return GestureDetector(
                    onTap: () {
                      // Implement approve request functionality
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ApproveRequestScreen(request: request);
                      })).then((_) {
                        setState(() {
                          CoinsProvider().getCoinsRequests();
                        });
                      });
                    },
                    child: ListTile(
                      title: Text(request['name']),
                      subtitle: Text(
                        request['email'],
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      trailing: Text('${request['coins']} coins',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          )),
                    ),
                  );
                },
              );
            }
          },
        );
      }),
    );
  }
}
