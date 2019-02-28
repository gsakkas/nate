
let rec clone x n =
  let acc = [] in if n > 0 then clone (x :: x) (n - 1) else [];;


(* fix

let rec clone x n = let acc = [x] in if n > 0 then clone x (n - 1) else [];;

*)

(* changed spans
(3,12)-(3,14)
[x]
ListG VarG

(3,38)-(3,46)
x
VarG

*)

(* changed exprs
List (Just (2,30)-(2,33)) [Var (Just (2,31)-(2,32)) "x"] Nothing
Var (Just (2,57)-(2,58)) "x"
*)

(* typed spans
(2,30)-(2,33)
(2,57)-(2,58)
*)

(* correct types
'a list
'a
*)

(* bad types
'a list
'a list
*)
