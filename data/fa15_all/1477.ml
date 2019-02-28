
let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) = wwhile ((wwhile (f, b)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) =
  wwhile
    ((let g b = let t = f b in if b = t then (b, false) else (t, true) in g),
      b);;

*)

(* changed spans
(5,29)-(5,44)
let g =
  fun b ->
    (let t = f b in
     if b = t
     then (b , false)
     else (t , true)) in
g
LetG NonRec (fromList [LamG EmptyG]) VarG

*)

(* changed exprs
Let (Just (7,5)-(7,76)) NonRec [(VarPat (Just (7,10)-(7,11)) "g",Lam (Just (7,12)-(7,70)) (VarPat (Just (7,12)-(7,13)) "b") (Let (Just (7,16)-(7,70)) NonRec [(VarPat (Just (7,20)-(7,21)) "t",App (Just (7,24)-(7,27)) (Var (Just (7,24)-(7,25)) "f") [Var (Just (7,26)-(7,27)) "b"])] (Ite (Just (7,31)-(7,70)) (Bop (Just (7,34)-(7,39)) Eq (Var (Just (7,34)-(7,35)) "b") (Var (Just (7,38)-(7,39)) "t")) (Tuple (Just (7,45)-(7,55)) [Var (Just (7,46)-(7,47)) "b",Lit (Just (7,49)-(7,54)) (LB False)]) (Tuple (Just (7,61)-(7,70)) [Var (Just (7,62)-(7,63)) "t",Lit (Just (7,65)-(7,69)) (LB True)]))) Nothing)] (Var (Just (7,74)-(7,75)) "g")
*)

(* typed spans
(7,5)-(7,76)
*)

(* correct types
'a -> ('a * bool)
*)

(* bad types
'a
*)
