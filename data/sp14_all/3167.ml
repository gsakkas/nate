
let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then
    List.append [(clone 0 ((List.length l2) - (List.length l1))) @ l1] [l2]
  else
    (List.length l2) <
      ((List.length l1) List.append [l1]
         [(clone 0 ((List.length l1) - (List.length l2))) @ l2]);;


(* fix

let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

*)

(* changed spans
(10,4)-(10,75)
(clone 0
       (List.length l2 - List.length l1) @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(12,4)-(14,64)
(l1 , clone 0
            (List.length l1 - List.length l2) @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* changed exprs
Tuple (Just (9,7)-(9,67)) [App (Just (9,8)-(9,62)) (Var (Just (9,57)-(9,58)) "@") [App (Just (9,9)-(9,56)) (Var (Just (9,10)-(9,15)) "clone") [Lit (Just (9,16)-(9,17)) (LI 0),Bop (Just (9,18)-(9,55)) Minus (App (Just (9,19)-(9,35)) (Var (Just (9,20)-(9,31)) "List.length") [Var (Just (9,32)-(9,34)) "l2"]) (App (Just (9,38)-(9,54)) (Var (Just (9,39)-(9,50)) "List.length") [Var (Just (9,51)-(9,53)) "l1"])],Var (Just (9,59)-(9,61)) "l1"],Var (Just (9,64)-(9,66)) "l2"]
Tuple (Just (10,7)-(10,67)) [Var (Just (10,8)-(10,10)) "l1",App (Just (10,12)-(10,66)) (Var (Just (10,61)-(10,62)) "@") [App (Just (10,13)-(10,60)) (Var (Just (10,14)-(10,19)) "clone") [Lit (Just (10,20)-(10,21)) (LI 0),Bop (Just (10,22)-(10,59)) Minus (App (Just (10,23)-(10,39)) (Var (Just (10,24)-(10,35)) "List.length") [Var (Just (10,36)-(10,38)) "l1"]) (App (Just (10,42)-(10,58)) (Var (Just (10,43)-(10,54)) "List.length") [Var (Just (10,55)-(10,57)) "l2"])],Var (Just (10,63)-(10,65)) "l2"]]
*)

(* typed spans
(9,7)-(9,67)
(10,7)-(10,67)
*)

(* correct types
(int list * int list)
(int list * int list)
*)

(* bad types
int list list
bool
*)
