import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';

class WalletRepository {
  static Future<String?> connectToWallet(BuildContext context) async {
    // Create a connector
    final connector = WalletConnect(
      bridge: 'https://bridge.walletconnect.org',
      clientMeta: PeerMeta(
        name: 'TruYou',
        description: 'The next generation, Web3 dating app.',
        url: 'https://truyou.io/',
        icons: [
          'https://github.com/True-being/TruYou-Main/blob/main/truyou_logo.png?raw=true'
        ],
      ),
    );

    // Create a new session
    if (!connector.connected) {
      final session = await connector.createSession(
          chainId: 4160,
          onDisplayUri: (uri) async {
            await launchUrlString(uri);
          });

      if (session.accounts.isNotEmpty) {
        return session.accounts.first;
      }
    }

    return null;
  }

  static Future<void>disconnectWallet()async{}
}
