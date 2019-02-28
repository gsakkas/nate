
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let foo f b =
    let result = f b in
    if result = b then (result, false) else (result, true) in
  wwhile (foo, b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let foo b =
    let result = f b in
    if result = b then (result, false) else (result, true) in
  wwhile (foo, b);;

*)

(* changed spans
(5,10)-(7,58)
fun b ->
  (let result = f b in
   if result = b
   then (result , false)
   else (result , true))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Lam (Just (5,10)-(7,58)) (VarPat (Just (5,10)-(5,11)) "b") (Let (Just (6,4)-(7,58)) NonRec [(VarPat (Just (6,8)-(6,14)) "result",App (Just (6,17)-(6,20)) (Var (Just (6,17)-(6,18)) "f") [Var (Just (6,19)-(6,20)) "b"])] (Ite (Just (7,4)-(7,58)) (Bop (Just (7,7)-(7,17)) Eq (Var (Just (7,7)-(7,13)) "result") (Var (Just (7,16)-(7,17)) "b")) (Tuple (Just (7,23)-(7,38)) [Var (Just (7,24)-(7,30)) "result",Lit (Just (7,32)-(7,37)) (LB False)]) (Tuple (Just (7,44)-(7,58)) [Var (Just (7,45)-(7,51)) "result",Lit (Just (7,53)-(7,57)) (LB True)]))) Nothing
*)

(* typed spans
(5,10)-(7,58)
*)

(* correct types
'a -> ('a * bool)
*)

(* bad types
('a -> 'a) -> 'a -> ('a * bool)
*)
