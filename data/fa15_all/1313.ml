
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  if difference2 > 0
  then ((l1 :: (clone 0 difference2)), l2)
  else
    if difference1 > 0 then (l1, (l2 :: (clone 0 difference1))) else (l1, l2);;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  if difference2 > 0
  then (((clone 0 difference2) @ l1), l2)
  else
    if difference1 > 0 then (l1, ((clone 0 difference1) @ l2)) else (l1, l2);;

*)

(* changed spans
(8,8)-(8,37)
clone 0 difference2 @ l1
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(10,33)-(10,62)
clone 0 difference1 @ l2
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(10,33)-(10,62)
(@)
VarG

(10,41)-(10,46)
clone 0 difference1
AppG (fromList [VarG,LitG])

(10,69)-(10,77)
l2
VarG

*)

(* changed exprs
App (Just (8,8)-(8,36)) (Var (Just (8,31)-(8,32)) "@") [App (Just (8,9)-(8,30)) (Var (Just (8,10)-(8,15)) "clone") [Lit (Just (8,16)-(8,17)) (LI 0),Var (Just (8,18)-(8,29)) "difference2"],Var (Just (8,33)-(8,35)) "l1"]
App (Just (10,33)-(10,61)) (Var (Just (10,56)-(10,57)) "@") [App (Just (10,34)-(10,55)) (Var (Just (10,35)-(10,40)) "clone") [Lit (Just (10,41)-(10,42)) (LI 0),Var (Just (10,43)-(10,54)) "difference1"],Var (Just (10,58)-(10,60)) "l2"]
Var (Just (10,56)-(10,57)) "@"
App (Just (10,34)-(10,55)) (Var (Just (10,35)-(10,40)) "clone") [Lit (Just (10,41)-(10,42)) (LI 0),Var (Just (10,43)-(10,54)) "difference1"]
Var (Just (10,58)-(10,60)) "l2"
*)

(* typed spans
(8,8)-(8,36)
(10,33)-(10,61)
(10,56)-(10,57)
(10,34)-(10,55)
(10,58)-(10,60)
*)

(* correct types
int list
int list
int list -> int list -> int list
int list
int list
*)

(* bad types
'a list list
'a list list
'a list list
int -> int -> int list
('a list * 'b list)
*)
