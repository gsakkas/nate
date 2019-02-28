
let fpHelper (f,x,y) =
  let n = f x in match n with | y -> (n, y, false) | _ -> (n, y, false);;

let rec wwhile (f,b) =
  let (b',c') = f b in
  match c' with | false  -> (b', c') | true  -> wwhile (f, b');;

let fixpoint (f,b) = wwhile ((fpHelper (f, b, b)), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | true  -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((let helper x = let y = f x in if y = x then (y, false) else (y, true) in
      helper), b);;

*)

(* changed spans
(7,28)-(7,36)
b'
VarG

(9,21)-(9,27)
let helper =
  fun x ->
    (let y = f x in
     if y = x
     then (y , false)
     else (y , true)) in
helper
LetG NonRec (fromList [LamG EmptyG]) VarG

(9,39)-(9,48)
f
VarG

(9,39)-(9,48)
x
VarG

(9,43)-(9,44)
if y = x
then (y , false)
else (y , true)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(9,43)-(9,44)
helper
VarG

*)

(* changed exprs
Var (Just (3,49)-(3,51)) "b'"
Let (Just (7,5)-(8,13)) NonRec [(VarPat (Just (7,10)-(7,16)) "helper",Lam (Just (7,17)-(7,75)) (VarPat (Just (7,17)-(7,18)) "x") (Let (Just (7,21)-(7,75)) NonRec [(VarPat (Just (7,25)-(7,26)) "y",App (Just (7,29)-(7,32)) (Var (Just (7,29)-(7,30)) "f") [Var (Just (7,31)-(7,32)) "x"])] (Ite (Just (7,36)-(7,75)) (Bop (Just (7,39)-(7,44)) Eq (Var (Just (7,39)-(7,40)) "y") (Var (Just (7,43)-(7,44)) "x")) (Tuple (Just (7,50)-(7,60)) [Var (Just (7,51)-(7,52)) "y",Lit (Just (7,54)-(7,59)) (LB False)]) (Tuple (Just (7,66)-(7,75)) [Var (Just (7,67)-(7,68)) "y",Lit (Just (7,70)-(7,74)) (LB True)]))) Nothing)] (Var (Just (8,6)-(8,12)) "helper")
Var (Just (7,29)-(7,30)) "f"
Var (Just (7,31)-(7,32)) "x"
Ite (Just (7,36)-(7,75)) (Bop (Just (7,39)-(7,44)) Eq (Var (Just (7,39)-(7,40)) "y") (Var (Just (7,43)-(7,44)) "x")) (Tuple (Just (7,50)-(7,60)) [Var (Just (7,51)-(7,52)) "y",Lit (Just (7,54)-(7,59)) (LB False)]) (Tuple (Just (7,66)-(7,75)) [Var (Just (7,67)-(7,68)) "y",Lit (Just (7,70)-(7,74)) (LB True)])
Var (Just (8,6)-(8,12)) "helper"
*)

(* typed spans
(3,49)-(3,51)
(7,5)-(8,13)
(7,29)-(7,30)
(7,31)-(7,32)
(7,36)-(7,75)
(8,6)-(8,12)
*)

(* correct types
'a
'a -> ('a * bool)
'a -> 'a
'a
('a * bool)
'a -> ('a * bool)
*)

(* bad types
('a * bool)
('a -> ('a * bool) * 'a) -> ('a * bool)
('a -> 'a * 'a * 'a)
('a -> 'a * 'a * 'a)
'a
'a
*)
