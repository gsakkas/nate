
let rec clone x n =
  let acc = [0] in if n > 0 then clone (x :: acc) (n - 1) else [];;


(* fix

let rec clone x n = let acc = [0] in if n > 0 then clone x (n - 1) else [];;

*)

(* changed spans
(3,39)-(3,49)
x
VarG

*)

(* changed exprs
Var (Just (2,57)-(2,58)) "x"
*)

(* typed spans
(2,57)-(2,58)
*)

(* correct types
'a
*)

(* bad types
int list
*)
