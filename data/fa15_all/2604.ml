
let rec listReverse l =
  match l with | [] -> [] | h::t -> [t] @ (listReverse h);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

*)

(* changed spans
(3,43)-(3,54)
t
VarG

(3,43)-(3,54)
[h]
ListG VarG

*)

(* changed exprs
Var (Just (3,49)-(3,50)) "t"
List (Just (3,54)-(3,57)) [Var (Just (3,55)-(3,56)) "h"] Nothing
*)

(* typed spans
(3,49)-(3,50)
(3,54)-(3,57)
*)

(* correct types
'a list
'a list
*)

(* bad types
'a -> 'a list list
'a -> 'a list list
*)
