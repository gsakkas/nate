
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else
      if (List.length l2) < (List.length l1)
      then (clone 0 ((List.length l1) - (List.length l2))) @ l2;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

*)

(* changed spans
(11,6)-(12,63)
(11,9)-(11,25)
(11,9)-(11,44)
(11,10)-(11,21)
(11,22)-(11,24)
(11,28)-(11,44)
(11,29)-(11,40)
*)

(* type error slice
(8,4)-(12,63)
(8,4)-(12,63)
(9,9)-(9,69)
(11,6)-(12,63)
(11,6)-(12,63)
(11,6)-(12,63)
(12,11)-(12,63)
(12,59)-(12,60)
*)

(* all spans
(2,14)-(2,65)
(2,16)-(2,65)
(2,20)-(2,65)
(2,23)-(2,29)
(2,23)-(2,24)
(2,28)-(2,29)
(2,35)-(2,37)
(2,43)-(2,65)
(2,43)-(2,44)
(2,48)-(2,65)
(2,49)-(2,54)
(2,55)-(2,56)
(2,57)-(2,64)
(2,58)-(2,59)
(2,62)-(2,63)
(4,12)-(12,63)
(4,15)-(12,63)
(5,2)-(12,63)
(5,5)-(5,40)
(5,5)-(5,21)
(5,6)-(5,17)
(5,18)-(5,20)
(5,24)-(5,40)
(5,25)-(5,36)
(5,37)-(5,39)
(6,7)-(6,15)
(6,8)-(6,10)
(6,12)-(6,14)
(8,4)-(12,63)
(8,7)-(8,42)
(8,7)-(8,23)
(8,8)-(8,19)
(8,20)-(8,22)
(8,26)-(8,42)
(8,27)-(8,38)
(8,39)-(8,41)
(9,9)-(9,69)
(9,10)-(9,64)
(9,59)-(9,60)
(9,11)-(9,58)
(9,12)-(9,17)
(9,18)-(9,19)
(9,20)-(9,57)
(9,21)-(9,37)
(9,22)-(9,33)
(9,34)-(9,36)
(9,40)-(9,56)
(9,41)-(9,52)
(9,53)-(9,55)
(9,61)-(9,63)
(9,66)-(9,68)
(11,6)-(12,63)
(11,9)-(11,44)
(11,9)-(11,25)
(11,10)-(11,21)
(11,22)-(11,24)
(11,28)-(11,44)
(11,29)-(11,40)
(11,41)-(11,43)
(12,11)-(12,63)
(12,59)-(12,60)
(12,11)-(12,58)
(12,12)-(12,17)
(12,18)-(12,19)
(12,20)-(12,57)
(12,21)-(12,37)
(12,22)-(12,33)
(12,34)-(12,36)
(12,40)-(12,56)
(12,41)-(12,52)
(12,53)-(12,55)
(12,61)-(12,63)
(11,6)-(12,63)
*)