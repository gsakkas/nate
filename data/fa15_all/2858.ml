
let rec clone x n =
  if n <= 0 then [] else (let y = clone x (n - 1) in x :: y);;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x < y then ((clone 0 (y - x)), y) else (x, (clone 0 (x - y)));;


(* fix

let rec clone x n =
  if n <= 0 then [] else (let y = clone x (n - 1) in x :: y);;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x < y
  then (((clone 0 (y - x)) @ l1), l2)
  else (l1, ((clone 0 (x - y)) @ l2));;

*)

(* changed spans
(8,18)-(8,23)
(@)
VarG

(8,18)-(8,23)
clone 0 (y - x)
AppG (fromList [BopG EmptyG EmptyG,LitG])

(8,36)-(8,37)
l1
VarG

(8,44)-(8,66)
l2
VarG

(8,45)-(8,46)
l1
VarG

(8,49)-(8,54)
(@)
VarG

(8,49)-(8,54)
clone 0 (x - y)
AppG (fromList [BopG EmptyG EmptyG,LitG])

*)

(* changed exprs
Var (Just (9,27)-(9,28)) "@"
App (Just (9,9)-(9,26)) (Var (Just (9,10)-(9,15)) "clone") [Lit (Just (9,16)-(9,17)) (LI 0),Bop (Just (9,18)-(9,25)) Minus (Var (Just (9,19)-(9,20)) "y") (Var (Just (9,23)-(9,24)) "x")]
Var (Just (9,29)-(9,31)) "l1"
Var (Just (9,34)-(9,36)) "l2"
Var (Just (10,8)-(10,10)) "l1"
Var (Just (10,31)-(10,32)) "@"
App (Just (10,13)-(10,30)) (Var (Just (10,14)-(10,19)) "clone") [Lit (Just (10,20)-(10,21)) (LI 0),Bop (Just (10,22)-(10,29)) Minus (Var (Just (10,23)-(10,24)) "x") (Var (Just (10,27)-(10,28)) "y")]
*)

(* typed spans
(9,27)-(9,28)
(9,9)-(9,26)
(9,29)-(9,31)
(9,34)-(9,36)
(10,8)-(10,10)
(10,31)-(10,32)
(10,13)-(10,30)
*)

(* correct types
int list -> int list -> int list
int list
int list
int list
int list
int list -> int list -> int list
int list
*)

(* bad types
int -> int -> int list
int -> int -> int list
int
(int * int list)
int
int -> int -> int list
int -> int -> int list
*)
