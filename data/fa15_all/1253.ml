
let rec clone x n = if n <= 0 then [] else [x] :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (clone 0 ((List.length l1) - (List.length l2)))) @ l2
  else (((clone 9 ((List.length l2) - (List.length l1))) @ l1), l2);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

*)

(* changed spans
(2,43)-(2,46)
EMPTY
EmptyG

(6,7)-(6,65)
EMPTY
EmptyG

(6,13)-(6,18)
clone 0
      (List.length l1 - List.length l2)
AppG (fromList [BopG EmptyG EmptyG,LitG])

(6,61)-(6,62)
EMPTY
EmptyG

(7,16)-(7,17)
0
LitG

*)
