
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
fun x ->
  fun n ->
    if n < 1
    then []
    else cloneHelper x n []
LamG (LamG EmptyG)

(8,7)-(8,42)
(l1 @ clone 0 diff , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(8,7)-(8,37)
l1
VarG

(8,21)-(8,22)
clone 0 diff
AppG (fromList [VarG,LitG])

(8,26)-(8,36)
diff
VarG

(8,40)-(8,42)
l2
VarG

(9,24)-(9,49)
(l1 , l2 @ clone 0 diff)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(9,24)-(9,44)
l2
VarG

(9,25)-(9,36)
clone
VarG

(9,47)-(9,49)
(l1 , l2)
TupleG (fromList [VarG])

*)

(* changed exprs
Lam (Just (5,14)-(5,60)) (VarPat (Just (5,14)-(5,15)) "x") (Lam (Just (5,16)-(5,60)) (VarPat (Just (5,16)-(5,17)) "n") (Ite (Just (5,20)-(5,60)) (Bop (Just (5,23)-(5,28)) Lt (Var (Just (5,23)-(5,24)) "n") (Lit (Just (5,27)-(5,28)) (LI 1))) (List (Just (5,34)-(5,36)) [] Nothing) (App (Just (5,42)-(5,60)) (Var (Just (5,42)-(5,53)) "cloneHelper") [Var (Just (5,54)-(5,55)) "x",Var (Just (5,56)-(5,57)) "n",List (Just (5,58)-(5,60)) [] Nothing])) Nothing) Nothing
Tuple (Just (10,7)-(10,34)) [App (Just (10,8)-(10,29)) (Var (Just (10,12)-(10,13)) "@") [Var (Just (10,9)-(10,11)) "l1",App (Just (10,14)-(10,28)) (Var (Just (10,15)-(10,20)) "clone") [Lit (Just (10,21)-(10,22)) (LI 0),Var (Just (10,23)-(10,27)) "diff"]],Var (Just (10,31)-(10,33)) "l2"]
Var (Just (10,9)-(10,11)) "l1"
App (Just (10,14)-(10,28)) (Var (Just (10,15)-(10,20)) "clone") [Lit (Just (10,21)-(10,22)) (LI 0),Var (Just (10,23)-(10,27)) "diff"]
Var (Just (10,23)-(10,27)) "diff"
Var (Just (10,31)-(10,33)) "l2"
Tuple (Just (11,24)-(11,51)) [Var (Just (11,25)-(11,27)) "l1",App (Just (11,29)-(11,50)) (Var (Just (11,33)-(11,34)) "@") [Var (Just (11,30)-(11,32)) "l2",App (Just (11,35)-(11,49)) (Var (Just (11,36)-(11,41)) "clone") [Lit (Just (11,42)-(11,43)) (LI 0),Var (Just (11,44)-(11,48)) "diff"]]]
Var (Just (11,30)-(11,32)) "l2"
Var (Just (11,36)-(11,41)) "clone"
Tuple (Just (11,57)-(11,65)) [Var (Just (11,58)-(11,60)) "l1",Var (Just (11,62)-(11,64)) "l2"]
*)

(* typed spans
(5,14)-(5,60)
(10,7)-(10,34)
(10,9)-(10,11)
(10,14)-(10,28)
(10,23)-(10,27)
(10,31)-(10,33)
(11,24)-(11,51)
(11,30)-(11,32)
(11,36)-(11,41)
(11,57)-(11,65)
*)

(* correct types
int -> int -> int list
(int list * int list)
int list
int list
int
int list
(int list * int list)
int list
int -> int -> int list
(int list * int list)
*)

(* bad types
'a list -> 'b list -> unit
unit
int
int
int
'a list
unit
int list -> int list
int -> int -> int list -> int list
'a list
*)
