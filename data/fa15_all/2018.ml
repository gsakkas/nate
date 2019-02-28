
let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | true  -> wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let g x = f b in ((f b), ((f b) = b))), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | true  -> wwhile (f, b');;

let fixpoint (f,b) = let g x = let n = f x in (n, (n = x)) in wwhile (g, b);;

*)

(* changed spans
(5,21)-(5,72)
let g =
  fun x ->
    (let n = f x in
     (n , n = x)) in
wwhile (g , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (5,21)-(5,75)) NonRec [(VarPat (Just (5,25)-(5,26)) "g",Lam (Just (5,27)-(5,58)) (VarPat (Just (5,27)-(5,28)) "x") (Let (Just (5,31)-(5,58)) NonRec [(VarPat (Just (5,35)-(5,36)) "n",App (Just (5,39)-(5,42)) (Var (Just (5,39)-(5,40)) "f") [Var (Just (5,41)-(5,42)) "x"])] (Tuple (Just (5,46)-(5,58)) [Var (Just (5,47)-(5,48)) "n",Bop (Just (5,50)-(5,57)) Eq (Var (Just (5,51)-(5,52)) "n") (Var (Just (5,55)-(5,56)) "x")])) Nothing)] (App (Just (5,62)-(5,75)) (Var (Just (5,62)-(5,68)) "wwhile") [Tuple (Just (5,69)-(5,75)) [Var (Just (5,70)-(5,71)) "g",Var (Just (5,73)-(5,74)) "b"]])
*)

(* typed spans
(5,21)-(5,75)
*)

(* correct types
'a
*)

(* bad types
'a
*)
