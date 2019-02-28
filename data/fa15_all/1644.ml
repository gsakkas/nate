
let helper (f,a,y) = let x = f a in if x = y then (x, false) else (x, true);;

let rec wwhile (f,b) =
  let (b',c') = f b in
  match c' with | false  -> (b', c') | true  -> wwhile (f, b');;

let fixpoint (f,b) = wwhile (helper, b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | true  -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((let helper x = let y = f x in if y = x then (y, false) else (y, true) in
      helper), b);;

*)

(* changed spans
(6,28)-(6,36)
b'
VarG

(8,21)-(8,27)
let helper =
  fun x ->
    (let y = f x in
     if y = x
     then (y , false)
     else (y , true)) in
helper
LetG NonRec (fromList [LamG EmptyG]) VarG

*)

(* changed exprs
Var (Just (3,49)-(3,51)) "b'"
Let (Just (7,5)-(8,13)) NonRec [(VarPat (Just (7,10)-(7,16)) "helper",Lam (Just (7,17)-(7,75)) (VarPat (Just (7,17)-(7,18)) "x") (Let (Just (7,21)-(7,75)) NonRec [(VarPat (Just (7,25)-(7,26)) "y",App (Just (7,29)-(7,32)) (Var (Just (7,29)-(7,30)) "f") [Var (Just (7,31)-(7,32)) "x"])] (Ite (Just (7,36)-(7,75)) (Bop (Just (7,39)-(7,44)) Eq (Var (Just (7,39)-(7,40)) "y") (Var (Just (7,43)-(7,44)) "x")) (Tuple (Just (7,50)-(7,60)) [Var (Just (7,51)-(7,52)) "y",Lit (Just (7,54)-(7,59)) (LB False)]) (Tuple (Just (7,66)-(7,75)) [Var (Just (7,67)-(7,68)) "y",Lit (Just (7,70)-(7,74)) (LB True)]))) Nothing)] (Var (Just (8,6)-(8,12)) "helper")
*)

(* typed spans
(3,49)-(3,51)
(7,5)-(8,13)
*)

(* correct types
'a
'a -> ('a * bool)
*)

(* bad types
(('a -> 'b * 'a * 'b) * bool)
(('a -> 'b * 'a * 'b) -> (('a -> 'b * 'a * 'b) * bool) * ('a -> 'b * 'a * 'b)) -> (('a -> 'b * 'a * 'b) * bool)
*)
