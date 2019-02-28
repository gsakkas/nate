
let rec listReverse l = match l with | [] -> l | h::t -> h;;


(* fix

let rec listReverse l = match l with | [] -> l | h::t -> [h];;

*)

(* changed spans
(2,57)-(2,58)
[h]
ListG VarG

*)

(* changed exprs
List (Just (2,57)-(2,60)) [Var (Just (2,58)-(2,59)) "h"] Nothing
*)

(* typed spans
(2,57)-(2,60)
*)

(* correct types
'a list
*)

(* bad types
'a
*)
