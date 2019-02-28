
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then let n = (List.length l2) - (List.length l1) in clone (0 n)
  else
    if (List.length l2) < (List.length l1)
    then (let n = (List.length l1) - (List.length l2) in clone (0 n))
    else (l1, l2);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

*)

(* changed spans
(5,5)-(5,40)
List.length l1 = List.length l2
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(6,7)-(6,65)
(l1 , l2)
TupleG (fromList [VarG])

(6,34)-(6,50)
if List.length l1 < List.length l2
then (clone 0
            (List.length l2 - List.length l1) @ l1 , l2)
else (l1 , clone 0
                 (List.length l1 - List.length l2) @ l2)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(6,54)-(6,59)
List.length
VarG

(6,54)-(6,59)
l2
VarG

(6,54)-(6,59)
(clone 0
       (List.length l2 - List.length l1) @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(6,60)-(6,65)
0
LitG

(8,4)-(10,17)
List.length l2 - List.length l1
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(9,18)-(9,53)
l1
VarG

(9,18)-(9,53)
l2
VarG

(9,18)-(9,53)
(l1 , clone 0
            (List.length l1 - List.length l2) @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(10,9)-(10,17)
l2
VarG

*)

(* changed exprs
Bop (Just (5,5)-(5,40)) Eq (App (Just (5,5)-(5,21)) (Var (Just (5,6)-(5,17)) "List.length") [Var (Just (5,18)-(5,20)) "l1"]) (App (Just (5,24)-(5,40)) (Var (Just (5,25)-(5,36)) "List.length") [Var (Just (5,37)-(5,39)) "l2"])
Tuple (Just (6,7)-(6,15)) [Var (Just (6,8)-(6,10)) "l1",Var (Just (6,12)-(6,14)) "l2"]
Ite (Just (8,4)-(10,69)) (Bop (Just (8,7)-(8,42)) Lt (App (Just (8,7)-(8,23)) (Var (Just (8,8)-(8,19)) "List.length") [Var (Just (8,20)-(8,22)) "l1"]) (App (Just (8,26)-(8,42)) (Var (Just (8,27)-(8,38)) "List.length") [Var (Just (8,39)-(8,41)) "l2"])) (Tuple (Just (9,9)-(9,69)) [App (Just (9,10)-(9,64)) (Var (Just (9,59)-(9,60)) "@") [App (Just (9,11)-(9,58)) (Var (Just (9,12)-(9,17)) "clone") [Lit (Just (9,18)-(9,19)) (LI 0),Bop (Just (9,20)-(9,57)) Minus (App (Just (9,21)-(9,37)) (Var (Just (9,22)-(9,33)) "List.length") [Var (Just (9,34)-(9,36)) "l2"]) (App (Just (9,40)-(9,56)) (Var (Just (9,41)-(9,52)) "List.length") [Var (Just (9,53)-(9,55)) "l1"])],Var (Just (9,61)-(9,63)) "l1"],Var (Just (9,66)-(9,68)) "l2"]) (Tuple (Just (10,9)-(10,69)) [Var (Just (10,10)-(10,12)) "l1",App (Just (10,14)-(10,68)) (Var (Just (10,63)-(10,64)) "@") [App (Just (10,15)-(10,62)) (Var (Just (10,16)-(10,21)) "clone") [Lit (Just (10,22)-(10,23)) (LI 0),Bop (Just (10,24)-(10,61)) Minus (App (Just (10,25)-(10,41)) (Var (Just (10,26)-(10,37)) "List.length") [Var (Just (10,38)-(10,40)) "l1"]) (App (Just (10,44)-(10,60)) (Var (Just (10,45)-(10,56)) "List.length") [Var (Just (10,57)-(10,59)) "l2"])],Var (Just (10,65)-(10,67)) "l2"]])
Var (Just (8,27)-(8,38)) "List.length"
Var (Just (8,39)-(8,41)) "l2"
Tuple (Just (9,9)-(9,69)) [App (Just (9,10)-(9,64)) (Var (Just (9,59)-(9,60)) "@") [App (Just (9,11)-(9,58)) (Var (Just (9,12)-(9,17)) "clone") [Lit (Just (9,18)-(9,19)) (LI 0),Bop (Just (9,20)-(9,57)) Minus (App (Just (9,21)-(9,37)) (Var (Just (9,22)-(9,33)) "List.length") [Var (Just (9,34)-(9,36)) "l2"]) (App (Just (9,40)-(9,56)) (Var (Just (9,41)-(9,52)) "List.length") [Var (Just (9,53)-(9,55)) "l1"])],Var (Just (9,61)-(9,63)) "l1"],Var (Just (9,66)-(9,68)) "l2"]
Lit (Just (9,18)-(9,19)) (LI 0)
Bop (Just (9,20)-(9,57)) Minus (App (Just (9,21)-(9,37)) (Var (Just (9,22)-(9,33)) "List.length") [Var (Just (9,34)-(9,36)) "l2"]) (App (Just (9,40)-(9,56)) (Var (Just (9,41)-(9,52)) "List.length") [Var (Just (9,53)-(9,55)) "l1"])
Var (Just (9,61)-(9,63)) "l1"
Var (Just (9,66)-(9,68)) "l2"
Tuple (Just (10,9)-(10,69)) [Var (Just (10,10)-(10,12)) "l1",App (Just (10,14)-(10,68)) (Var (Just (10,63)-(10,64)) "@") [App (Just (10,15)-(10,62)) (Var (Just (10,16)-(10,21)) "clone") [Lit (Just (10,22)-(10,23)) (LI 0),Bop (Just (10,24)-(10,61)) Minus (App (Just (10,25)-(10,41)) (Var (Just (10,26)-(10,37)) "List.length") [Var (Just (10,38)-(10,40)) "l1"]) (App (Just (10,44)-(10,60)) (Var (Just (10,45)-(10,56)) "List.length") [Var (Just (10,57)-(10,59)) "l2"])],Var (Just (10,65)-(10,67)) "l2"]]
Var (Just (10,65)-(10,67)) "l2"
*)

(* typed spans
(5,5)-(5,40)
(6,7)-(6,15)
(8,4)-(10,69)
(8,27)-(8,38)
(8,39)-(8,41)
(9,9)-(9,69)
(9,18)-(9,19)
(9,20)-(9,57)
(9,61)-(9,63)
(9,66)-(9,68)
(10,9)-(10,69)
(10,65)-(10,67)
*)

(* correct types
bool
(int list * int list)
(int list * int list)
int list -> int
int list
(int list * int list)
int
int
int list
int list
(int list * int list)
int list
*)

(* bad types
bool
int -> 'a list
int
'a -> int -> 'a list
'a -> int -> 'a list
'a -> int -> 'a list
'a
('a list * 'b list)
int
int
int
('a list * 'b list)
*)
