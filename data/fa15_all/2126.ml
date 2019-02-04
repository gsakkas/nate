
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len = (List.length l1) - (List.length l2) in
  if len <= 0
  then ((((clone 0 (-1)) * len) @ l1), l2)
  else (l1, ((clone 0 len) @ l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len = (List.length l1) - (List.length l2) in
  if len <= 0
  then (((clone 0 ((-1) * len)) @ l1), l2)
  else (l1, ((clone 0 len) @ l2));;

*)

(* changed spans
(7,9)-(7,31)
EMPTY
EmptyG

(7,19)-(7,23)
(-1) * len
BopG LitG VarG

*)
