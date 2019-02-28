
let bigMul l1 l2 =
  let f a x =
    let (m,n) = a in
    let (c,d) = x in let z = (c * d) + m in ((z / 10), ((z mod 10) :: n)) in
  let base = (0, []) in
  let args =
    List.combine (List.rev ([(0, 0, 0, 0)] :: l1))
      (List.rev ([(0, 0, 0, 0)] :: l2)) in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let bigMul l1 l2 =
  let f a x =
    let (m,n) = a in
    let (c,d) = x in let z = (c * d) + m in ((z / 10), ((z mod 10) :: n)) in
  let base = (0, []) in
  let args =
    List.combine (List.rev (0 :: 0 :: 0 :: 0 :: l1))
      (List.rev (0 :: 0 :: 0 :: 0 :: l2)) in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(8,28)-(8,42)
0
LitG

(8,28)-(8,42)
0 :: (0 :: (0 :: l1))
ConAppG (Just (TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [VarG,LitG])))])))])))

(9,17)-(9,31)
0
LitG

(9,17)-(9,31)
0 :: (0 :: (0 :: l2))
ConAppG (Just (TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [VarG,LitG])))])))])))

*)

(* changed exprs
Lit (Just (8,28)-(8,29)) (LI 0)
ConApp (Just (8,33)-(8,50)) "::" (Just (Tuple (Just (8,33)-(8,50)) [Lit (Just (8,33)-(8,34)) (LI 0),ConApp (Just (8,38)-(8,50)) "::" (Just (Tuple (Just (8,38)-(8,50)) [Lit (Just (8,38)-(8,39)) (LI 0),ConApp (Just (8,43)-(8,50)) "::" (Just (Tuple (Just (8,43)-(8,50)) [Lit (Just (8,43)-(8,44)) (LI 0),Var (Just (8,48)-(8,50)) "l1"])) Nothing])) Nothing])) Nothing
Lit (Just (9,17)-(9,18)) (LI 0)
ConApp (Just (9,22)-(9,39)) "::" (Just (Tuple (Just (9,22)-(9,39)) [Lit (Just (9,22)-(9,23)) (LI 0),ConApp (Just (9,27)-(9,39)) "::" (Just (Tuple (Just (9,27)-(9,39)) [Lit (Just (9,27)-(9,28)) (LI 0),ConApp (Just (9,32)-(9,39)) "::" (Just (Tuple (Just (9,32)-(9,39)) [Lit (Just (9,32)-(9,33)) (LI 0),Var (Just (9,37)-(9,39)) "l2"])) Nothing])) Nothing])) Nothing
*)

(* typed spans
(8,28)-(8,29)
(8,33)-(8,50)
(9,17)-(9,18)
(9,22)-(9,39)
*)

(* correct types
int
int list
int
int list
*)

(* bad types
(int * int * int * int) list
(int * int * int * int) list
(int * int * int * int) list
(int * int * int * int) list
*)
