
import 'package:fpdart/fpdart.dart';

import 'error/email_auth_fialure.dart';
import 'error/google_auth_fialure.dart';


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

typedef FutureEither<T> = Future<Either<Failure,T>>; //using fpdart and typedef we can define our own data types and functions interfaces
typedef FutureVoid = FutureEither<void>; //in the case where succes will not return anything
typedef FutureEitherAuth<T> = Future<Either<Failure,T>>; 
