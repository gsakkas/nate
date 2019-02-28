
let sqsum xs =
  let f a x = a +. (x ** 2.0) in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (int_of_float ((float_of_int x) ** 2.0)) in
  let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,14)-(3,29)
a + int_of_float (float_of_int x ** 2.0)
BopG VarG (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (3,14)-(3,58)) Plus (Var (Just (3,14)-(3,15)) "a") (App (Just (3,18)-(3,58)) (Var (Just (3,19)-(3,31)) "int_of_float") [App (Just (3,32)-(3,57)) (Var (Just (3,50)-(3,52)) "**") [App (Just (3,33)-(3,49)) (Var (Just (3,34)-(3,46)) "float_of_int") [Var (Just (3,47)-(3,48)) "x"],Lit (Just (3,53)-(3,56)) (LD 2.0)]])
*)

(* typed spans
(3,14)-(3,58)
*)

(* correct types
int
*)

(* bad types
float
*)
