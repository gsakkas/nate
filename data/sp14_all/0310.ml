
let rec sumList xs = match 1 with | [] -> 0 | h::t -> h + (sumList t);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

*)

(* changed spans
(2,27)-(2,28)
xs
VarG

*)

(* changed exprs
Var (Just (2,27)-(2,29)) "xs"
*)

(* typed spans
(2,27)-(2,29)
*)

(* correct types
int list
*)

(* bad types
int
*)
