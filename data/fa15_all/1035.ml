
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
EMPTY
EmptyG

(8,29)-(8,41)
EMPTY
EmptyG

(8,33)-(8,34)
0 :: (0 :: (0 :: l1))
ConAppG (Just (TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [VarG,LitG]))) Nothing]))) Nothing]))) Nothing

(8,36)-(8,37)
0 :: (0 :: l1)
ConAppG (Just (TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [VarG,LitG]))) Nothing]))) Nothing

(8,39)-(8,40)
0 :: l1
ConAppG (Just (TupleG (fromList [VarG,LitG]))) Nothing

(9,17)-(9,31)
EMPTY
EmptyG

(9,18)-(9,30)
EMPTY
EmptyG

(9,22)-(9,23)
0 :: (0 :: (0 :: l2))
ConAppG (Just (TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [VarG,LitG]))) Nothing]))) Nothing]))) Nothing

(9,25)-(9,26)
0 :: (0 :: l2)
ConAppG (Just (TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [VarG,LitG]))) Nothing]))) Nothing

(9,28)-(9,29)
0 :: l2
ConAppG (Just (TupleG (fromList [VarG,LitG]))) Nothing

*)
