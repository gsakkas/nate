
let rec clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2 then (((clone 0 (len1 - len2)) @ len2), len1);;


(* fix

let rec clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (((clone 0 (len1 - len2)) @ l2), l1)
  else (((clone 0 (len2 - len1)) @ l1), l2);;

*)

(* changed spans
(10,50)-(10,54)
l2
VarG

(10,50)-(10,54)
l1
VarG

(10,50)-(10,54)
(clone 0
       (len2 - len1) @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(10,2)-(10,62)
l1
VarG

*)

(* changed exprs
Var (Just (11,35)-(11,37)) "l2"
Var (Just (11,40)-(11,42)) "l1"
Tuple (Just (12,7)-(12,43)) [App (Just (12,8)-(12,38)) (Var (Just (12,33)-(12,34)) "@") [App (Just (12,9)-(12,32)) (Var (Just (12,10)-(12,15)) "clone") [Lit (Just (12,16)-(12,17)) (LI 0),Bop (Just (12,18)-(12,31)) Minus (Var (Just (12,19)-(12,23)) "len2") (Var (Just (12,26)-(12,30)) "len1")],Var (Just (12,35)-(12,37)) "l1"],Var (Just (12,40)-(12,42)) "l2"]
Var (Just (12,35)-(12,37)) "l1"
*)

(* typed spans
(11,35)-(11,37)
(11,40)-(11,42)
(12,7)-(12,43)
(12,35)-(12,37)
*)

(* correct types
int list
int list
(int list * int list)
int list
*)

(* bad types
int
int
int
unit
*)
