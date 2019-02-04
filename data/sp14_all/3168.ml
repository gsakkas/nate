
let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then
    List.append [(clone 0 ((List.length l2) - (List.length l1))) @ l1] [l2]
  else
    (List.length l1) >
      ((List.length l2) List.append [l1]
         [(clone 0 ((List.length l1) - (List.length l2))) @ l2]);;


(* fix

let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

*)

(* changed spans
(10,4)-(10,15)
EMPTY
EmptyG

(10,4)-(10,75)
EMPTY
EmptyG

(10,16)-(10,70)
(clone 0
       (List.length l2 - List.length l1) @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(10,71)-(10,75)
EMPTY
EmptyG

(12,4)-(12,20)
EMPTY
EmptyG

(12,4)-(14,64)
EMPTY
EmptyG

(12,5)-(12,16)
EMPTY
EmptyG

(12,17)-(12,19)
EMPTY
EmptyG

(13,6)-(14,64)
EMPTY
EmptyG

(13,7)-(13,23)
EMPTY
EmptyG

(13,8)-(13,19)
EMPTY
EmptyG

(13,20)-(13,22)
EMPTY
EmptyG

(13,24)-(13,35)
EMPTY
EmptyG

(13,36)-(13,40)
(l1 , clone 0
            (List.length l1 - List.length l2) @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(14,9)-(14,63)
EMPTY
EmptyG

*)
