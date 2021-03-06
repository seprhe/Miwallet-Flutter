import 'package:flutter/material.dart';

import '../../features/add_count/ui/add_transaction_screen.dart';
import '../../features/dashboard/ui/dashboard_page.dart';
import '../../features/home/ui/home_page.dart';
import '../../features/report/ui/report_page.dart';
import '../../features/setting/ui/about_us.dart';
import '../../features/setting/ui/backup_screen.dart';
import '../../features/setting/ui/setting_screen.dart';
import '../../features/wallets/ui/account_transaction_page.dart';
import '../../features/wallets/ui/money_transfer_page.dart';
import '../../features/wallets/ui/new_wallet_page.dart';
import '../../features/wallets/ui/wallet_page.dart';
import '../../res/route_name.dart';

class Navigation {
  Navigation._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.homePage:
        return MaterialPageRoute(builder: (ctx) => HomePage());
        break;
      case RouteName.accountsPage:
        return MaterialPageRoute(builder: (ctx) => WalletPage());
        break;
      case RouteName.reportPage:
        return MaterialPageRoute(builder: (ctx) => ReportPage());
        break;
      case RouteName.accountTransactionsPage:
        int _id = settings.arguments;
        return MaterialPageRoute(builder: (ctx) => AccountTransactionPage(_id));
        break;
      case RouteName.addTransactionPage:
        bool _isIncome = settings.arguments;
        return MaterialPageRoute(
            builder: (ctx) => AddTransactionPage(_isIncome));
        break;
      case RouteName.walletPage:
        return MaterialPageRoute(builder: (ctx) => WalletPage());
        break;

      case RouteName.addWalletPage:
        return MaterialPageRoute(builder: (ctx) => AddWalletPage());
        break;
      case RouteName.dashboardPage:
        return MaterialPageRoute(builder: (ctx) => DashboardPage());
        break;
      case RouteName.moneyTransferPage:
        int _id = settings.arguments;
        return MaterialPageRoute(builder: (ctx) => MoneyTransferPage(_id));
        break;
      case RouteName.settingsPage:
        return MaterialPageRoute(builder: (ctx) => SettingPage());
        break;
      case RouteName.backUpPage:
        return MaterialPageRoute(builder: (ctx) => BackupPage());
        break;
      case RouteName.aboutUsPage:
        return MaterialPageRoute(builder: (ctx) => AboutUsPage());
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
