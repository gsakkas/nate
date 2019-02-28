
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

*)

(* changed spans
(5,2)-(6,67)
(clone 0
       (List.length l2 - List.length l1) @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* changed exprs
Tuple (Just (7,7)-(7,67)) [App (Just (7,8)-(7,62)) (Var (Just (7,57)-(7,58)) "@") [App (Just (7,9)-(7,56)) (Var (Just (7,10)-(7,15)) "clone") [Lit (Just (7,16)-(7,17)) (LI 0),Bop (Just (7,18)-(7,55)) Minus (App (Just (7,19)-(7,35)) (Var (Just (7,20)-(7,31)) "List.length") [Var (Just (7,32)-(7,34)) "l2"]) (App (Just (7,38)-(7,54)) (Var (Just (7,39)-(7,50)) "List.length") [Var (Just (7,51)-(7,53)) "l1"])],Var (Just (7,59)-(7,61)) "l1"],Var (Just (7,64)-(7,66)) "l2"]
*)

(* typed spans
(7,7)-(7,67)
*)

(* correct types
(int list * int list)
*)

(* bad types
unit
*)
