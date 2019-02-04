
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
(5,38)-(5,70)
EMPTY
EmptyG

(5,52)-(5,70)
EMPTY
EmptyG

(5,54)-(5,59)
assoc (d , k , l')
AppG (fromList [TupleG (fromList [EmptyG])])

*)
