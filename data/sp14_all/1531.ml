
let sqsum xs =
  let f a x = x * x in let base = f 2 xs in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = a * a in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,18)-(3,19)
a
VarG

(3,23)-(3,68)
a
VarG

(3,34)-(3,40)
0
LitG

*)

(* changed exprs
Var (Just (2,27)-(2,28)) "a"
Var (Just (2,31)-(2,32)) "a"
Lit (Just (2,47)-(2,48)) (LI 0)
*)

(* typed spans
(2,27)-(2,28)
(2,31)-(2,32)
(2,47)-(2,48)
*)

(* correct types
int
int
int
*)

(* bad types
int
'a
int
*)
