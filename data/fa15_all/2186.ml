
let rec wwhile (f,b) =
  let (value,result) = f b in if result then wwhile (f, value) else value;;

let fixpoint (f,b) = wwhile ((let helper f = not f in helper), b);;


(* fix

let rec wwhile (f,b) =
  let (value,result) = f b in if result then wwhile (f, value) else value;;

let fixpoint (f,b) =
  wwhile
    ((let helper func = let result = f b in (result, (result = b)) in helper),
      b);;

*)

(* changed spans
(5,41)-(5,50)
fun func ->
  (let result = f b in
   (result , result = b))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Lam (Just (7,17)-(7,66)) (VarPat (Just (7,17)-(7,21)) "func") (Let (Just (7,24)-(7,66)) NonRec [(VarPat (Just (7,28)-(7,34)) "result",App (Just (7,37)-(7,40)) (Var (Just (7,37)-(7,38)) "f") [Var (Just (7,39)-(7,40)) "b"])] (Tuple (Just (7,44)-(7,66)) [Var (Just (7,45)-(7,51)) "result",Bop (Just (7,53)-(7,65)) Eq (Var (Just (7,54)-(7,60)) "result") (Var (Just (7,63)-(7,64)) "b")])) Nothing
*)

(* typed spans
(7,17)-(7,66)
*)

(* correct types
'a -> ('a * bool)
*)

(* bad types
bool -> bool
*)
