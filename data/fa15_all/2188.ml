
let rec wwhile (f,b) =
  let (value,result) = f b in if result then wwhile (f, value) else value;;

let fixpoint (f,b) =
  wwhile
    ((let helper func = let (value,result) = f b in value * (not result) in
      helper), b);;


(* fix

let rec wwhile (f,b) =
  let (value,result) = f b in if result then wwhile (f, value) else value;;

let fixpoint (f,b) =
  wwhile
    ((let helper func = let result = f b in (result, (result = b)) in helper),
      b);;

*)

(* changed spans
(7,24)-(7,72)
let result = f b in
(result , result = b)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (TupleG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (7,24)-(7,66)) NonRec [(VarPat (Just (7,28)-(7,34)) "result",App (Just (7,37)-(7,40)) (Var (Just (7,37)-(7,38)) "f") [Var (Just (7,39)-(7,40)) "b"])] (Tuple (Just (7,44)-(7,66)) [Var (Just (7,45)-(7,51)) "result",Bop (Just (7,53)-(7,65)) Eq (Var (Just (7,54)-(7,60)) "result") (Var (Just (7,63)-(7,64)) "b")])
*)

(* typed spans
(7,24)-(7,66)
*)

(* correct types
('a * bool)
*)

(* bad types
int
*)
