
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let numZeros = (List.length l1) - (List.length l2) in
  if numZeros = 0
  then (l1, l2)
  else
    if numZeros > 0
    then (l1, ((clone 0 numZeros) @ l2))
    else (((clone (0, (abs numZeros))) @ l1), l2);;


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
(6,2)-(11,49)
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

(9,4)-(11,49)
let listZeros =
  clone 0 absNumZeros in
if numZeros > 0
then (l1 , listZeros @ l2)
else (listZeros @ l1 , l2)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (IteG EmptyG EmptyG EmptyG)

(10,15)-(10,33)
listZeros
VarG

(11,11)-(11,38)
listZeros
VarG

*)

(* typed spans
(6,2)-(11,77)
(10,4)-(11,77)
(11,32)-(11,41)
(11,56)-(11,65)
*)

(* typed spans
(int list * int list)
(int list * int list)
int list
int list
*)

(* typed spans
('a list * int list)
('a list * int list)
int list
'a list
*)
