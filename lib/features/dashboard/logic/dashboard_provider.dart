import 'package:flutter/foundation.dart' hide Category;
import 'package:fluttermiwallet/db/database.dart';
import 'package:fluttermiwallet/db/entity/account.dart';
import 'package:fluttermiwallet/db/entity/account_transaction.dart';
import 'package:fluttermiwallet/db/entity/bank.dart';
import 'package:fluttermiwallet/db/entity/category.dart';
import 'package:fluttermiwallet/db/entity/subcategory.dart';
import 'package:fluttermiwallet/db/entity/transfer.dart';
import 'package:fluttermiwallet/utils/logger/logger.dart';

class DashboardProvider extends ChangeNotifier {
  final AppDatabase _db;
  double totalExpense = 0;
  double totalIncome = 0;
  double totalBalance = 0;
  List<AccountTransaction> transactions = [];
  bool isLoading = false;

  DashboardProvider(this._db);

  void changeData() {
    totalBalance += 200;
    totalIncome += 3;
    totalExpense += 1;

    notifyListeners();
  }

  void getAccountTransactions() async {
    isLoading = true;
    _db.accountTransactionDao.findAll(DateTime(2000, 1, 1).toIso8601String(),
        DateTime.now().toIso8601String()).listen((event) {
      totalIncome = 0;
      totalExpense = 0;
      transactions.forEach((transaction) {
        if (transaction.isIncome)
          totalIncome += transaction.amount;
        else
          totalExpense += transaction.amount;
      });
      isLoading = false;
      notifyListeners();
    });
  }

  void insertFakeTransfer() async {
    _db.transferDao.insertTransfer(Transfer(
        sourceAccountId: 1,
        destinationAccountId: 1,
        amount: 1001,
        dateTime: DateTime.now().toIso8601String(),
        descriptions: "khodam bara khodam enteghal dadam",
        createdDateTime: DateTime.now().toIso8601String()));
  }

  void getTransactionView() {
    _db.accountTransactionDao
        .findAll(DateTime(2000, 1, 1).toIso8601String(),
            DateTime.now().toIso8601String())
        .listen((event) {
      print('fuck : ${event.length}');
    });
  }

  void getTransfers() async {
    _db.transferDao.findAll().then((value) => Logger.log(value.toString()));
  }

  void getCategories() async {
    _db.categoryDao.findAll().then((value) => Logger.log(value.toString()));
  }

  void getSubcategories() async {
    _db.subcategoryDao.findAll().then((value) => Logger.log(value.toString()));
  }

  void getAllAccounts() async {
    _db.accountDao.findAll().then((value) {
      Logger.log(value.toString());
    });
  }

  void getAllBanks() async {
    _db.bankDao.findAll().then((value) {
      value.forEach((element) {
        Logger.log(element.toString());
      });
    });
  }

  void insertFakeCategory() async {
    for (var i = 0; i < 20; i++) {
      _db.categoryDao
          .insertCategory(Category(
              name: "category $i",
              imagePath: 'category/img/$i',
              createdDateTime: DateTime.now().toIso8601String()))
          .then((value) => Logger.log('inserted a fake category $i'));
    }
  }

  void insertFakeSubcategory() async {
    for (var i = 0; i < 10; i++)
      _db.subcategoryDao
          .insertSubcategory(Subcategory(
              categoryId: i + 1,
              name: "subcategory $i",
              imagePath: "subcategory/path/$i",
              createdDateTime: DateTime.now().toIso8601String()))
          .then((value) => Logger.log('inserted fake subcategory $i'));
  }

  void insertFakeBank() async {
    for (var i = 0; i < 20; i++)
      _db.bankDao.insertBank(Bank(
          name: "bank saderat $i",
          createdDateTime: DateTime.now().toIso8601String()));
  }

  void insertFakeAccount() async {
    for (var i = 0; i < 10; i++)
      _db.accountDao.insertAccount(Account(
          bankId: 1,
          name: "account khodmam $i",
          balance: 20000000 + i.toDouble(),
          descriptions: "barye kharj khodam $i",
          createdDateTime: DateTime.now().toIso8601String()));
  }

  void insertFakeAccountTransactions() async {
    for (var i = 0; i < 10; i++)
      _db.accountTransactionDao
          .insertAccountTransaction(AccountTransaction(
              accountId: i + 1,
              amount: i * 2.400,
              receiptImagePath: 'recipt/path',
              categoryId: 1,
              subcategoryId: 1,
              createdDateTime: DateTime.now().toIso8601String(),
              dateTime: DateTime(2020, i, i).toIso8601String(),
              isIncome: i % 2 == 0))
          .then((value) => Logger.log('inserted fake account transaction $i'));
  }
}
