
let sqsum xs =
  let f a x = a ** 2 in let base = f 2 xs in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = a in let base = f 2 xs in List.fold_left f base xs;;

*)

(* changed spans
(3,14)-(3,20)
a
VarG

*)

(* changed exprs
Var (Just (2,27)-(2,28)) "a"
*)

(* typed spans
(2,27)-(2,28)
*)

(* correct types
int
*)

(* bad types
float
*)
