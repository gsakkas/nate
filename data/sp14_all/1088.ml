
let rec clone x n =
  let rec cloneHelper x n acc =
    if n < 0 then acc else cloneHelper x (n - 1) (x :: acc) in
  cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then ((List.combine ((clone 0 (abs diff)), l1)), l2)
  else if diff > 0 then (l1, (List.combine ((clone 0 diff), l2)));;


(* fix

let rec clone x n =
  let rec cloneHelper x n acc =
    if n < 0 then acc else cloneHelper x (n - 1) (x :: acc) in
  cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then ((List.append (clone 0 (abs diff)) l1), l2)
  else if diff > 0 then (l1, (List.append (clone 0 diff) l2)) else (l1, l2);;

*)

(* changed spans
(10,8)-(10,49)
List.append (clone 0
                   (abs diff)) l1
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(11,29)-(11,64)
List.append (clone 0 diff) l2
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(11,29)-(11,64)
List.append
VarG

(11,45)-(11,50)
clone 0 diff
AppG (fromList [VarG,LitG])

(11,7)-(11,65)
(l1 , l2)
TupleG (fromList [VarG])

*)

(* changed exprs
App (Just (10,8)-(10,45)) (Var (Just (10,9)-(10,20)) "List.append") [App (Just (10,21)-(10,41)) (Var (Just (10,22)-(10,27)) "clone") [Lit (Just (10,28)-(10,29)) (LI 0),App (Just (10,30)-(10,40)) (Var (Just (10,31)-(10,34)) "abs") [Var (Just (10,35)-(10,39)) "diff"]],Var (Just (10,42)-(10,44)) "l1"]
App (Just (11,29)-(11,60)) (Var (Just (11,30)-(11,41)) "List.append") [App (Just (11,42)-(11,56)) (Var (Just (11,43)-(11,48)) "clone") [Lit (Just (11,49)-(11,50)) (LI 0),Var (Just (11,51)-(11,55)) "diff"],Var (Just (11,57)-(11,59)) "l2"]
Var (Just (11,30)-(11,41)) "List.append"
App (Just (11,42)-(11,56)) (Var (Just (11,43)-(11,48)) "clone") [Lit (Just (11,49)-(11,50)) (LI 0),Var (Just (11,51)-(11,55)) "diff"]
Tuple (Just (11,67)-(11,75)) [Var (Just (11,68)-(11,70)) "l1",Var (Just (11,72)-(11,74)) "l2"]
*)

(* typed spans
(10,8)-(10,45)
(11,29)-(11,60)
(11,30)-(11,41)
(11,42)-(11,56)
(11,67)-(11,75)
*)

(* correct types
int list
int list
int list -> int list -> int list
int list
(int list * int list)
*)

(* bad types
'a
'a
'a
int -> int -> int list
unit
*)
