
let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (l2 :: 0))
  else
    if (List.length l1) < (List.length l2) then ((0 :: l1), l2) else (l1, l2);;


(* fix

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (0 :: l2))
  else
    if (List.length l1) < (List.length l2) then ((0 :: l1), l2) else (l1, l2);;

*)

(* changed spans
(4,13)-(4,15)
EMPTY
EmptyG

(6,4)-(6,77)
l2
VarG

*)
