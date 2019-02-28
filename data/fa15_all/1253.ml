
let rec clone x n = if n <= 0 then [] else [x] :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (clone 0 ((List.length l1) - (List.length l2)))) @ l2
  else (((clone 9 ((List.length l2) - (List.length l1))) @ l1), l2);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

*)

(* changed spans
(2,43)-(2,46)
x
VarG

(6,7)-(6,65)
(l1 , clone 0
            (List.length l1 - List.length l2) @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(6,7)-(6,65)
l1
VarG

(6,7)-(6,65)
clone 0
      (List.length l1 - List.length l2) @ l2
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(6,7)-(6,65)
(@)
VarG

(6,12)-(6,59)
clone 0
      (List.length l1 - List.length l2)
AppG (fromList [BopG EmptyG EmptyG,LitG])

(7,16)-(7,17)
0
LitG

*)

(* changed exprs
Var (Just (2,43)-(2,44)) "x"
Tuple (Just (6,7)-(6,67)) [Var (Just (6,8)-(6,10)) "l1",App (Just (6,12)-(6,66)) (Var (Just (6,61)-(6,62)) "@") [App (Just (6,13)-(6,60)) (Var (Just (6,14)-(6,19)) "clone") [Lit (Just (6,20)-(6,21)) (LI 0),Bop (Just (6,22)-(6,59)) Minus (App (Just (6,23)-(6,39)) (Var (Just (6,24)-(6,35)) "List.length") [Var (Just (6,36)-(6,38)) "l1"]) (App (Just (6,42)-(6,58)) (Var (Just (6,43)-(6,54)) "List.length") [Var (Just (6,55)-(6,57)) "l2"])],Var (Just (6,63)-(6,65)) "l2"]]
Var (Just (6,8)-(6,10)) "l1"
App (Just (6,12)-(6,66)) (Var (Just (6,61)-(6,62)) "@") [App (Just (6,13)-(6,60)) (Var (Just (6,14)-(6,19)) "clone") [Lit (Just (6,20)-(6,21)) (LI 0),Bop (Just (6,22)-(6,59)) Minus (App (Just (6,23)-(6,39)) (Var (Just (6,24)-(6,35)) "List.length") [Var (Just (6,36)-(6,38)) "l1"]) (App (Just (6,42)-(6,58)) (Var (Just (6,43)-(6,54)) "List.length") [Var (Just (6,55)-(6,57)) "l2"])],Var (Just (6,63)-(6,65)) "l2"]
Var (Just (6,61)-(6,62)) "@"
App (Just (6,13)-(6,60)) (Var (Just (6,14)-(6,19)) "clone") [Lit (Just (6,20)-(6,21)) (LI 0),Bop (Just (6,22)-(6,59)) Minus (App (Just (6,23)-(6,39)) (Var (Just (6,24)-(6,35)) "List.length") [Var (Just (6,36)-(6,38)) "l1"]) (App (Just (6,42)-(6,58)) (Var (Just (6,43)-(6,54)) "List.length") [Var (Just (6,55)-(6,57)) "l2"])]
Lit (Just (7,16)-(7,17)) (LI 0)
*)

(* typed spans
(2,43)-(2,44)
(6,7)-(6,67)
(6,8)-(6,10)
(6,12)-(6,66)
(6,61)-(6,62)
(6,13)-(6,60)
(7,16)-(7,17)
*)

(* correct types
int
(int list * int list)
int list
int list
int list -> int list -> int list
int list
int
*)

(* bad types
int list
(int list list * 'a list)
(int list list * 'a list)
(int list list * 'a list)
(int list list * 'a list)
int list list
int
*)
