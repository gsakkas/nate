
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then let n = (List.length l2) - (List.length l1) in clone (0 n)
  else
    if (List.length l2) < (List.length l1)
    then (let n = (List.length l1) - (List.length l2) in clone (0 n))
    else (l1, l2);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

*)

(* changed spans
(5,5)-(5,40)
List.length l1 = List.length l2
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(6,7)-(6,65)
EMPTY
EmptyG

(6,15)-(6,31)
EMPTY
EmptyG

(6,15)-(6,50)
EMPTY
EmptyG

(6,16)-(6,27)
(l1 , l2)
TupleG (fromList [VarG])

(6,28)-(6,30)
l1
VarG

(6,34)-(6,50)
if List.length l1 < List.length l2
then (clone 0
            (List.length l2 - List.length l1) @ l1 , l2)
else (l1 , clone 0
                 (List.length l1 - List.length l2) @ l2)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(6,54)-(6,59)
(clone 0
       (List.length l2 - List.length l1) @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(6,60)-(6,65)
EMPTY
EmptyG

(6,63)-(6,64)
EMPTY
EmptyG

(8,4)-(10,17)
EMPTY
EmptyG

(8,7)-(8,42)
List.length l2 - List.length l1
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(9,9)-(9,69)
l1
VarG

(9,18)-(9,53)
(l1 , clone 0
            (List.length l1 - List.length l2) @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(9,57)-(9,62)
EMPTY
EmptyG

(9,57)-(9,68)
EMPTY
EmptyG

(9,63)-(9,68)
EMPTY
EmptyG

(9,64)-(9,65)
EMPTY
EmptyG

(9,66)-(9,67)
EMPTY
EmptyG

(10,9)-(10,17)
EMPTY
EmptyG

(10,10)-(10,12)
EMPTY
EmptyG

*)
