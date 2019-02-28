
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let fs bs = if bs = 0 then 0 else if bs > 1 then bs - 1 else bs + 1 in
  wwhile ((fs b true), b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, true) else (b, false) in wwhile (funt, b);;

*)

(* changed spans
(7,2)-(8,25)
let funt =
  fun b ->
    if f b
    then (b , true)
    else (b , false) in
wwhile (funt , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (7,2)-(7,72)) NonRec [(VarPat (Just (7,6)-(7,10)) "funt",Lam (Just (7,11)-(7,52)) (VarPat (Just (7,11)-(7,12)) "b") (Ite (Just (7,15)-(7,52)) (App (Just (7,18)-(7,21)) (Var (Just (7,18)-(7,19)) "f") [Var (Just (7,20)-(7,21)) "b"]) (Tuple (Just (7,27)-(7,36)) [Var (Just (7,28)-(7,29)) "b",Lit (Just (7,31)-(7,35)) (LB True)]) (Tuple (Just (7,42)-(7,52)) [Var (Just (7,43)-(7,44)) "b",Lit (Just (7,46)-(7,51)) (LB False)])) Nothing)] (App (Just (7,56)-(7,72)) (Var (Just (7,56)-(7,62)) "wwhile") [Tuple (Just (7,63)-(7,72)) [Var (Just (7,64)-(7,68)) "funt",Var (Just (7,70)-(7,71)) "b"]])
*)

(* typed spans
(7,2)-(7,72)
*)

(* correct types
'a
*)

(* bad types
int
*)
