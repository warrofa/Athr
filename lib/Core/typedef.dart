
import 'package:athr_app/database/model/model.dart';
import 'package:fpdart/fpdart.dart';

import 'google_auth_failure.dart';

/*
  Fpdart aims to provide all the main types found in functional languages to dart. 
  Types like Option (handle missing values without null), Either (handle errors and 
  error messages), Task (composable async computations), and more.
 */

/*
Used to handle errors (instead of Exceptions).

  Either<L, R>: L is the type of the error (for example a String explaining the problem), 
  R is the return type when the computation is successful.
 */

typedef FutureEither<T> = Future<Either<Failure,T>>; //using fpdart we can define our own data types and functions interfaces
typedef FutureVoid = FutureEither<void>; //in the case where succes will not return anything