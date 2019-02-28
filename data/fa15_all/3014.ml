
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let d = (List.length l1) - (List.length l2) in
  if d < 0 then (clone 0 (0 - d)) @ (l1 * l2) else (l1 * (clone 0 d)) @ l2;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let d = (List.length l1) - (List.length l2) in
  if d < 0 then (((clone 0 (0 - d)) @ l1), l2) else (l1, ((clone 0 d) @ l2));;

*)

(* changed spans
(6,16)-(6,45)
(clone 0 (0 - d) @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(6,36)-(6,45)
(l1 , clone 0 d @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(6,51)-(6,69)
clone 0 d
AppG (fromList [VarG,LitG])

(6,51)-(6,69)
clone
VarG

(6,51)-(6,69)
0
LitG

(6,51)-(6,69)
d
VarG

*)

(* changed exprs
Tuple (Just (6,16)-(6,46)) [App (Just (6,17)-(6,41)) (Var (Just (6,36)-(6,37)) "@") [App (Just (6,18)-(6,35)) (Var (Just (6,19)-(6,24)) "clone") [Lit (Just (6,25)-(6,26)) (LI 0),Bop (Just (6,27)-(6,34)) Minus (Lit (Just (6,28)-(6,29)) (LI 0)) (Var (Just (6,32)-(6,33)) "d")],Var (Just (6,38)-(6,40)) "l1"],Var (Just (6,43)-(6,45)) "l2"]
Tuple (Just (6,52)-(6,76)) [Var (Just (6,53)-(6,55)) "l1",App (Just (6,57)-(6,75)) (Var (Just (6,70)-(6,71)) "@") [App (Just (6,58)-(6,69)) (Var (Just (6,59)-(6,64)) "clone") [Lit (Just (6,65)-(6,66)) (LI 0),Var (Just (6,67)-(6,68)) "d"],Var (Just (6,72)-(6,74)) "l2"]]
App (Just (6,58)-(6,69)) (Var (Just (6,59)-(6,64)) "clone") [Lit (Just (6,65)-(6,66)) (LI 0),Var (Just (6,67)-(6,68)) "d"]
Var (Just (6,59)-(6,64)) "clone"
Lit (Just (6,65)-(6,66)) (LI 0)
Var (Just (6,67)-(6,68)) "d"
*)

(* typed spans
(6,16)-(6,46)
(6,52)-(6,76)
(6,58)-(6,69)
(6,59)-(6,64)
(6,65)-(6,66)
(6,67)-(6,68)
*)

(* correct types
(int list * int list)
(int list * int list)
int list
int -> int -> int list
int
int
*)

(* bad types
'a
int
int
int
int
int
*)
