
let rec wwhile (f,b) =
  let (value,result) = f b in if result then wwhile (f, value) else value;;

let fixpoint (f,b) =
  wwhile
    ((let helper func = let result = func b in (result, (result = b)) in
      helper f), b);;


(* fix

let rec wwhile (f,b) =
  let (value,result) = f b in if result then wwhile (f, value) else value;;

let fixpoint (f,b) =
  wwhile
    ((let helper b' = let result = f b' in (result, (result = b')) in helper),
      b);;

*)

(* changed spans
(7,17)-(7,69)
fun b' ->
  (let result = f b' in
   (result , result = b'))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Lam (Just (7,17)-(7,66)) (VarPat (Just (7,17)-(7,19)) "b'") (Let (Just (7,22)-(7,66)) NonRec [(VarPat (Just (7,26)-(7,32)) "result",App (Just (7,35)-(7,39)) (Var (Just (7,35)-(7,36)) "f") [Var (Just (7,37)-(7,39)) "b'"])] (Tuple (Just (7,43)-(7,66)) [Var (Just (7,44)-(7,50)) "result",Bop (Just (7,52)-(7,65)) Eq (Var (Just (7,53)-(7,59)) "result") (Var (Just (7,62)-(7,64)) "b'")])) Nothing
*)

(* typed spans
(7,17)-(7,66)
*)

(* correct types
'a -> ('a * bool)
*)

(* bad types
('a -> 'a) -> ('a * bool)
*)
