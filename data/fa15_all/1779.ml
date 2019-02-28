
let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::l' -> (match h with | (a,b) -> if a = k then b assoc (d, k, l'));;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::l' -> (match h with | (a,b) -> if a = k then b else assoc (d, k, l'));;

*)

(* changed spans
(5,52)-(5,70)
b
VarG

(5,52)-(5,70)
assoc (d , k , l')
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
Var (Just (5,52)-(5,53)) "b"
App (Just (5,59)-(5,75)) (Var (Just (5,59)-(5,64)) "assoc") [Tuple (Just (5,65)-(5,75)) [Var (Just (5,66)-(5,67)) "d",Var (Just (5,69)-(5,70)) "k",Var (Just (5,72)-(5,74)) "l'"]]
*)

(* typed spans
(5,52)-(5,53)
(5,59)-(5,75)
*)

(* correct types
'a
'a
*)

(* bad types
unit
unit
*)
