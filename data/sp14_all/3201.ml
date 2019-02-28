
let sqsum xs =
  let f a x f _ = a * a in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = a * x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,12)-(3,23)
a * x
BopG VarG VarG

*)

(* changed exprs
Bop (Just (2,27)-(2,32)) Times (Var (Just (2,27)-(2,28)) "a") (Var (Just (2,31)-(2,32)) "x")
*)

(* typed spans
(2,27)-(2,32)
*)

(* correct types
int
*)

(* bad types
'a -> 'b -> int
*)
