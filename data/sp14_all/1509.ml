
let rec clone x n =
  let rec clonehelper tx tn =
    match tn = 0 with
    | true  -> []
    | false  -> tx :: (clonehelper tx (tn - 1)) in
  clonehelper x (abs n);;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then l1 :: ((clone 0 ((List.length l1) - (List.length l2))) @ [l2])
  else
    if (List.length l1) < (List.length l2)
    then l2 :: ((clone 0 ((List.length l2) - (List.length l1))) @ [l1]);;


(* fix

let rec clone x n =
  let rec clonehelper tx tn =
    match tn = 0 with
    | true  -> []
    | false  -> tx :: (clonehelper tx (tn - 1)) in
  clonehelper x (abs n);;

let padZero l1 l2 =
  match (List.length l1) > (List.length l2) with
  | true  -> (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  | false  -> (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

*)

(* changed spans
(10,2)-(14,71)
match List.length l1 > List.length l2 with
| true -> (l1 , clone 0
                      (List.length l1 - List.length l2) @ l2)
| false -> (clone 0
                  (List.length l2 - List.length l1) @ l1 , l2)
CaseG (BopG EmptyG EmptyG) (fromList [(Nothing,TupleG (fromList [EmptyG]))])

(11,7)-(11,69)
(l1 , clone 0
            (List.length l1 - List.length l2) @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(11,64)-(11,68)
EMPTY
EmptyG

(13,4)-(14,71)
l2
VarG

(13,7)-(13,23)
EMPTY
EmptyG

(13,7)-(13,42)
EMPTY
EmptyG

(13,8)-(13,19)
EMPTY
EmptyG

(13,20)-(13,22)
EMPTY
EmptyG

(13,26)-(13,42)
EMPTY
EmptyG

(13,27)-(13,38)
EMPTY
EmptyG

(13,39)-(13,41)
EMPTY
EmptyG

(14,9)-(14,11)
(clone 0
       (List.length l2 - List.length l1) @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(14,9)-(14,71)
EMPTY
EmptyG

(14,66)-(14,70)
EMPTY
EmptyG

*)
