import 'package:floor/floor.dart';
import 'package:fluttermiwallet/db/entity/account.dart';

@Entity(foreignKeys: [
  ForeignKey(
      childColumns: ['sourceAccountId', 'destinationAccountId'],
      parentColumns: ['id','id'],
      entity: Account)
])
class Transfer {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final int sourceAccountId;
  final int destinationAccountId;
  final double amount;
  final String dateTime;
  final String descriptions;
  final String createdDateTime;

  Transfer(this.id, this.sourceAccountId, this.destinationAccountId,
      this.amount, this.dateTime, this.descriptions, this.createdDateTime);
}
