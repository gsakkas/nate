
let rec clone x n =
  match n > 0 with | false  -> [] | true  -> [x] @ ((clone x n) - 1);;


(* fix

let rec clone x n =
  match n > 0 with | false  -> [] | true  -> x :: (clone x (n - 1));;

*)

(* changed spans
(3,45)-(3,48)
x :: (clone x (n - 1))
ConAppG (Just (TupleG (fromList [VarG,AppG (fromList [VarG,BopG VarG LitG])]))) Nothing

(3,45)-(3,68)
EMPTY
EmptyG

(3,49)-(3,50)
EMPTY
EmptyG

(3,51)-(3,68)
EMPTY
EmptyG

(3,61)-(3,62)
n - 1
BopG VarG LitG

*)
