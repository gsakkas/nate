
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let numZeros = (List.length l1) - (List.length l2) in
  if numZeros = 0
  then (l1, l2)
  else
    (let listZeros = clone (0, (abs numZeros)) in
     if numZeros > 0 then (l1, (listZeros @ l2)));;


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
(6,2)-(10,49)
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

(9,21)-(9,46)
clone 0 absNumZeros
AppG (fromList [VarG,LitG])

(9,27)-(9,46)
EMPTY
EmptyG

(9,31)-(9,45)
absNumZeros
VarG

(10,5)-(10,48)
(listZeros @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* typed spans
(6,2)-(11,77)
(10,21)-(10,40)
(10,29)-(10,40)
(11,54)-(11,76)
*)

(* typed spans
(int list * int list)
int list
int
(int list * int list)
*)

(* typed spans
unit
int -> (int * int) list
int
unit
*)
