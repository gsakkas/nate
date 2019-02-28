
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let a = (List.length l1) - (List.length l2) in
  if a > 0 then l1 * (clone 0 a) else "bye";;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let a = (List.length l1) - (List.length l2) in
  if a > 0 then (l1, (clone 0 a)) else (l1, l2);;

*)

(* changed spans
(6,16)-(6,32)
(l1 , clone 0 a)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(6,38)-(6,43)
(l1 , l2)
TupleG (fromList [VarG])

*)

(* changed exprs
Tuple (Just (6,16)-(6,33)) [Var (Just (6,17)-(6,19)) "l1",App (Just (6,21)-(6,32)) (Var (Just (6,22)-(6,27)) "clone") [Lit (Just (6,28)-(6,29)) (LI 0),Var (Just (6,30)-(6,31)) "a"]]
Tuple (Just (6,39)-(6,47)) [Var (Just (6,40)-(6,42)) "l1",Var (Just (6,44)-(6,46)) "l2"]
*)

(* typed spans
(6,16)-(6,33)
(6,39)-(6,47)
*)

(* correct types
('a list * int list)
('a list * int list)
*)

(* bad types
int
string
*)
