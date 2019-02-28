
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile ((if (f b) = b then (b, (failwith "asd")) else failwith "asd"), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((if (f b) = b
      then fun b''  -> ((f b), false)
      else (fun b''  -> ((f b), true))), b);;

*)

(* changed spans
(5,29)-(5,50)
fun b'' -> (f b , false)
LamG (TupleG (fromList [EmptyG]))

(5,43)-(5,48)
fun b'' -> (f b , true)
LamG (TupleG (fromList [EmptyG]))

(5,65)-(5,70)
f
VarG

(5,73)-(5,74)
true
LitG

(5,73)-(5,74)
b
VarG

*)

(* changed exprs
Lam (Just (7,11)-(7,37)) (VarPat (Just (7,15)-(7,18)) "b''") (Tuple (Just (7,23)-(7,37)) [App (Just (7,24)-(7,29)) (Var (Just (7,25)-(7,26)) "f") [Var (Just (7,27)-(7,28)) "b"],Lit (Just (7,31)-(7,36)) (LB False)]) Nothing
Lam (Just (8,11)-(8,38)) (VarPat (Just (8,16)-(8,19)) "b''") (Tuple (Just (8,24)-(8,37)) [App (Just (8,25)-(8,30)) (Var (Just (8,26)-(8,27)) "f") [Var (Just (8,28)-(8,29)) "b"],Lit (Just (8,32)-(8,36)) (LB True)]) Nothing
Var (Just (8,26)-(8,27)) "f"
Lit (Just (8,32)-(8,36)) (LB True)
Var (Just (8,41)-(8,42)) "b"
*)

(* typed spans
(7,11)-(7,37)
(8,11)-(8,38)
(8,26)-(8,27)
(8,32)-(8,36)
(8,41)-(8,42)
*)

(* correct types
'a -> ('a * bool)
'a -> ('a * bool)
'a -> 'a
bool
'a
*)

(* bad types
('a * 'b)
string
string
'a
'a
*)
