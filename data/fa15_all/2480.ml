
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else
      if (List.length l2) < (List.length l1)
      then (clone 0 ((List.length l1) - (List.length l2))) @ l2;;


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
(11,6)-(12,63)
(l1 , clone 0
            (List.length l1 - List.length l2) @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* changed exprs
Tuple (Just (10,9)-(10,69)) [Var (Just (10,10)-(10,12)) "l1",App (Just (10,14)-(10,68)) (Var (Just (10,63)-(10,64)) "@") [App (Just (10,15)-(10,62)) (Var (Just (10,16)-(10,21)) "clone") [Lit (Just (10,22)-(10,23)) (LI 0),Bop (Just (10,24)-(10,61)) Minus (App (Just (10,25)-(10,41)) (Var (Just (10,26)-(10,37)) "List.length") [Var (Just (10,38)-(10,40)) "l1"]) (App (Just (10,44)-(10,60)) (Var (Just (10,45)-(10,56)) "List.length") [Var (Just (10,57)-(10,59)) "l2"])],Var (Just (10,65)-(10,67)) "l2"]]
*)

(* typed spans
(10,9)-(10,69)
*)

(* correct types
(int list * int list)
*)

(* bad types
unit
*)
