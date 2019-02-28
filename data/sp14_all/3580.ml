
let sqsum xs =
  let f a x = (a ** 2.) + x in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (a * a) + x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,14)-(3,23)
a * a
BopG VarG VarG

*)

(* changed exprs
Bop (Just (3,14)-(3,21)) Times (Var (Just (3,15)-(3,16)) "a") (Var (Just (3,19)-(3,20)) "a")
*)

(* typed spans
(3,14)-(3,21)
*)

(* correct types
int
*)

(* bad types
float
*)
