
let padZero l1 l2 =
  let numZeros = (List.length l1) - (List.length l2) in
  if numZeros = 0 then (l1, l2);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let numZeros = (List.length l1) - (List.length l2) in
  let absNumZeros = abs numZeros in
  if numZeros = 0
  then (l1, l2)
  else
    (let listZeros = clone 0 absNumZeros in
     if numZeros > 0 then (l1, (listZeros @ l2)) else ((listZeros @ l1), l2));;

*)

(* changed spans
(2,12)-(4,31)
fun x ->
  fun n ->
    if n <= 0
    then []
    else x :: (clone x (n - 1))
LamG (LamG EmptyG)

(4,2)-(4,31)
let absNumZeros =
  abs numZeros in
if numZeros = 0
then (l1 , l2)
else (let listZeros =
        clone 0 absNumZeros in
      if numZeros > 0
      then (l1 , listZeros @ l2)
      else (listZeros @ l1 , l2))
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (IteG EmptyG EmptyG EmptyG)

(4,2)-(4,31)
let listZeros =
  clone 0 absNumZeros in
if numZeros > 0
then (l1 , listZeros @ l2)
else (listZeros @ l1 , l2)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (IteG EmptyG EmptyG EmptyG)

*)

(* changed exprs
Lam (Just (2,14)-(2,65)) (VarPat (Just (2,14)-(2,15)) "x") (Lam (Just (2,16)-(2,65)) (VarPat (Just (2,16)-(2,17)) "n") (Ite (Just (2,20)-(2,65)) (Bop (Just (2,23)-(2,29)) Le (Var (Just (2,23)-(2,24)) "n") (Lit (Just (2,28)-(2,29)) (LI 0))) (List (Just (2,35)-(2,37)) [] Nothing) (ConApp (Just (2,43)-(2,65)) "::" (Just (Tuple (Just (2,43)-(2,65)) [Var (Just (2,43)-(2,44)) "x",App (Just (2,48)-(2,65)) (Var (Just (2,49)-(2,54)) "clone") [Var (Just (2,55)-(2,56)) "x",Bop (Just (2,57)-(2,64)) Minus (Var (Just (2,58)-(2,59)) "n") (Lit (Just (2,62)-(2,63)) (LI 1))]])) Nothing)) Nothing) Nothing
Let (Just (6,2)-(11,77)) NonRec [(VarPat (Just (6,6)-(6,17)) "absNumZeros",App (Just (6,20)-(6,32)) (Var (Just (6,20)-(6,23)) "abs") [Var (Just (6,24)-(6,32)) "numZeros"])] (Ite (Just (7,2)-(11,77)) (Bop (Just (7,5)-(7,17)) Eq (Var (Just (7,5)-(7,13)) "numZeros") (Lit (Just (7,16)-(7,17)) (LI 0))) (Tuple (Just (8,7)-(8,15)) [Var (Just (8,8)-(8,10)) "l1",Var (Just (8,12)-(8,14)) "l2"]) (Let (Just (10,4)-(11,77)) NonRec [(VarPat (Just (10,9)-(10,18)) "listZeros",App (Just (10,21)-(10,40)) (Var (Just (10,21)-(10,26)) "clone") [Lit (Just (10,27)-(10,28)) (LI 0),Var (Just (10,29)-(10,40)) "absNumZeros"])] (Ite (Just (11,5)-(11,76)) (Bop (Just (11,8)-(11,20)) Gt (Var (Just (11,8)-(11,16)) "numZeros") (Lit (Just (11,19)-(11,20)) (LI 0))) (Tuple (Just (11,26)-(11,48)) [Var (Just (11,27)-(11,29)) "l1",App (Just (11,31)-(11,47)) (Var (Just (11,42)-(11,43)) "@") [Var (Just (11,32)-(11,41)) "listZeros",Var (Just (11,44)-(11,46)) "l2"]]) (Tuple (Just (11,54)-(11,76)) [App (Just (11,55)-(11,71)) (Var (Just (11,66)-(11,67)) "@") [Var (Just (11,56)-(11,65)) "listZeros",Var (Just (11,68)-(11,70)) "l1"],Var (Just (11,73)-(11,75)) "l2"]))))
Let (Just (10,4)-(11,77)) NonRec [(VarPat (Just (10,9)-(10,18)) "listZeros",App (Just (10,21)-(10,40)) (Var (Just (10,21)-(10,26)) "clone") [Lit (Just (10,27)-(10,28)) (LI 0),Var (Just (10,29)-(10,40)) "absNumZeros"])] (Ite (Just (11,5)-(11,76)) (Bop (Just (11,8)-(11,20)) Gt (Var (Just (11,8)-(11,16)) "numZeros") (Lit (Just (11,19)-(11,20)) (LI 0))) (Tuple (Just (11,26)-(11,48)) [Var (Just (11,27)-(11,29)) "l1",App (Just (11,31)-(11,47)) (Var (Just (11,42)-(11,43)) "@") [Var (Just (11,32)-(11,41)) "listZeros",Var (Just (11,44)-(11,46)) "l2"]]) (Tuple (Just (11,54)-(11,76)) [App (Just (11,55)-(11,71)) (Var (Just (11,66)-(11,67)) "@") [Var (Just (11,56)-(11,65)) "listZeros",Var (Just (11,68)-(11,70)) "l1"],Var (Just (11,73)-(11,75)) "l2"]))
*)

(* typed spans
(2,14)-(2,65)
(6,2)-(11,77)
(10,4)-(11,77)
*)

(* correct types
int -> int -> int list
(int list * int list)
(int list * int list)
*)

(* bad types
'a list -> 'b list -> unit
unit
unit
*)
