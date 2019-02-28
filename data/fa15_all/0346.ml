
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padLength l1 l2 = abs ((List.length l1) - (List.length l2));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 (padLength l1 l2)) l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, (List.append (clone 0 (padLength l1 l2)) l2))
    else l1 l2;;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padLength l1 l2 = abs ((List.length l1) - (List.length l2));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 (padLength l1 l2)) l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, (List.append (clone 0 (padLength l1 l2)) l2))
    else (l1, l2);;

*)

(* changed spans
(12,9)-(12,14)
(l1 , l2)
TupleG (fromList [VarG])

*)

(* changed exprs
Tuple (Just (12,9)-(12,17)) [Var (Just (12,10)-(12,12)) "l1",Var (Just (12,14)-(12,16)) "l2"]
*)

(* typed spans
(12,9)-(12,17)
*)

(* correct types
(int list * int list)
*)

(* bad types
(int list * int list)
*)
