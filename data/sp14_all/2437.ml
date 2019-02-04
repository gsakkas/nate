
let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then ((0 :: l1), (0 :: l2))
    else ([l1], [l2]);;


(* fix

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (0 :: l2))
  else
    if (List.length l1) < (List.length l2) then ((0 :: l1), l2) else (l1, l2);;

*)

(* changed spans
(3,5)-(3,40)
List.length l1 > List.length l2
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(4,12)-(4,14)
0
LitG

(7,21)-(7,30)
EMPTY
EmptyG

(7,22)-(7,23)
EMPTY
EmptyG

(8,10)-(8,14)
EMPTY
EmptyG

(8,16)-(8,20)
EMPTY
EmptyG

*)
