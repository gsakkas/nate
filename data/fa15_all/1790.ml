
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let h x = (f, ((f x) = x)) in (h, b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let h x = ((f x), ((f x) != x)) in (h, b));;

*)

(* changed spans
(4,40)-(4,41)
f x
AppG (fromList [VarG])

(4,44)-(4,49)
f x <> x
BopG (AppG (fromList [EmptyG])) VarG

*)

(* changed exprs
App (Just (4,40)-(4,45)) (Var (Just (4,41)-(4,42)) "f") [Var (Just (4,43)-(4,44)) "x"]
Bop (Just (4,47)-(4,59)) Neq (App (Just (4,48)-(4,53)) (Var (Just (4,49)-(4,50)) "f") [Var (Just (4,51)-(4,52)) "x"]) (Var (Just (4,57)-(4,58)) "x")
*)

(* typed spans
(4,40)-(4,45)
(4,47)-(4,59)
*)

(* correct types
'a
bool
*)

(* bad types
'a -> 'a
'a
*)
