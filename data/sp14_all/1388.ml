
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let l = (List.length l1) - (List.length l2) in
  if l < 0 then (((clone (-1)) * (l l2)), l2) else (l1, (clone l l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let l = (List.length l1) - (List.length l2) in
  if l < 0
  then (((clone 0 ((-1) * l)) @ l2), l2)
  else (l1, ((clone 0 l) @ l2));;

*)

(* changed spans
(6,17)-(6,40)
clone 0 ((-1) * l) @ l2
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(6,57)-(6,62)
(@)
VarG

(6,57)-(6,62)
clone 0 l
AppG (fromList [VarG,LitG])

(6,63)-(6,64)
0
LitG

*)

(* changed exprs
App (Just (7,8)-(7,35)) (Var (Just (7,30)-(7,31)) "@") [App (Just (7,9)-(7,29)) (Var (Just (7,10)-(7,15)) "clone") [Lit (Just (7,16)-(7,17)) (LI 0),Bop (Just (7,18)-(7,28)) Times (Lit (Just (7,19)-(7,23)) (LI (-1))) (Var (Just (7,26)-(7,27)) "l")],Var (Just (7,32)-(7,34)) "l2"]
Var (Just (8,25)-(8,26)) "@"
App (Just (8,13)-(8,24)) (Var (Just (8,14)-(8,19)) "clone") [Lit (Just (8,20)-(8,21)) (LI 0),Var (Just (8,22)-(8,23)) "l"]
Lit (Just (8,20)-(8,21)) (LI 0)
*)

(* typed spans
(7,8)-(7,35)
(8,25)-(8,26)
(8,13)-(8,24)
(8,20)-(8,21)
*)

(* correct types
int list
int list -> int list -> int list
int list
int
*)

(* bad types
int
int -> int -> int list
int -> int -> int list
int
*)
