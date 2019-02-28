
let sqsum xs =
  let f a x a x = (x * x) + a in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (x * x) + a in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,12)-(3,29)
(x * x) + a
BopG (BopG EmptyG EmptyG) VarG

*)

(* changed exprs
Bop (Just (3,14)-(3,25)) Plus (Bop (Just (3,14)-(3,21)) Times (Var (Just (3,15)-(3,16)) "x") (Var (Just (3,19)-(3,20)) "x")) (Var (Just (3,24)-(3,25)) "a")
*)

(* typed spans
(3,14)-(3,25)
*)

(* correct types
int
*)

(* bad types
int -> int -> int
*)
