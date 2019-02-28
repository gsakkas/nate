
let rec listReverse l = match l with | h::t -> [h] @ (listReverse [t]);;


(* fix

let rec listReverse l = match l with | h::t -> [h] @ (listReverse t);;

*)

(* changed spans
(2,66)-(2,69)
t
VarG

*)

(* changed exprs
Var (Just (2,66)-(2,67)) "t"
*)

(* typed spans
(2,66)-(2,67)
*)

(* correct types
'a list
*)

(* bad types
'a list list
*)
