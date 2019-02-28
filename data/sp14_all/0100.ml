
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 < s2
  then ((clone 0 l1), l2)
  else if s2 < s1 then (l1, (clone 0 l2)) else (l1, l2);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 < s2
  then (((clone 0 (s2 - s1)) @ l1), l2)
  else if s2 < s1 then (l1, ((clone 0 (s1 - s2)) @ l2)) else (l1, l2);;

*)

(* changed spans
(8,9)-(8,14)
(@)
VarG

(8,9)-(8,14)
clone 0 (s2 - s1)
AppG (fromList [BopG EmptyG EmptyG,LitG])

(8,17)-(8,19)
s2 - s1
BopG VarG VarG

(9,29)-(9,34)
(@)
VarG

(9,29)-(9,34)
clone 0 (s1 - s2)
AppG (fromList [BopG EmptyG EmptyG,LitG])

(9,37)-(9,39)
s1 - s2
BopG VarG VarG

*)

(* changed exprs
Var (Just (8,29)-(8,30)) "@"
App (Just (8,9)-(8,28)) (Var (Just (8,10)-(8,15)) "clone") [Lit (Just (8,16)-(8,17)) (LI 0),Bop (Just (8,18)-(8,27)) Minus (Var (Just (8,19)-(8,21)) "s2") (Var (Just (8,24)-(8,26)) "s1")]
Bop (Just (8,18)-(8,27)) Minus (Var (Just (8,19)-(8,21)) "s2") (Var (Just (8,24)-(8,26)) "s1")
Var (Just (9,49)-(9,50)) "@"
App (Just (9,29)-(9,48)) (Var (Just (9,30)-(9,35)) "clone") [Lit (Just (9,36)-(9,37)) (LI 0),Bop (Just (9,38)-(9,47)) Minus (Var (Just (9,39)-(9,41)) "s1") (Var (Just (9,44)-(9,46)) "s2")]
Bop (Just (9,38)-(9,47)) Minus (Var (Just (9,39)-(9,41)) "s1") (Var (Just (9,44)-(9,46)) "s2")
*)

(* typed spans
(8,29)-(8,30)
(8,9)-(8,28)
(8,18)-(8,27)
(9,49)-(9,50)
(9,29)-(9,48)
(9,38)-(9,47)
*)

(* correct types
int list -> int list -> int list
int list
int
int list -> int list -> int list
int list
int
*)

(* bad types
int -> int -> int list
int -> int -> int list
'a list
int -> int -> int list
int -> int -> int list
'a list
*)
