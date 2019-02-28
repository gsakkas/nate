
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n > 0 then (clone 0 n) @ l2 else ((clone 0) - (1 * n)) @ l1;;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n > 0 then (l1, ((clone 0 n) @ l2)) else (((clone 0 (0 - n)) @ l1), l2);;

*)

(* changed spans
(6,16)-(6,32)
(l1 , clone 0 n @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(6,38)-(6,64)
(clone 0 (0 - n) @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(6,38)-(6,59)
clone 0 (0 - n)
AppG (fromList [BopG EmptyG EmptyG,LitG])

*)

(* changed exprs
Tuple (Just (6,16)-(6,40)) [Var (Just (6,17)-(6,19)) "l1",App (Just (6,21)-(6,39)) (Var (Just (6,34)-(6,35)) "@") [App (Just (6,22)-(6,33)) (Var (Just (6,23)-(6,28)) "clone") [Lit (Just (6,29)-(6,30)) (LI 0),Var (Just (6,31)-(6,32)) "n"],Var (Just (6,36)-(6,38)) "l2"]]
Tuple (Just (6,46)-(6,76)) [App (Just (6,47)-(6,71)) (Var (Just (6,66)-(6,67)) "@") [App (Just (6,48)-(6,65)) (Var (Just (6,49)-(6,54)) "clone") [Lit (Just (6,55)-(6,56)) (LI 0),Bop (Just (6,57)-(6,64)) Minus (Lit (Just (6,58)-(6,59)) (LI 0)) (Var (Just (6,62)-(6,63)) "n")],Var (Just (6,68)-(6,70)) "l1"],Var (Just (6,73)-(6,75)) "l2"]
App (Just (6,48)-(6,65)) (Var (Just (6,49)-(6,54)) "clone") [Lit (Just (6,55)-(6,56)) (LI 0),Bop (Just (6,57)-(6,64)) Minus (Lit (Just (6,58)-(6,59)) (LI 0)) (Var (Just (6,62)-(6,63)) "n")]
*)

(* typed spans
(6,16)-(6,40)
(6,46)-(6,76)
(6,48)-(6,65)
*)

(* correct types
(int list * int list)
(int list * int list)
int list
*)

(* bad types
int list
int list
int
*)
