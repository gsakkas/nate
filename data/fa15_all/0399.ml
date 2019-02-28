
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt = let res = f b in match b with | res -> b in wwhile (funt, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, true) else (b, false) in wwhile (funt, b);;

*)

(* changed spans
(7,13)-(7,53)
fun b ->
  if f b
  then (b , true)
  else (b , false)
LamG (IteG EmptyG EmptyG EmptyG)

*)

(* changed exprs
Lam (Just (7,11)-(7,52)) (VarPat (Just (7,11)-(7,12)) "b") (Ite (Just (7,15)-(7,52)) (App (Just (7,18)-(7,21)) (Var (Just (7,18)-(7,19)) "f") [Var (Just (7,20)-(7,21)) "b"]) (Tuple (Just (7,27)-(7,36)) [Var (Just (7,28)-(7,29)) "b",Lit (Just (7,31)-(7,35)) (LB True)]) (Tuple (Just (7,42)-(7,52)) [Var (Just (7,43)-(7,44)) "b",Lit (Just (7,46)-(7,51)) (LB False)])) Nothing
*)

(* typed spans
(7,11)-(7,52)
*)

(* correct types
'a -> ('a * bool)
*)

(* bad types
'a -> ('a * bool)
*)
