
let sqsum xs = let f a x = a * a in let base = 0 in List.fold_right f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(2,27)-(2,32)
a + (x * x)
BopG VarG (BopG EmptyG EmptyG)

(2,52)-(2,67)
List.fold_left
VarG

*)

(* changed exprs
Bop (Just (3,14)-(3,25)) Plus (Var (Just (3,14)-(3,15)) "a") (Bop (Just (3,18)-(3,25)) Times (Var (Just (3,19)-(3,20)) "x") (Var (Just (3,23)-(3,24)) "x"))
Var (Just (3,45)-(3,59)) "List.fold_left"
*)

(* typed spans
(3,14)-(3,25)
(3,45)-(3,59)
*)

(* correct types
int
(int -> int -> int) -> int -> int list -> int
*)

(* bad types
int
(int -> int -> int) -> int list -> int -> int
*)
