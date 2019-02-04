
let bigMul l1 l2 =
  let f a x =
    let (m,n) = a in
    let (c,d) = x in let z = (c * d) + m in ((z / 10), ((z mod 10) :: n)) in
  let base = (0, []) in
  let args =
    List.combine (List.rev ([0; 0; 0; 0] :: l1))
      (List.rev ([0; 0; 0; 0] :: l2)) in
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
(8,28)-(8,40)
EMPTY
EmptyG

(8,32)-(8,33)
0 :: (0 :: (0 :: l1))
ConAppG (Just (TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [VarG,LitG]))) Nothing]))) Nothing]))) Nothing

(8,35)-(8,36)
0 :: (0 :: l1)
ConAppG (Just (TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [VarG,LitG]))) Nothing]))) Nothing

(8,38)-(8,39)
0 :: l1
ConAppG (Just (TupleG (fromList [VarG,LitG]))) Nothing

(9,17)-(9,29)
EMPTY
EmptyG

(9,21)-(9,22)
0 :: (0 :: (0 :: l2))
ConAppG (Just (TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [VarG,LitG]))) Nothing]))) Nothing]))) Nothing

(9,24)-(9,25)
0 :: (0 :: l2)
ConAppG (Just (TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [VarG,LitG]))) Nothing]))) Nothing

(9,27)-(9,28)
0 :: l2
ConAppG (Just (TupleG (fromList [VarG,LitG]))) Nothing

*)
