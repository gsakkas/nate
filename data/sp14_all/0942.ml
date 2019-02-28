
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let leng1 = List.length l1 in
  let leng2 = List.length l2 in
  ((((clone 0 leng1) - leng2) @ l1), (((clone 0 leng2) - leng1) @ l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let leng1 = List.length l1 in
  let leng2 = List.length l2 in
  (((clone 0 (leng1 - leng2)) @ l1), ((clone 0 (leng2 - leng1)) @ l2));;

*)

(* changed spans
(7,4)-(7,29)
clone 0 (leng1 - leng2)
AppG (fromList [BopG EmptyG EmptyG,LitG])

(7,38)-(7,63)
clone 0 (leng2 - leng1)
AppG (fromList [BopG EmptyG EmptyG,LitG])

(7,38)-(7,63)
clone
VarG

(7,38)-(7,63)
0
LitG

(7,38)-(7,63)
leng2 - leng1
BopG VarG VarG

*)

(* changed exprs
App (Just (7,4)-(7,29)) (Var (Just (7,5)-(7,10)) "clone") [Lit (Just (7,11)-(7,12)) (LI 0),Bop (Just (7,13)-(7,28)) Minus (Var (Just (7,14)-(7,19)) "leng1") (Var (Just (7,22)-(7,27)) "leng2")]
App (Just (7,38)-(7,63)) (Var (Just (7,39)-(7,44)) "clone") [Lit (Just (7,45)-(7,46)) (LI 0),Bop (Just (7,47)-(7,62)) Minus (Var (Just (7,48)-(7,53)) "leng2") (Var (Just (7,56)-(7,61)) "leng1")]
Var (Just (7,39)-(7,44)) "clone"
Lit (Just (7,45)-(7,46)) (LI 0)
Bop (Just (7,47)-(7,62)) Minus (Var (Just (7,48)-(7,53)) "leng2") (Var (Just (7,56)-(7,61)) "leng1")
*)

(* typed spans
(7,4)-(7,29)
(7,38)-(7,63)
(7,39)-(7,44)
(7,45)-(7,46)
(7,47)-(7,62)
*)

(* correct types
int list
int list
int -> int -> int list
int
int
*)

(* bad types
int
int
int
int
int
*)
