
let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  if difference1 > 0 then (l1, l2);;


(* fix

let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  let retTuple = (l1, l2) in retTuple;;

*)

(* changed spans
(5,2)-(5,34)
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
