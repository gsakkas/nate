
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((clone 0 ((List.length l2) - (List.length l1))) @ l1) l2
  else
    if (List.length l1) > (List.length l2)
    then l1 ((clone 0 ((List.length l1) - (List.length l2))) @ l2)
    else l1 l2;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
    else (l1, l2);;

*)

(* changed spans
(6,7)-(6,64)
(clone 0
       (List.length l2 - List.length l1) @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(9,9)-(9,66)
(l1 , clone 0
            (List.length l1 - List.length l2) @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(10,9)-(10,14)
(l1 , l2)
TupleG (fromList [VarG])

*)

(* changed exprs
Tuple (Just (6,7)-(6,67)) [App (Just (6,8)-(6,62)) (Var (Just (6,57)-(6,58)) "@") [App (Just (6,9)-(6,56)) (Var (Just (6,10)-(6,15)) "clone") [Lit (Just (6,16)-(6,17)) (LI 0),Bop (Just (6,18)-(6,55)) Minus (App (Just (6,19)-(6,35)) (Var (Just (6,20)-(6,31)) "List.length") [Var (Just (6,32)-(6,34)) "l2"]) (App (Just (6,38)-(6,54)) (Var (Just (6,39)-(6,50)) "List.length") [Var (Just (6,51)-(6,53)) "l1"])],Var (Just (6,59)-(6,61)) "l1"],Var (Just (6,64)-(6,66)) "l2"]
Tuple (Just (9,9)-(9,69)) [Var (Just (9,10)-(9,12)) "l1",App (Just (9,14)-(9,68)) (Var (Just (9,63)-(9,64)) "@") [App (Just (9,15)-(9,62)) (Var (Just (9,16)-(9,21)) "clone") [Lit (Just (9,22)-(9,23)) (LI 0),Bop (Just (9,24)-(9,61)) Minus (App (Just (9,25)-(9,41)) (Var (Just (9,26)-(9,37)) "List.length") [Var (Just (9,38)-(9,40)) "l1"]) (App (Just (9,44)-(9,60)) (Var (Just (9,45)-(9,56)) "List.length") [Var (Just (9,57)-(9,59)) "l2"])],Var (Just (9,65)-(9,67)) "l2"]]
Tuple (Just (10,9)-(10,17)) [Var (Just (10,10)-(10,12)) "l1",Var (Just (10,14)-(10,16)) "l2"]
*)

(* typed spans
(6,7)-(6,67)
(9,9)-(9,69)
(10,9)-(10,17)
*)

(* correct types
(int list * int list)
(int list * int list)
(int list * int list)
*)

(* bad types
'a
'a
'a
*)
