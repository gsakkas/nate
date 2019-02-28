
let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let rec clone x n = if n < 1 then [] else cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then clone 0 (((-1) * diff) - 1)
  else if diff > 0 then clone 0 diff else (l1, l2);;


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
(10,7)-(10,34)
(l1 @ clone 0 diff , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(11,24)-(11,36)
(l1 , l2 @ clone 0 diff)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(11,24)-(11,29)
(@)
VarG

(11,24)-(11,29)
l2
VarG

(11,24)-(11,29)
clone 0 diff
AppG (fromList [VarG,LitG])

*)

(* changed exprs
Tuple (Just (10,7)-(10,34)) [App (Just (10,8)-(10,29)) (Var (Just (10,12)-(10,13)) "@") [Var (Just (10,9)-(10,11)) "l1",App (Just (10,14)-(10,28)) (Var (Just (10,15)-(10,20)) "clone") [Lit (Just (10,21)-(10,22)) (LI 0),Var (Just (10,23)-(10,27)) "diff"]],Var (Just (10,31)-(10,33)) "l2"]
Tuple (Just (11,24)-(11,51)) [Var (Just (11,25)-(11,27)) "l1",App (Just (11,29)-(11,50)) (Var (Just (11,33)-(11,34)) "@") [Var (Just (11,30)-(11,32)) "l2",App (Just (11,35)-(11,49)) (Var (Just (11,36)-(11,41)) "clone") [Lit (Just (11,42)-(11,43)) (LI 0),Var (Just (11,44)-(11,48)) "diff"]]]
Var (Just (11,33)-(11,34)) "@"
Var (Just (11,30)-(11,32)) "l2"
App (Just (11,35)-(11,49)) (Var (Just (11,36)-(11,41)) "clone") [Lit (Just (11,42)-(11,43)) (LI 0),Var (Just (11,44)-(11,48)) "diff"]
*)

(* typed spans
(10,7)-(10,34)
(11,24)-(11,51)
(11,33)-(11,34)
(11,30)-(11,32)
(11,35)-(11,49)
*)

(* correct types
(int list * int list)
(int list * int list)
int list -> int list -> int list
int list
int list
*)

(* bad types
int list
int list
int -> int -> int list
int -> int -> int list
int -> int -> int list
*)
