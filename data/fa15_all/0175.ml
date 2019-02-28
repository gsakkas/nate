
let rec sumList xs = match xs with | [] -> [] | h::t -> h + (sumList t);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList xs);;

*)

(* changed spans
(2,43)-(2,45)
0
LitG

(2,69)-(2,70)
xs
VarG

*)

(* changed exprs
Lit (Just (2,43)-(2,44)) (LI 0)
Var (Just (2,68)-(2,70)) "xs"
*)

(* typed spans
(2,43)-(2,44)
(2,68)-(2,70)
*)

(* correct types
int
int list
*)

(* bad types
'a list
int list
*)
