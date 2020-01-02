import 'package:cloud_firestore/cloud_firestore.dart' hide Transaction;

class FireDBService {
  final String uid;

  FireDBService({this.uid});

  final CollectionReference usersCollection =
      Firestore.instance.collection('users');

  //Transactions
  // List<Transaction> _transactionsListFromSnapshot(QuerySnapshot snapshot) {
  //   return snapshot.documents.map((tx) {
  //     return Transaction(
  //       tid: tx.documentID,
  //       date:
  //           new DateTime.fromMillisecondsSinceEpoch(tx['date'].seconds * 1000),
  //       isExpense: tx['isExpense'],
  //       payee: tx['payee'],
  //       amount: tx['amount'].toDouble(),
  //       category: tx['category'],
  //       uid: tx['uid'],
  //     );
  //   }).toList();
  // }

  // Stream<List<Transaction>> get transactions {
  //   return usersCollection
  //       .document(uid)
  //       .collection('transactions')
  //       .orderBy('date', descending: true)
  //       .snapshots()
  //       .map(_transactionsListFromSnapshot);
  // }

  // Future addTransaction(Transaction tx) async {
  //   return await usersCollection.document(uid).collection('transactions').add({
  //     'date': tx.date,
  //     'isExpense': tx.isExpense,
  //     'payee': tx.payee,
  //     'amount': tx.amount,
  //     'category': tx.category,
  //     'uid': tx.uid,
  //   });
  // }

  // Future updateTransaction(Transaction tx) async {
  //   return await usersCollection
  //       .document(uid)
  //       .collection('transactions')
  //       .document(tx.tid)
  //       .updateData({
  //     'date': tx.date,
  //     'isExpense': tx.isExpense,
  //     'payee': tx.payee,
  //     'amount': tx.amount,
  //     'category': tx.category,
  //     'uid': tx.uid,
  //   });
  // }

  // Future deleteTransaction(String tid) async {
  //   return await usersCollection
  //       .document(uid)
  //       .collection('transactions')
  //       .document(tid)
  //       .delete();
  // }

  //Categories
  // List<Category> _categoriesListFromSnapshot(QuerySnapshot snapshot) {
  //   return snapshot.documents.map((category) {
  //     return Category(
  //       cid: category.documentID,
  //       name: category['name'],
  //       icon: category['icon'],
  //       enabled: category['enabled'],
  //       orderIndex: category['orderIndex'],
  //       uid: category['uid'],
  //     );
  //   }).toList();
  // }

  // Stream<List<Category>> get categories {
  //   return usersCollection
  //       .document(uid)
  //       .collection('categories')
  //       .snapshots()
  //       .map(_categoriesListFromSnapshot);
  // }

  // void addDefaultCategories() {
  //   CATEGORIES.asMap().forEach((index, category) async {
  //     return await usersCollection.document(uid).collection('categories').add({
  //       'name': category['name'],
  //       'icon': category['icon'],
  //       'enabled': true,
  //       'orderIndex': index,
  //       'uid': uid,
  //     });
  //   });
  // }

  // void setCategory(String cid, bool enabled) async {
  //   return await usersCollection.document(uid).collection('categories').document(cid).updateData({
  //     'enabled': enabled
  //   });
  // }

  //User Info
  // User _userFromSnapshot(DocumentSnapshot snapshot) {
  //   return User(
  //     uid: uid,
  //     email: snapshot.data['email'],
  //     fullname: snapshot.data['fullname'],
  //   );
  // }

  // Stream<User> get user {
  //   return usersCollection
  //       .document(uid)
  //       .collection('user')
  //       .document(uid)
  //       .snapshots()
  //       .map(_userFromSnapshot);
  // }

  // Future addUser(User user) async {
  //   return await usersCollection
  //       .document(uid)
  //       .collection('user')
  //       .document(uid)
  //       .setData({
  //     'email': user.email,
  //     'fullname': user.fullname,
  //   });
  // }
}