
let sqsum xs =
  let f a x = a + (x ** 2.0) in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (int_of_float ((float_of_int x) ** 2.0)) in
  let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,18)-(3,28)
int_of_float (float_of_int x ** 2.0)
AppG (fromList [AppG (fromList [EmptyG])])

(3,19)-(3,20)
float_of_int x
AppG (fromList [VarG])

*)
