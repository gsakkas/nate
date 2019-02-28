
let rec sumList xs = match sumList with | [] -> 0 | h::t -> h + (sumList t);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

*)

(* changed spans
(2,27)-(2,34)
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
int list -> int
*)
