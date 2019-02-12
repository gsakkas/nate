
let rec clone x n =
  let rec clone_RT acc n =
    if n <= 0 then acc else clone_RT (x :: acc) (n - 1) in
  clone_RT [] n;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  let diff = len1 - len2 in
  if diff < 0
  then List.append ((List.append ((clone 0 (- diff)), len1)), len2)
  else List.append ((List.append ((clone 0 diff), len2)), len1);;


(* fix

let rec clone x n =
  let rec clone_RT acc n =
    if n <= 0 then acc else clone_RT (x :: acc) (n - 1) in
  clone_RT [] n;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  let diff = len1 - len2 in
  if diff < 0
  then ((List.append (clone 0 (- diff)) l1), l2)
  else ((List.append (clone 0 diff) l2), l1);;

*)

(* changed spans
(12,7)-(12,18)
EMPTY
EmptyG

(12,7)-(12,67)
EMPTY
EmptyG

(12,20)-(12,60)
List.append (clone 0 (- diff))
            l1
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(12,33)-(12,59)
EMPTY
EmptyG

(12,54)-(12,58)
EMPTY
EmptyG

(12,62)-(12,66)
EMPTY
EmptyG

(13,7)-(13,18)
l1
VarG

(13,7)-(13,63)
EMPTY
EmptyG

(13,19)-(13,63)
l2
VarG

(13,20)-(13,56)
List.append (clone 0 diff) l2
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(13,33)-(13,55)
EMPTY
EmptyG

(13,50)-(13,54)
EMPTY
EmptyG

(13,58)-(13,62)
l2
VarG

*)