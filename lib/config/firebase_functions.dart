import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:todo_c10_sat_route/models/task_model.dart';
import 'package:todo_c10_sat_route/models/user_model.dart';

class FirebaseFunctions {
  static CollectionReference<TaskModel> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection('Tasks')
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, _) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.toJson();
      },
    );
  }

  static CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection('Users')
        .withConverter<UserModel>(
      fromFirestore: (snapshot, _) {
        return UserModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.toJson();
      },
    );
  }

  static addTask(TaskModel task) {
    var collection = getTasksCollection();
    var docRef = collection.doc();
    task.id = docRef.id;
    docRef.set(task);
  }

  static Stream<QuerySnapshot<TaskModel>> getTasks(DateTime date) {
    return getTasksCollection()
        .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where(
          'date',
          isEqualTo: DateUtils.dateOnly(date).microsecondsSinceEpoch,
        )
        .orderBy(
          'timestamp',
          descending: false,
        )
        .snapshots();
  }

  static Future<void> deleteTask(String id) {
    return getTasksCollection().doc(id).delete();
  }

  static updateTask(TaskModel taskModel) {
    return getTasksCollection().doc(taskModel.id).update(taskModel.toJson());
  }

  static Future<void> toggleTaskStatus(String taskId, bool isDone) async {
    var collection = getTasksCollection();
    await collection.doc(taskId).update({'isDone': !isDone});
  }

  static Future<void> addUser(UserModel user) {
    var collection = getUsersCollection();
    var docRef = collection.doc(user.id);
    return docRef.set(user);
  }

  static Future<UserModel?> readUser() async {
    String id = FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot<UserModel> documentSnapshot =
        await getUsersCollection().doc(id).get();
    return documentSnapshot.data();
  }

  static createAccount({
    required String email,
    required String password,
    required String userName,
    required Function onSuccess,
    required Function onError,
    required File image,
  }) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final ref = FirebaseStorage.instance
          .ref()
          .child('user-image')
          .child('${credential.user!.uid}.png');

      await ref.putFile(image);

      final url = await ref.getDownloadURL();

      UserModel user = UserModel(
        email: email,
        userName: userName,
        id: credential.user!.uid,
        imageUrl: url,
      );
      addUser(user);
      onSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        onError(e.message);
      } else if (e.code == 'email-already-in-use') {
        onError(e.message);
      }
      onError(e.message);
    } catch (e) {
      onError(e.toString());
    }
  }

  static login(String email, String password, Function onSuccess,
      Function onError) async {
    try {
      // ignore: unused_local_variable
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      onSuccess();
    } on FirebaseAuthException catch (e) {
      onError(e.message);
    }
  }

  static logOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
