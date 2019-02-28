
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((f, true), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((if (f b) = b
      then fun b''  -> ((f b), false)
      else (fun b''  -> ((f b), true))), b);;

*)

(* changed spans
(4,29)-(4,38)
if f b = b
then (fun b'' ->
        (f b , false))
else (fun b'' -> (f b , true))
IteG (BopG EmptyG EmptyG) (LamG EmptyG) (LamG EmptyG)

*)

(* changed exprs
Ite (Just (6,5)-(8,39)) (Bop (Just (6,9)-(6,18)) Eq (App (Just (6,9)-(6,14)) (Var (Just (6,10)-(6,11)) "f") [Var (Just (6,12)-(6,13)) "b"]) (Var (Just (6,17)-(6,18)) "b")) (Lam (Just (7,11)-(7,37)) (VarPat (Just (7,15)-(7,18)) "b''") (Tuple (Just (7,23)-(7,37)) [App (Just (7,24)-(7,29)) (Var (Just (7,25)-(7,26)) "f") [Var (Just (7,27)-(7,28)) "b"],Lit (Just (7,31)-(7,36)) (LB False)]) Nothing) (Lam (Just (8,11)-(8,38)) (VarPat (Just (8,16)-(8,19)) "b''") (Tuple (Just (8,24)-(8,37)) [App (Just (8,25)-(8,30)) (Var (Just (8,26)-(8,27)) "f") [Var (Just (8,28)-(8,29)) "b"],Lit (Just (8,32)-(8,36)) (LB True)]) Nothing)
*)

(* typed spans
(6,5)-(8,39)
*)

(* correct types
'a -> ('a * bool)
*)

(* bad types
('a * bool)
*)
