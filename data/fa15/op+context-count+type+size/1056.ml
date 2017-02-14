
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then l1 @ [(clone 0 ((List.length l1) - (List.length l2))) @ l2]
  else
    if (List.length l1) < (List.length l2)
    then (clone 0 ((List.length l2) - (List.length l1))) @ (l1 @ l2)
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
(6,8)-(6,67)
(6,11)-(6,12)
(6,13)-(6,67)
(9,11)-(9,68)
(9,61)-(9,68)
(9,64)-(9,65)
(10,10)-(10,12)
*)

(* type error slice
(5,3)-(10,12)
(5,3)-(10,12)
(6,8)-(6,10)
(6,8)-(6,67)
(6,11)-(6,12)
(6,13)-(6,67)
(6,13)-(6,67)
(6,15)-(6,66)
(6,62)-(6,63)
(6,64)-(6,66)
(8,5)-(10,12)
(9,11)-(9,68)
(9,58)-(9,59)
(9,61)-(9,63)
(9,61)-(9,68)
(9,64)-(9,65)
(9,66)-(9,68)
*)
