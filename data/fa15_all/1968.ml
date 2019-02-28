
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then clone 0 ((List.length l1) - (List.length l2))
  else
    if (List.length l1) < (List.length l2)
    then clone 0 ((List.length l2) - (List.length l1))
    else "(" ^ ")";;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, l2);;

*)

(* changed spans
(6,7)-(6,52)
(l1 , clone 0
            (List.length l1 - List.length l2) @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(9,9)-(9,54)
(clone 0
       (List.length l2 - List.length l1) @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(9,9)-(9,14)
(@)
VarG

(9,9)-(9,14)
clone 0
      (List.length l2 - List.length l1)
AppG (fromList [BopG EmptyG EmptyG,LitG])

(10,9)-(10,18)
l1
VarG

*)

(* changed exprs
Tuple (Just (6,7)-(6,67)) [Var (Just (6,8)-(6,10)) "l1",App (Just (6,12)-(6,66)) (Var (Just (6,61)-(6,62)) "@") [App (Just (6,13)-(6,60)) (Var (Just (6,14)-(6,19)) "clone") [Lit (Just (6,20)-(6,21)) (LI 0),Bop (Just (6,22)-(6,59)) Minus (App (Just (6,23)-(6,39)) (Var (Just (6,24)-(6,35)) "List.length") [Var (Just (6,36)-(6,38)) "l1"]) (App (Just (6,42)-(6,58)) (Var (Just (6,43)-(6,54)) "List.length") [Var (Just (6,55)-(6,57)) "l2"])],Var (Just (6,63)-(6,65)) "l2"]]
Tuple (Just (9,9)-(9,69)) [App (Just (9,10)-(9,64)) (Var (Just (9,59)-(9,60)) "@") [App (Just (9,11)-(9,58)) (Var (Just (9,12)-(9,17)) "clone") [Lit (Just (9,18)-(9,19)) (LI 0),Bop (Just (9,20)-(9,57)) Minus (App (Just (9,21)-(9,37)) (Var (Just (9,22)-(9,33)) "List.length") [Var (Just (9,34)-(9,36)) "l2"]) (App (Just (9,40)-(9,56)) (Var (Just (9,41)-(9,52)) "List.length") [Var (Just (9,53)-(9,55)) "l1"])],Var (Just (9,61)-(9,63)) "l1"],Var (Just (9,66)-(9,68)) "l2"]
Var (Just (9,59)-(9,60)) "@"
App (Just (9,11)-(9,58)) (Var (Just (9,12)-(9,17)) "clone") [Lit (Just (9,18)-(9,19)) (LI 0),Bop (Just (9,20)-(9,57)) Minus (App (Just (9,21)-(9,37)) (Var (Just (9,22)-(9,33)) "List.length") [Var (Just (9,34)-(9,36)) "l2"]) (App (Just (9,40)-(9,56)) (Var (Just (9,41)-(9,52)) "List.length") [Var (Just (9,53)-(9,55)) "l1"])]
Var (Just (9,61)-(9,63)) "l1"
*)

(* typed spans
(6,7)-(6,67)
(9,9)-(9,69)
(9,59)-(9,60)
(9,11)-(9,58)
(9,61)-(9,63)
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
string
*)
