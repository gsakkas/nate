
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then l1 * ((clone 0 ((List.length l1) - (List.length l2))) @ l2);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

*)

(* changed spans
(6,7)-(6,66)
(l1 , clone 0
            (List.length l1 - List.length l2) @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(5,2)-(6,66)
(clone 0
       (List.length l2 - List.length l1) @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* changed exprs
Tuple (Just (6,7)-(6,67)) [Var (Just (6,8)-(6,10)) "l1",App (Just (6,12)-(6,66)) (Var (Just (6,61)-(6,62)) "@") [App (Just (6,13)-(6,60)) (Var (Just (6,14)-(6,19)) "clone") [Lit (Just (6,20)-(6,21)) (LI 0),Bop (Just (6,22)-(6,59)) Minus (App (Just (6,23)-(6,39)) (Var (Just (6,24)-(6,35)) "List.length") [Var (Just (6,36)-(6,38)) "l1"]) (App (Just (6,42)-(6,58)) (Var (Just (6,43)-(6,54)) "List.length") [Var (Just (6,55)-(6,57)) "l2"])],Var (Just (6,63)-(6,65)) "l2"]]
Tuple (Just (7,7)-(7,67)) [App (Just (7,8)-(7,62)) (Var (Just (7,57)-(7,58)) "@") [App (Just (7,9)-(7,56)) (Var (Just (7,10)-(7,15)) "clone") [Lit (Just (7,16)-(7,17)) (LI 0),Bop (Just (7,18)-(7,55)) Minus (App (Just (7,19)-(7,35)) (Var (Just (7,20)-(7,31)) "List.length") [Var (Just (7,32)-(7,34)) "l2"]) (App (Just (7,38)-(7,54)) (Var (Just (7,39)-(7,50)) "List.length") [Var (Just (7,51)-(7,53)) "l1"])],Var (Just (7,59)-(7,61)) "l1"],Var (Just (7,64)-(7,66)) "l2"]
*)

(* typed spans
(6,7)-(6,67)
(7,7)-(7,67)
*)

(* correct types
(int list * int list)
(int list * int list)
*)

(* bad types
int
unit
*)
