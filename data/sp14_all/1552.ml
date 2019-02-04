
let rec listReverse l =
  let rec listHelper l l2 =
    match l with | [] -> l2 | h::t -> (listHelper t h) :: l2 in
  listHelper l [];;


(* fix

let rec listReverse l =
  let rec listHelper l l2 =
    match l with | [] -> l2 | h::t -> listHelper t (h :: l2) in
  listHelper l [];;

*)

(* changed spans
(4,38)-(4,60)
EMPTY
EmptyG

(4,52)-(4,53)
h :: l2
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

*)
