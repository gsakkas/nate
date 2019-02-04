
let rec clone x n = match n with | 0 -> x | _ -> x :: (clone x (n - 1));;


(* fix

let rec clone x n =
  let x' = abs n in if x' > 0 then [x] @ (clone x (n - 1)) else [];;

*)

(* changed spans
(2,20)-(2,71)
let x' = abs n in
if x' > 0
then [x] @ clone x (n - 1)
else []
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (IteG EmptyG EmptyG EmptyG)

(2,26)-(2,27)
abs n
AppG (fromList [VarG])

(2,40)-(2,41)
EMPTY
EmptyG

(2,49)-(2,50)
[x] @ clone x (n - 1)
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(2,49)-(2,71)
if x' > 0
then [x] @ clone x (n - 1)
else []
IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) (ListG EmptyG Nothing)

*)
