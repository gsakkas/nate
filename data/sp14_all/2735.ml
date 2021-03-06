
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let a = (List.length l1) - (List.length l2) in
  if a > 0 then l1 * (clone 0 a) else l1 * l2;;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let a = (List.length l1) - (List.length l2) in
  if a > 0 then (l1, (clone 0 a)) else (l1, l2);;

*)

(* changed spans
(6,17)-(6,33)
(l1 , clone 0 a)
TupleG [VarG,AppG [EmptyG,EmptyG]]

(6,39)-(6,46)
(l1 , l2)
TupleG [VarG,VarG]

*)

(* type error slice
(2,43)-(2,65)
(2,48)-(2,65)
(2,49)-(2,54)
(5,11)-(5,27)
(5,12)-(5,23)
(5,24)-(5,26)
(5,30)-(5,46)
(5,31)-(5,42)
(5,43)-(5,45)
(6,17)-(6,19)
(6,17)-(6,33)
(6,22)-(6,33)
(6,23)-(6,28)
(6,39)-(6,41)
(6,39)-(6,46)
(6,44)-(6,46)
*)
