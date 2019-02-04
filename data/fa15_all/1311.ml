
let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  let retTuple = l1 * l2 in if difference1 > 0 then retTuple;;


(* fix

let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  let retTuple = (l1, l2) in retTuple;;

*)

(* changed spans
(5,17)-(5,24)
(l1 , l2)
TupleG (fromList [VarG])

(5,28)-(5,60)
EMPTY
EmptyG

(5,31)-(5,42)
EMPTY
EmptyG

(5,31)-(5,46)
EMPTY
EmptyG

(5,45)-(5,46)
EMPTY
EmptyG

*)
