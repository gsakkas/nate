
let rec clone x n =
  if n < 1 then [] else (match n with | _ -> [x] @ (clone x (n - 1)));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else if s1 > s2 then (l1, (clone 0 (s1 - s2))) else clone 0 (s2 - s1);;


(* fix

let rec clone x n =
  if n < 1 then [] else (match n with | _ -> [x] @ (clone x (n - 1)));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2 then (l1, (clone 0 (s1 - s2))) else ((clone 0 (s2 - s1)), l2);;

*)

(* changed spans
(10,54)-(10,71)
(clone 0 (s2 - s1) , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)
