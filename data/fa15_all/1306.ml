
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  if difference1 > 0 then (clone 0 2) :: l1;;


(* fix

let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  let retTuple = (l1, l2) in retTuple;;

*)

(* changed spans
(7,2)-(7,43)
let retTuple = (l1 , l2) in
retTuple
LetG NonRec (fromList [TupleG (fromList [EmptyG])]) VarG

*)

(* changed exprs
Let (Just (5,2)-(5,37)) NonRec [(VarPat (Just (5,6)-(5,14)) "retTuple",Tuple (Just (5,17)-(5,25)) [Var (Just (5,18)-(5,20)) "l1",Var (Just (5,22)-(5,24)) "l2"])] (Var (Just (5,29)-(5,37)) "retTuple")
*)

(* typed spans
(5,2)-(5,37)
*)

(* correct types
('a list * 'b list)
*)

(* bad types
unit
*)
