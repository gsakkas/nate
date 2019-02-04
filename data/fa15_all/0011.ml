
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let numZeros = (List.length l1) - (List.length l2) in
  if numZeros = 0
  then [(l1, l2)]
  else
    (let listZeros = clone (0, (abs numZeros)) in
     if numZeros > 0
     then let list1 = l1 in let list2 = listZeros @ l2 in [(list1, list2)]
     else (let list1 = listZeros @ l1 in let list2 = l2 in [(list1, list2)]));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let numZeros = (List.length l1) - (List.length l2) in
  let absNumZeros = abs numZeros in
  if numZeros = 0
  then (l1, l2)
  else
    (let listZeros = clone 0 absNumZeros in
     if numZeros > 0 then (l1, (listZeros @ l2)) else ((listZeros @ l1), l2));;

*)

(* changed spans
(6,2)-(12,77)
let absNumZeros =
  abs numZeros in
if numZeros = 0
then (l1 , l2)
else (let listZeros =
        clone 0 absNumZeros in
      if numZeros > 0
      then (l1 , listZeros @ l2)
      else (listZeros @ l1 , l2))
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (IteG EmptyG EmptyG EmptyG)

(7,7)-(7,17)
EMPTY
EmptyG

(9,21)-(9,46)
clone 0 absNumZeros
AppG (fromList [VarG,LitG])

(9,27)-(9,46)
EMPTY
EmptyG

(9,31)-(9,45)
EMPTY
EmptyG

(9,32)-(9,35)
EMPTY
EmptyG

(9,36)-(9,44)
absNumZeros
VarG

(11,10)-(11,74)
(l1 , listZeros @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(11,28)-(11,74)
EMPTY
EmptyG

(11,58)-(11,74)
EMPTY
EmptyG

(11,60)-(11,65)
EMPTY
EmptyG

(11,67)-(11,72)
EMPTY
EmptyG

(12,10)-(12,76)
EMPTY
EmptyG

(12,41)-(12,75)
EMPTY
EmptyG

(12,59)-(12,75)
EMPTY
EmptyG

(12,60)-(12,74)
EMPTY
EmptyG

(12,61)-(12,66)
EMPTY
EmptyG

(12,68)-(12,73)
EMPTY
EmptyG

*)
