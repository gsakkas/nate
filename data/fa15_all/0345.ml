
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padLength l1 l2 = abs ((List.length l1) - (List.length l2));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (clone 0 (padLength l1 l2)) * l1
  else (clone 0 (padLength l1 l2)) * l2;;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padLength l1 l2 = abs ((List.length l1) - (List.length l2));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 (padLength l1 l2)) l1), l2)
  else (l1, (List.append (clone 0 (padLength l1 l2)) l2));;

*)

(* changed spans
(8,7)-(8,39)
(List.append (clone 0
                    (padLength l1 l2)) l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(9,7)-(9,34)
(l1 , List.append (clone 0
                         (padLength l1 l2)) l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(9,8)-(9,13)
List.append
VarG

(9,8)-(9,13)
clone 0 (padLength l1 l2)
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
Tuple (Just (8,7)-(8,57)) [App (Just (8,8)-(8,52)) (Var (Just (8,9)-(8,20)) "List.append") [App (Just (8,21)-(8,48)) (Var (Just (8,22)-(8,27)) "clone") [Lit (Just (8,28)-(8,29)) (LI 0),App (Just (8,30)-(8,47)) (Var (Just (8,31)-(8,40)) "padLength") [Var (Just (8,41)-(8,43)) "l1",Var (Just (8,44)-(8,46)) "l2"]],Var (Just (8,49)-(8,51)) "l1"],Var (Just (8,54)-(8,56)) "l2"]
Tuple (Just (9,7)-(9,57)) [Var (Just (9,8)-(9,10)) "l1",App (Just (9,12)-(9,56)) (Var (Just (9,13)-(9,24)) "List.append") [App (Just (9,25)-(9,52)) (Var (Just (9,26)-(9,31)) "clone") [Lit (Just (9,32)-(9,33)) (LI 0),App (Just (9,34)-(9,51)) (Var (Just (9,35)-(9,44)) "padLength") [Var (Just (9,45)-(9,47)) "l1",Var (Just (9,48)-(9,50)) "l2"]],Var (Just (9,53)-(9,55)) "l2"]]
Var (Just (9,13)-(9,24)) "List.append"
App (Just (9,25)-(9,52)) (Var (Just (9,26)-(9,31)) "clone") [Lit (Just (9,32)-(9,33)) (LI 0),App (Just (9,34)-(9,51)) (Var (Just (9,35)-(9,44)) "padLength") [Var (Just (9,45)-(9,47)) "l1",Var (Just (9,48)-(9,50)) "l2"]]
*)

(* typed spans
(8,7)-(8,57)
(9,7)-(9,57)
(9,13)-(9,24)
(9,25)-(9,52)
*)

(* correct types
(int list * int list)
(int list * int list)
int list -> int list -> int list
int list
*)

(* bad types
int
int list
int -> int -> int list
int -> int -> int list
*)
