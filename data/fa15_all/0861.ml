
let rec clone x n =
  match n with | 0 -> [] | n -> if n < 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) - (List.length l2) with
  | 0 -> (l1, l2)
  | n -> if n < 0 then (((clone 0 n) @ l1), l2);;


(* fix

let rec clone x n =
  match n with | 0 -> [] | n -> if n < 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) - (List.length l2) with
  | 0 -> (l1, l2)
  | n -> if n < 0 then (((clone 0 n) @ l1), l2) else (((clone 0 n) @ l2), l1);;

*)

(* changed spans
(8,9)-(8,47)
(clone 0 n @ l2 , l1)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* changed exprs
Tuple (Just (8,53)-(8,77)) [App (Just (8,54)-(8,72)) (Var (Just (8,67)-(8,68)) "@") [App (Just (8,55)-(8,66)) (Var (Just (8,56)-(8,61)) "clone") [Lit (Just (8,62)-(8,63)) (LI 0),Var (Just (8,64)-(8,65)) "n"],Var (Just (8,69)-(8,71)) "l2"],Var (Just (8,74)-(8,76)) "l1"]
*)

(* typed spans
(8,53)-(8,77)
*)

(* correct types
(int list * int list)
*)

(* bad types
unit
*)
