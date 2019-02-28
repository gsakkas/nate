
let rec listReverse l =
  match l with | [] -> l | hd::tail -> (listReverse tail) @ hd;;


(* fix

let rec listReverse l =
  match l with | [] -> l | hd::tail -> (listReverse tail) @ [hd];;

*)

(* changed spans
(3,60)-(3,62)
[hd]
ListG VarG

*)

(* changed exprs
List (Just (3,60)-(3,64)) [Var (Just (3,61)-(3,63)) "hd"] Nothing
*)

(* typed spans
(3,60)-(3,64)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
