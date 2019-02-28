
let rec clone x n =
  let rec helper a x n =
    if n <= 0 then a else (let a' = x :: a in helper a' x (n - 1)) in
  helper [] x n;;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  if length1 > length2
  then (l1, (List.append (clone 0 (length1 - length2)) l2))
  else
    if length2 length1
    then ((List.append (clone 0 (length1 - length2)) l1), l2)
    else (l1, l2);;


(* fix

let rec clone x n =
  let rec helper a x n =
    if n <= 0 then a else (let a' = x :: a in helper a' x (n - 1)) in
  helper [] x n;;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  if length1 > length2
  then (l1, (List.append (clone 0 (length1 - length2)) l2))
  else
    if length2 > length1
    then ((List.append (clone 0 (length1 - length2)) l1), l2)
    else (l1, l2);;

*)

(* changed spans
(13,7)-(13,22)
length2 > length1
BopG VarG VarG

*)

(* changed exprs
Bop (Just (13,7)-(13,24)) Gt (Var (Just (13,7)-(13,14)) "length2") (Var (Just (13,17)-(13,24)) "length1")
*)

(* typed spans
(13,7)-(13,24)
*)

(* correct types
bool
*)

(* bad types
bool
*)
