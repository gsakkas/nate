
let rec wwhile (f,b) = let (i,t) = f b in if t then wwhile (f, i) else i;;

let fixpoint (f,b) = wwhile ((let (i,t) = f b in i = b), b);;


(* fix

let rec wwhile (f,b) = let (i,t) = f b in if t then wwhile (f, i) else i;;

let fixpoint (f,b) =
  wwhile
    ((let g b = let xx = f b in if b = xx then (xx, false) else (xx, true) in
      g), b);;

*)

(* changed spans
(4,29)-(4,55)
let g =
  fun b ->
    (let xx = f b in
     if b = xx
     then (xx , false)
     else (xx , true)) in
g
LetG NonRec (fromList [LamG EmptyG]) VarG

*)

(* changed exprs
Let (Just (6,5)-(7,8)) NonRec [(VarPat (Just (6,10)-(6,11)) "g",Lam (Just (6,12)-(6,74)) (VarPat (Just (6,12)-(6,13)) "b") (Let (Just (6,16)-(6,74)) NonRec [(VarPat (Just (6,20)-(6,22)) "xx",App (Just (6,25)-(6,28)) (Var (Just (6,25)-(6,26)) "f") [Var (Just (6,27)-(6,28)) "b"])] (Ite (Just (6,32)-(6,74)) (Bop (Just (6,35)-(6,41)) Eq (Var (Just (6,35)-(6,36)) "b") (Var (Just (6,39)-(6,41)) "xx")) (Tuple (Just (6,47)-(6,58)) [Var (Just (6,48)-(6,50)) "xx",Lit (Just (6,52)-(6,57)) (LB False)]) (Tuple (Just (6,64)-(6,74)) [Var (Just (6,65)-(6,67)) "xx",Lit (Just (6,69)-(6,73)) (LB True)]))) Nothing)] (Var (Just (7,6)-(7,7)) "g")
*)

(* typed spans
(6,5)-(7,8)
*)

(* correct types
'a -> ('a * bool)
*)

(* bad types
bool
*)
