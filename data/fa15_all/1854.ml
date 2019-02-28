
let rec listReverse l = match l with | [] -> [] | h::t -> t @ h;;


(* fix

let rec listReverse l = match l with | [] -> [] | h::t -> t @ [h];;

*)

(* changed spans
(2,62)-(2,63)
[h]
ListG VarG

*)

(* changed exprs
List (Just (2,62)-(2,65)) [Var (Just (2,63)-(2,64)) "h"] Nothing
*)

(* typed spans
(2,62)-(2,65)
*)

(* correct types
'a list
*)

(* bad types
'a
*)
