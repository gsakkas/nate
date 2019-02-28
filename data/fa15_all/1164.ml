
let rec assoc (d,k,l) =
  match (k, d) with
  | [] -> d
  | h::t -> if (k, d) = l then d else assoc (d, k, t);;


(* fix

let rec assoc (d,k,l) =
  match [(k, d)] with
  | [] -> d
  | h::t -> if (k, d) = h then d else assoc (d, k, t);;

*)

(* changed spans
(3,8)-(3,14)
[(k , d)]
ListG (TupleG (fromList [EmptyG]))

(5,24)-(5,25)
h
VarG

*)

(* changed exprs
List (Just (3,8)-(3,16)) [Tuple (Just (3,9)-(3,15)) [Var (Just (3,10)-(3,11)) "k",Var (Just (3,13)-(3,14)) "d"]] Nothing
Var (Just (5,24)-(5,25)) "h"
*)

(* typed spans
(3,8)-(3,16)
(5,24)-(5,25)
*)

(* correct types
('a * 'b) list
('a * 'b)
*)

(* bad types
('a * 'b)
('a * 'b)
*)
