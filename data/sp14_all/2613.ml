
let rec clone x n =
  let acc = [x] in if n > 0 then clone (x :: acc) (n - 1) else [];;


(* fix

let rec clone x n = let acc = [0] in if n > 0 then clone x (n - 1) else [];;

*)

(* changed spans
(3,13)-(3,14)
0
LitG

(3,39)-(3,49)
x
VarG

*)

(* changed exprs
Lit (Just (2,31)-(2,32)) (LI 0)
Var (Just (2,57)-(2,58)) "x"
*)

(* typed spans
(2,31)-(2,32)
(2,57)-(2,58)
*)

(* correct types
int
'a
*)

(* bad types
'a
'a list
*)
