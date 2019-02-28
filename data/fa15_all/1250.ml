
let rec clone x n = if n <= 0 then [] else [x] :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then clone (0 :: l1) (List.length l2)
    else clone (List.length l1) (0 :: l2);;


(* fix

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then ((0 :: l1), l2)
    else (l1, (0 :: l2));;

*)

(* changed spans
(9,9)-(9,41)
(0 :: l1 , l2)
TupleG (fromList [VarG,ConAppG (Just (TupleG (fromList [VarG,LitG])))])

(10,9)-(10,41)
(l1 , 0 :: l2)
TupleG (fromList [VarG,ConAppG (Just (TupleG (fromList [VarG,LitG])))])

*)

(* changed exprs
Tuple (Just (7,9)-(7,24)) [ConApp (Just (7,10)-(7,19)) "::" (Just (Tuple (Just (7,11)-(7,18)) [Lit (Just (7,11)-(7,12)) (LI 0),Var (Just (7,16)-(7,18)) "l1"])) Nothing,Var (Just (7,21)-(7,23)) "l2"]
Tuple (Just (8,9)-(8,24)) [Var (Just (8,10)-(8,12)) "l1",ConApp (Just (8,14)-(8,23)) "::" (Just (Tuple (Just (8,15)-(8,22)) [Lit (Just (8,15)-(8,16)) (LI 0),Var (Just (8,20)-(8,22)) "l2"])) Nothing]
*)

(* typed spans
(7,9)-(7,24)
(8,9)-(8,24)
*)

(* correct types
(int list * int list)
(int list * int list)
*)

(* bad types
int list list list
int list list list
*)
