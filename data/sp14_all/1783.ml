
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let first = List.length l1 in
  let sec = List.length l2 in
  if first < sec
  then (clone 0 (sec - first)) :: l1
  else
    if first > sec then (l1, ((clone 0 (first - sec)) :: l2)) else (l1, l2);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let first = List.length l1 in
  let sec = List.length l2 in
  if first < sec
  then ((List.append (clone 0 (sec - first)) l1), l2)
  else
    if first > sec
    then (l1, (List.append (clone 0 (first - sec)) l2))
    else (l1, l2);;

*)

(* changed spans
(8,7)-(8,36)
(List.append (clone 0
                    (sec - first)) l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(10,29)-(10,60)
List.append (clone 0
                   (first - sec)) l2
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(10,29)-(10,60)
List.append
VarG

(10,31)-(10,36)
clone 0 (first - sec)
AppG (fromList [BopG EmptyG EmptyG,LitG])

*)

(* changed exprs
Tuple (Just (8,7)-(8,53)) [App (Just (8,8)-(8,48)) (Var (Just (8,9)-(8,20)) "List.append") [App (Just (8,21)-(8,44)) (Var (Just (8,22)-(8,27)) "clone") [Lit (Just (8,28)-(8,29)) (LI 0),Bop (Just (8,30)-(8,43)) Minus (Var (Just (8,31)-(8,34)) "sec") (Var (Just (8,37)-(8,42)) "first")],Var (Just (8,45)-(8,47)) "l1"],Var (Just (8,50)-(8,52)) "l2"]
App (Just (11,14)-(11,54)) (Var (Just (11,15)-(11,26)) "List.append") [App (Just (11,27)-(11,50)) (Var (Just (11,28)-(11,33)) "clone") [Lit (Just (11,34)-(11,35)) (LI 0),Bop (Just (11,36)-(11,49)) Minus (Var (Just (11,37)-(11,42)) "first") (Var (Just (11,45)-(11,48)) "sec")],Var (Just (11,51)-(11,53)) "l2"]
Var (Just (11,15)-(11,26)) "List.append"
App (Just (11,27)-(11,50)) (Var (Just (11,28)-(11,33)) "clone") [Lit (Just (11,34)-(11,35)) (LI 0),Bop (Just (11,36)-(11,49)) Minus (Var (Just (11,37)-(11,42)) "first") (Var (Just (11,45)-(11,48)) "sec")]
*)

(* typed spans
(8,7)-(8,53)
(11,14)-(11,54)
(11,15)-(11,26)
(11,27)-(11,50)
*)

(* correct types
(int list * int list)
int list
int list -> int list -> int list
int list
*)

(* bad types
int list list
int list list
int list list
int -> int -> int list
*)
