
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let first = List.length l1 in
  let sec = List.length l2 in
  if first < sec
  then ((List.append (clone 0 (sec - first)) l1), l2)
  else
    if first > sec
    then List.append l1 ((clone 0 (first - sec)) :: l2)
    else (l1, l2);;


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
(11,9)-(11,55)
(l1 , List.append (clone 0
                         (first - sec)) l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* changed exprs
Tuple (Just (11,9)-(11,55)) [Var (Just (11,10)-(11,12)) "l1",App (Just (11,14)-(11,54)) (Var (Just (11,15)-(11,26)) "List.append") [App (Just (11,27)-(11,50)) (Var (Just (11,28)-(11,33)) "clone") [Lit (Just (11,34)-(11,35)) (LI 0),Bop (Just (11,36)-(11,49)) Minus (Var (Just (11,37)-(11,42)) "first") (Var (Just (11,45)-(11,48)) "sec")],Var (Just (11,51)-(11,53)) "l2"]]
*)

(* typed spans
(11,9)-(11,55)
*)

(* correct types
(int list * int list)
*)

(* bad types
(int list * int list list)
*)
