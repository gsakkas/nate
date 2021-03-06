
let rec clone x n = if n <= 0 then [] else [x] :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) :: l1), l2)
    else clone (List.length l1) (0 :: l2);;


(* fix

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then ((0 :: l1), l2)
    else (l1, (0 :: l2));;

*)

(* changed spans
(9,12)-(9,59)
0
LitG

(10,10)-(10,42)
(l1 , 0 :: l2)
TupleG [VarG,AppG [EmptyG,EmptyG]]

*)

(* type error slice
(2,51)-(2,68)
(2,52)-(2,57)
(2,60)-(2,67)
(10,10)-(10,15)
(10,10)-(10,42)
(10,33)-(10,42)
*)
