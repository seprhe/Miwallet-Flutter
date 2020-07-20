import 'package:flutter/foundation.dart';
import 'package:fluttermiwallet/db/dao/account_dao.dart';
import 'package:fluttermiwallet/db/dao/bank_dao.dart';
import 'package:fluttermiwallet/db/database.dart';
import 'package:fluttermiwallet/db/entity/account.dart';
import 'package:fluttermiwallet/db/entity/account_transaction.dart';
import 'package:fluttermiwallet/db/entity/bank.dart';
import 'package:fluttermiwallet/db/entity/category.dart' as category;
import 'package:fluttermiwallet/db/entity/subcategory.dart';
import 'package:fluttermiwallet/db/entity/transfer.dart';
import 'package:fluttermiwallet/utils/logger/logger.dart';

class WalletsProvider with ChangeNotifier {
  final AppDatabase _db;
  List<Account> accounts = [];
  List<AccountTransaction> transactions = [];
  List<Bank> banks = [];
  String subcategoryName="";

  WalletsProvider(this._db);

  void insertFakeBank() async {
    _db.bankDao.insertBank(Bank(name: "saderat", createdDateTime: DateTime.now().toIso8601String()));
    _db.bankDao.insertBank(Bank(name: "parsian", createdDateTime: DateTime.now().toIso8601String()));
    _db.bankDao.insertBank(Bank(name: "pasargad", createdDateTime: DateTime.now().toIso8601String()));
    _db.bankDao.insertBank(Bank(name: "ayande", createdDateTime: DateTime.now().toIso8601String()));
  }

  void insertAccount() async {
//    await _db.accountDao.insertAccount(account);
    await _db.accountDao.insertAccount(
      Account(id: 1,bankId: 1, name: "my acc", balance: 1000, descriptions: "chettori", createdDateTime: DateTime.now().toIso8601String()),
    );
    notifyListeners();
  }

  void updateAccount(Account account) async {
    await _db.accountDao.updateAccount(account);
  }

  void getAllAccounts() async {
    accounts = await _db.accountDao.findAll();
//    accounts = [Account(1, 2, "Saderat", 320393, "Acount Back Saderat",
//        DateTime.now().toIso8601String())];
    print(accounts.toString());
    notifyListeners();
  }

  void getAllTransaction() async {
    transactions = await _db.accountTransactionDao.findAllAccountTransaction();
  }

  void insertTransaction() async {
    await _db.accountTransactionDao.insertAccountTransaction(AccountTransaction(
      id: 1,
        accountId: 1,
        amount: 25686,
        dateTime: DateTime.now().toIso8601String(),
        receiptImagePath: "null",
        categoryId: 1,
        subcategoryId: 1,
        createdDateTime: DateTime.now().toIso8601String(),
        isIncome: true)).then((value) => Logger.log('inserted fake transa'));
    await _db.accountTransactionDao.insertAccountTransaction(AccountTransaction(
        accountId: 1,
        amount: 25686,
        dateTime: DateTime.now().toIso8601String(),
        receiptImagePath: "null",
        categoryId: 1,
        subcategoryId: 1,
        createdDateTime: DateTime.now().toIso8601String(),
        isIncome: true));
    await _db.accountTransactionDao.insertAccountTransaction(AccountTransaction(
        accountId: 1,
        amount: 25686,
        dateTime: DateTime.now().toIso8601String(),
        receiptImagePath: "null",
        categoryId: 1,
        subcategoryId: 1,
        createdDateTime: DateTime.now().toIso8601String(),
        isIncome: false));
    await _db.accountTransactionDao.insertAccountTransaction(AccountTransaction(
        accountId: 1,
        amount: 25686,
        dateTime: DateTime.now().toIso8601String(),
        receiptImagePath: "null",
        categoryId: 1,
        subcategoryId: 1,
        createdDateTime: DateTime.now().toIso8601String(),
        isIncome: true));
  }
  
  void insertCategory() async{
    _db.categoryDao.insertCategory(category.Category(id: 1,name: "Food", imagePath: "null", createdDateTime: DateTime.now().toIso8601String())).then((value) => Logger.log('inserted fake category'));
  }

  void insertSubCategory() async{
    _db.subcategoryDao.insertSubcategory(Subcategory(id: 1,categoryId: 1, name: "Restaurant", imagePath: "null", createdDateTime: DateTime.now().toIso8601String())).then((value) => Logger.log('inserted fake subc'));
  }

  void findSubCategory(int id) async{
    var subCategory = await _db.subcategoryDao.findSubcategory(id);
    subcategoryName = subCategory.name;
    notifyListeners();
  }

  void insertTransfer(Transfer transfer) async {
    await _db.transferDao.insertTransfer(transfer);
  }

  void findAllBank() async {
    banks = await _db.bankDao.findAll();
  }
}