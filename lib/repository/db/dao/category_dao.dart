import 'package:floor/floor.dart';
import '../entity/category.dart';

@dao
abstract class CategoryDao {

  @Query('SELECT * FROM Category')
  Future<List<Category>> findAll();

  @Query('SELECT * FROM Category WHERE id = :id')
  Future<Category> findCategory(int id);

  @Insert(onConflict: OnConflictStrategy.fail)
  Future<void> insertCategory(Category category);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateCategory(Category category);
}