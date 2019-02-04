
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then [(l1, l2)]
  else
    (let numZeros = (List.length l1) - (List.length l2) in
     if numZeros = 0
     then [(l1, l2)]
     else
       (let listZeros = clone (0, (abs numZeros)) in
        if numZeros > 0
        then let list1 = l1 in let list2 = listZeros @ l2 in [(list1, list2)]
        else
          (let list1 = listZeros @ l1 in let list2 = l2 in [(list1, list2)])));;


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
(5,2)-(16,78)
EMPTY
EmptyG

(5,5)-(5,21)
EMPTY
EmptyG

(5,5)-(5,40)
EMPTY
EmptyG

(5,6)-(5,17)
EMPTY
EmptyG

(5,18)-(5,20)
EMPTY
EmptyG

(5,24)-(5,40)
EMPTY
EmptyG

(5,25)-(5,36)
EMPTY
EmptyG

(5,37)-(5,39)
EMPTY
EmptyG

(6,7)-(6,17)
EMPTY
EmptyG

(6,8)-(6,16)
EMPTY
EmptyG

(6,9)-(6,11)
EMPTY
EmptyG

(6,13)-(6,15)
EMPTY
EmptyG

(9,5)-(16,77)
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

(10,10)-(10,20)
EMPTY
EmptyG

(12,24)-(12,49)
clone 0 absNumZeros
AppG (fromList [VarG,LitG])

(12,30)-(12,49)
EMPTY
EmptyG

(12,34)-(12,48)
EMPTY
EmptyG

(12,35)-(12,38)
EMPTY
EmptyG

(12,39)-(12,47)
absNumZeros
VarG

(14,13)-(14,77)
(l1 , listZeros @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(14,31)-(14,77)
EMPTY
EmptyG

(14,61)-(14,77)
EMPTY
EmptyG

(14,63)-(14,68)
EMPTY
EmptyG

(14,70)-(14,75)
EMPTY
EmptyG

(16,10)-(16,76)
EMPTY
EmptyG

(16,41)-(16,75)
EMPTY
EmptyG

(16,59)-(16,75)
EMPTY
EmptyG

(16,60)-(16,74)
EMPTY
EmptyG

(16,61)-(16,66)
EMPTY
EmptyG

(16,68)-(16,73)
EMPTY
EmptyG

*)
