
let rec clone x n =
  match n with | 0 -> [] | n -> if n < 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) - (List.length l2) with
  | 0 -> (l1, l2)
  | n -> if n < 0 then (clone 0 abs n) @ l1 else (clone 0 abs n) @ l2;;


(* fix

let rec clone x n =
  match n with | 0 -> [] | n -> if n < 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) - (List.length l2) with
  | 0 -> (l1, l2)
  | n -> if n < 0 then (((clone 0 n) @ l1), l2) else (((clone 0 n) @ l2), l1);;

*)

(* changed spans
(8,23)-(8,43)
(clone 0 n @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(8,49)-(8,69)
(clone 0 n @ l2 , l1)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(8,49)-(8,64)
clone 0 n
AppG (fromList [VarG,LitG])

*)

(* changed exprs
Tuple (Just (8,23)-(8,47)) [App (Just (8,24)-(8,42)) (Var (Just (8,37)-(8,38)) "@") [App (Just (8,25)-(8,36)) (Var (Just (8,26)-(8,31)) "clone") [Lit (Just (8,32)-(8,33)) (LI 0),Var (Just (8,34)-(8,35)) "n"],Var (Just (8,39)-(8,41)) "l1"],Var (Just (8,44)-(8,46)) "l2"]
Tuple (Just (8,53)-(8,77)) [App (Just (8,54)-(8,72)) (Var (Just (8,67)-(8,68)) "@") [App (Just (8,55)-(8,66)) (Var (Just (8,56)-(8,61)) "clone") [Lit (Just (8,62)-(8,63)) (LI 0),Var (Just (8,64)-(8,65)) "n"],Var (Just (8,69)-(8,71)) "l2"],Var (Just (8,74)-(8,76)) "l1"]
App (Just (8,55)-(8,66)) (Var (Just (8,56)-(8,61)) "clone") [Lit (Just (8,62)-(8,63)) (LI 0),Var (Just (8,64)-(8,65)) "n"]
*)

(* typed spans
(8,23)-(8,47)
(8,53)-(8,77)
(8,55)-(8,66)
*)

(* correct types
(int list * int list)
(int list * int list)
int list
*)

(* bad types
'a list
'a list
'a list
*)
