
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let numZeros = (List.length l1) - (List.length l2) in
  let listZeros = clone (0, (abs numZeros)) in
  if numZeros > 0 then [(l1, (listZeros @ l2))] else [((listZeros @ l1), l2)];;


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
(6,2)-(7,77)
EMPTY
EmptyG

(6,18)-(6,23)
EMPTY
EmptyG

(6,18)-(6,43)
EMPTY
EmptyG

(6,24)-(6,43)
EMPTY
EmptyG

(6,25)-(6,26)
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

(7,5)-(7,17)
let listZeros =
  clone 0 absNumZeros in
if numZeros > 0
then (l1 , listZeros @ l2)
else (listZeros @ l1 , l2)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (IteG EmptyG EmptyG EmptyG)

(7,23)-(7,47)
EMPTY
EmptyG

(7,53)-(7,77)
EMPTY
EmptyG

*)
