
let rec clone x n =
  let rec cloneHelper x n acc =
    if n < 0 then acc else cloneHelper x (n - 1) (x :: acc) in
  cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0 then List.append (clone 0 (abs diff)) l1;;


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
(9,19)-(9,54)
(List.append (clone 0
                    (abs diff)) l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* changed exprs
Tuple (Just (10,7)-(10,50)) [App (Just (10,8)-(10,45)) (Var (Just (10,9)-(10,20)) "List.append") [App (Just (10,21)-(10,41)) (Var (Just (10,22)-(10,27)) "clone") [Lit (Just (10,28)-(10,29)) (LI 0),App (Just (10,30)-(10,40)) (Var (Just (10,31)-(10,34)) "abs") [Var (Just (10,35)-(10,39)) "diff"]],Var (Just (10,42)-(10,44)) "l1"],Var (Just (10,47)-(10,49)) "l2"]
*)

(* typed spans
(10,7)-(10,50)
*)

(* correct types
(int list * int list)
*)

(* bad types
int list
*)
