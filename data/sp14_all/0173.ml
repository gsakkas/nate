
let sqsum xs =
  let f a x = a +. (x ** 2) in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,14)-(3,27)
a + (x * x)
BopG VarG (BopG EmptyG EmptyG)

*)

(* changed exprs
Bop (Just (3,14)-(3,25)) Plus (Var (Just (3,14)-(3,15)) "a") (Bop (Just (3,18)-(3,25)) Times (Var (Just (3,19)-(3,20)) "x") (Var (Just (3,23)-(3,24)) "x"))
*)

(* typed spans
(3,14)-(3,25)
*)

(* correct types
int
*)

(* bad types
float
*)
