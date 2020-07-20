import 'package:flutter/material.dart';
import 'package:fluttermiwallet/features/add_count/ui/add_transaction.dart';
import 'package:fluttermiwallet/features/dashboard/ui/dashboard_page.dart';
import 'package:fluttermiwallet/features/home/ui/home_page.dart';
import 'package:fluttermiwallet/features/wallets/ui/account_transaction_page.dart';
import 'package:fluttermiwallet/features/wallets/ui/accounts_page.dart';
import 'package:fluttermiwallet/features/wallets/ui/edit_wallet_page.dart';
import 'package:fluttermiwallet/features/wallets/ui/money_transfer_page.dart';
import 'package:fluttermiwallet/res/route_name.dart';

class Navigation {
  Navigation._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.homePage:
        return MaterialPageRoute(builder: (ctx) => HomePage());
        break;
      case RouteName.accountsPage:
        return MaterialPageRoute(builder: (ctx) => AccountsPage());
        break;
      case RouteName.accountTransactionsPage:
        return MaterialPageRoute(builder: (ctx) => AccountTransactionPage());
        break;
      case RouteName.addTransactionPage:
        return MaterialPageRoute(builder: (ctx) => AddTransactionPage());
        break;
      case RouteName.addWalletPage:
        return MaterialPageRoute(builder: (ctx) => EditWalletPage());
        break;
      case RouteName.dashboardPage:
        return MaterialPageRoute(builder: (ctx) => DashboardPage());
        break;
      case RouteName.moneyTransferPage:
        return MaterialPageRoute(builder: (ctx) => MoneyTransferPage());
        break;
      default:
        return MaterialPageRoute(
            builder: (ctx) => Container(
              color: Colors.white,
                  alignment: Alignment.center,
                  child: Text('no route defined for ${settings.name}'),
                ));
        break;
    }
  }
}