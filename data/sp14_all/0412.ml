
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let fb = f b in ((fb, (fb = b)), b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let w b' = let fb = f b' in (fb, (fb = b')) in wwhile (w, b);;

*)

(* changed spans
(4,21)-(4,65)
let w =
  fun b' ->
    (let fb = f b' in
     (fb , fb = b')) in
wwhile (w , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (5,2)-(5,62)) NonRec [(VarPat (Just (5,6)-(5,7)) "w",Lam (Just (5,8)-(5,45)) (VarPat (Just (5,8)-(5,10)) "b'") (Let (Just (5,13)-(5,45)) NonRec [(VarPat (Just (5,17)-(5,19)) "fb",App (Just (5,22)-(5,26)) (Var (Just (5,22)-(5,23)) "f") [Var (Just (5,24)-(5,26)) "b'"])] (Tuple (Just (5,30)-(5,45)) [Var (Just (5,31)-(5,33)) "fb",Bop (Just (5,35)-(5,44)) Eq (Var (Just (5,36)-(5,38)) "fb") (Var (Just (5,41)-(5,43)) "b'")])) Nothing)] (App (Just (5,49)-(5,62)) (Var (Just (5,49)-(5,55)) "wwhile") [Tuple (Just (5,56)-(5,62)) [Var (Just (5,57)-(5,58)) "w",Var (Just (5,60)-(5,61)) "b"]])
*)

(* typed spans
(5,2)-(5,62)
*)

(* correct types
'a
*)

(* bad types
'a
*)
