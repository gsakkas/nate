
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x1 = List.length l1 in
  let x2 = List.length l2 in
  if x1 < x2 then x1 @ (clone 0 (x2 - x1)) else x2 @ (clone 0 (x1 - x2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x1 = List.length l1 in
  let x2 = List.length l2 in
  if x1 < x2
  then ((l1 @ (clone 0 (x2 - x1))), l2)
  else (l1, (l2 @ (clone 0 (x1 - x2))));;

*)

(* changed spans
(7,18)-(7,42)
(l1 @ clone 0 (x2 - x1) , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(7,48)-(7,72)
(l1 , l2 @ clone 0 (x1 - x2))
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(7,48)-(7,50)
l2
VarG

*)

(* changed exprs
Tuple (Just (8,7)-(8,39)) [App (Just (8,8)-(8,34)) (Var (Just (8,12)-(8,13)) "@") [Var (Just (8,9)-(8,11)) "l1",App (Just (8,14)-(8,33)) (Var (Just (8,15)-(8,20)) "clone") [Lit (Just (8,21)-(8,22)) (LI 0),Bop (Just (8,23)-(8,32)) Minus (Var (Just (8,24)-(8,26)) "x2") (Var (Just (8,29)-(8,31)) "x1")]],Var (Just (8,36)-(8,38)) "l2"]
Tuple (Just (9,7)-(9,39)) [Var (Just (9,8)-(9,10)) "l1",App (Just (9,12)-(9,38)) (Var (Just (9,16)-(9,17)) "@") [Var (Just (9,13)-(9,15)) "l2",App (Just (9,18)-(9,37)) (Var (Just (9,19)-(9,24)) "clone") [Lit (Just (9,25)-(9,26)) (LI 0),Bop (Just (9,27)-(9,36)) Minus (Var (Just (9,28)-(9,30)) "x1") (Var (Just (9,33)-(9,35)) "x2")]]]
Var (Just (9,13)-(9,15)) "l2"
*)

(* typed spans
(8,7)-(8,39)
(9,7)-(9,39)
(9,13)-(9,15)
*)

(* correct types
(int list * int list)
(int list * int list)
int list
*)

(* bad types
'a
'a
int
*)
