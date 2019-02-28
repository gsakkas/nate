
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (clone 0 ((List.length l2) - (List.length l1))) :: l1
  else (clone "0" ((List.length l1) - (List.length l2))) :: l2;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (((clone 0 ((List.length l1) - (List.length l2))) @ l2), l1);;

*)

(* changed spans
(6,7)-(6,60)
(clone 0
       (List.length l2 - List.length l1) @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(7,7)-(7,56)
(clone 0
       (List.length l1 - List.length l2) @ l2 , l1)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(7,8)-(7,13)
(@)
VarG

(7,8)-(7,13)
clone 0
      (List.length l1 - List.length l2)
AppG (fromList [BopG EmptyG EmptyG,LitG])

(7,14)-(7,17)
0
LitG

*)

(* changed exprs
Tuple (Just (6,7)-(6,67)) [App (Just (6,8)-(6,62)) (Var (Just (6,57)-(6,58)) "@") [App (Just (6,9)-(6,56)) (Var (Just (6,10)-(6,15)) "clone") [Lit (Just (6,16)-(6,17)) (LI 0),Bop (Just (6,18)-(6,55)) Minus (App (Just (6,19)-(6,35)) (Var (Just (6,20)-(6,31)) "List.length") [Var (Just (6,32)-(6,34)) "l2"]) (App (Just (6,38)-(6,54)) (Var (Just (6,39)-(6,50)) "List.length") [Var (Just (6,51)-(6,53)) "l1"])],Var (Just (6,59)-(6,61)) "l1"],Var (Just (6,64)-(6,66)) "l2"]
Tuple (Just (7,7)-(7,67)) [App (Just (7,8)-(7,62)) (Var (Just (7,57)-(7,58)) "@") [App (Just (7,9)-(7,56)) (Var (Just (7,10)-(7,15)) "clone") [Lit (Just (7,16)-(7,17)) (LI 0),Bop (Just (7,18)-(7,55)) Minus (App (Just (7,19)-(7,35)) (Var (Just (7,20)-(7,31)) "List.length") [Var (Just (7,32)-(7,34)) "l1"]) (App (Just (7,38)-(7,54)) (Var (Just (7,39)-(7,50)) "List.length") [Var (Just (7,51)-(7,53)) "l2"])],Var (Just (7,59)-(7,61)) "l2"],Var (Just (7,64)-(7,66)) "l1"]
Var (Just (7,57)-(7,58)) "@"
App (Just (7,9)-(7,56)) (Var (Just (7,10)-(7,15)) "clone") [Lit (Just (7,16)-(7,17)) (LI 0),Bop (Just (7,18)-(7,55)) Minus (App (Just (7,19)-(7,35)) (Var (Just (7,20)-(7,31)) "List.length") [Var (Just (7,32)-(7,34)) "l1"]) (App (Just (7,38)-(7,54)) (Var (Just (7,39)-(7,50)) "List.length") [Var (Just (7,51)-(7,53)) "l2"])]
Lit (Just (7,16)-(7,17)) (LI 0)
*)

(* typed spans
(6,7)-(6,67)
(7,7)-(7,67)
(7,57)-(7,58)
(7,9)-(7,56)
(7,16)-(7,17)
*)

(* correct types
(int list * int list)
(int list * int list)
int list -> int list -> int list
int list
int
*)

(* bad types
int list list
int list
int -> int -> int list
int -> int -> int list
string
*)
