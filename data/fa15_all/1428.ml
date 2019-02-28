
let rec listReverse l = match l with | h::t -> listReverse h | [] -> [];;


(* fix

let rec listReverse l = match l with | h::t -> listReverse [h] | [] -> [];;

*)

(* changed spans
(2,59)-(2,60)
[h]
ListG VarG

*)

(* changed exprs
List (Just (2,59)-(2,62)) [Var (Just (2,60)-(2,61)) "h"] Nothing
*)

(* typed spans
(2,59)-(2,62)
*)

(* correct types
'a list
*)

(* bad types
'a
*)
