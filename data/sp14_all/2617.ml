
let rec clone x n =
  let rec helper a b acc = if b > 0 then helper a (b - 1) (a :: acc) else acc in
  helper x n [];;

let padZero l1 l2 =
  let l1_len = List.length l1 in
  let l2_len = List.length l2 in
  let l_diff = l1_len - l2_len in
  if l_diff < 0
  then ((clone 0 ((l_diff * (-1)) @ l1)), l2)
  else (l1, ((clone 0 l_diff) @ l2));;


(* fix

let rec clone x n =
  let rec helper a b acc = if b > 0 then helper a (b - 1) (a :: acc) else acc in
  helper x n [];;

let padZero l1 l2 =
  let l1_len = List.length l1 in
  let l2_len = List.length l2 in
  let l_diff = l1_len - l2_len in
  if l_diff < 0
  then (((clone 0 (l_diff * (-1))) @ l1), l2)
  else (l1, ((clone 0 l_diff) @ l2));;

*)

(* changed spans
(11,9)-(11,14)
(@)
VarG

(11,9)-(11,14)
clone 0 (l_diff * (-1))
AppG (fromList [BopG EmptyG EmptyG,LitG])

(11,17)-(11,39)
l_diff * (-1)
BopG VarG LitG

(11,17)-(11,39)
l_diff
VarG

(11,17)-(11,39)
(-1)
LitG

(11,17)-(11,39)
l1
VarG

*)

(* changed exprs
Var (Just (11,35)-(11,36)) "@"
App (Just (11,9)-(11,34)) (Var (Just (11,10)-(11,15)) "clone") [Lit (Just (11,16)-(11,17)) (LI 0),Bop (Just (11,18)-(11,33)) Times (Var (Just (11,19)-(11,25)) "l_diff") (Lit (Just (11,28)-(11,32)) (LI (-1)))]
Bop (Just (11,18)-(11,33)) Times (Var (Just (11,19)-(11,25)) "l_diff") (Lit (Just (11,28)-(11,32)) (LI (-1)))
Var (Just (11,19)-(11,25)) "l_diff"
Lit (Just (11,28)-(11,32)) (LI (-1))
Var (Just (11,37)-(11,39)) "l1"
*)

(* typed spans
(11,35)-(11,36)
(11,9)-(11,34)
(11,18)-(11,33)
(11,19)-(11,25)
(11,28)-(11,32)
(11,37)-(11,39)
*)

(* correct types
int list -> int list -> int list
int list
int
int
int
int list
*)

(* bad types
int -> int -> int list
int -> int -> int list
int
int
int
int
*)
