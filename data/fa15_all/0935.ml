
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((clone "0" List.length l2) - (List.length l1)) :: l1
  else ((clone "0" List.length l1) - (List.length l2)) :: l2;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (((clone 0 ((List.length l1) - (List.length l2))) @ l2), l1);;

*)

(* changed spans
(6,7)-(6,54)
EMPTY
EmptyG

(6,7)-(6,60)
EMPTY
EmptyG

(6,8)-(6,34)
(clone 0
       (List.length l2 - List.length l1) @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(6,9)-(6,14)
clone 0
      (List.length l2 - List.length l1) @ l1
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(6,15)-(6,18)
0
LitG

(6,19)-(6,30)
List.length l2 - List.length l1
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(7,7)-(7,54)
EMPTY
EmptyG

(7,7)-(7,60)
EMPTY
EmptyG

(7,8)-(7,34)
l2
VarG

(7,9)-(7,14)
(clone 0
       (List.length l1 - List.length l2) @ l2 , l1)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(7,15)-(7,18)
0
LitG

(7,19)-(7,30)
List.length l1 - List.length l2
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)
