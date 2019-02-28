
let rec append list1 list2 = match list1 with | [] -> [] | h::t -> h :: list2;;

let rec listReverse l =
  match l with | [] -> [] | h::[] -> l | h::t -> listReverse (append (t [h]));;


(* fix

let rec append list1 list2 = match list1 with | [] -> [] | h::t -> h :: list2;;

let rec listReverse l =
  match l with | [] -> [] | h::[] -> l | h::t -> listReverse (append t [h]);;

*)

(* changed spans
(5,61)-(5,77)
append t [h]
AppG (fromList [VarG,ListG EmptyG])

*)

(* changed exprs
App (Just (5,61)-(5,75)) (Var (Just (5,62)-(5,68)) "append") [Var (Just (5,69)-(5,70)) "t",List (Just (5,71)-(5,74)) [Var (Just (5,72)-(5,73)) "h"] Nothing]
*)

(* typed spans
(5,61)-(5,75)
*)

(* correct types
'a list
*)

(* bad types
'a list -> 'a list
*)
