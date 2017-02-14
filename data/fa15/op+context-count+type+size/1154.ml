
let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then ((cloneHelper 0) - (1 * diff)) @ l1
  else if diff > 0 then (cloneHelper 0 diff) @ l2;;


(* fix

let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let rec clone x n = if n < 1 then [] else cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then ((l1 @ (clone 0 diff)), l2)
  else if diff > 0 then (l1, (l2 @ (clone 0 diff))) else (l1, l2);;

*)

(* changed spans
(5,12)-(9,49)
(6,2)-(9,49)
(8,7)-(8,37)
(8,7)-(8,42)
(8,8)-(8,23)
(8,9)-(8,20)
(8,21)-(8,22)
(8,26)-(8,36)
(8,27)-(8,28)
(8,31)-(8,35)
(9,7)-(9,49)
(9,10)-(9,14)
(9,10)-(9,18)
(9,17)-(9,18)
(9,24)-(9,44)
(9,25)-(9,36)
(9,45)-(9,46)
*)

(* type error slice
(3,24)-(3,35)
(3,24)-(3,54)
(8,7)-(8,37)
(8,7)-(8,37)
(8,7)-(8,42)
(8,8)-(8,23)
(8,9)-(8,20)
(8,38)-(8,39)
(9,24)-(9,44)
(9,25)-(9,36)
*)
