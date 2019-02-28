
let rec clone x n = if n <= 0 then [] else [x] :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then (clone 0 ((List.length l2) - (List.length l1))) :: l1
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
(2,14)-(2,67)
EMPTY
EmptyG

(9,9)-(9,56)
EMPTY
EmptyG

(9,9)-(9,62)
(0 :: l1 , l2)
TupleG (fromList [VarG,ConAppG (Just (TupleG (fromList [VarG,LitG])))])

(9,18)-(9,55)
EMPTY
EmptyG

(9,60)-(9,62)
l2
VarG

(10,28)-(10,30)
(l1 , 0 :: l2)
TupleG (fromList [VarG,ConAppG (Just (TupleG (fromList [VarG,LitG])))])

*)

(* typed spans
(7,9)-(7,24)
(7,21)-(7,23)
(8,9)-(8,24)
*)

(* typed spans
(int list * int list)
int list
(int list * int list)
*)

(* typed spans
int list list list
int list list list
int list list list
*)
