
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else [];;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, l2);;

*)

(* changed spans
(10,9)-(10,11)
(l1 , l2)
TupleG (fromList [VarG])

*)

(* changed exprs
Tuple (Just (10,9)-(10,17)) [Var (Just (10,10)-(10,12)) "l1",Var (Just (10,14)-(10,16)) "l2"]
*)

(* typed spans
(10,9)-(10,17)
*)

(* correct types
(int list * int list)
*)

(* bad types
'a list
*)
