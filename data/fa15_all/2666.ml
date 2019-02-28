
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let helper b = (((f b) = b), (f b)) in wwhile ((helper b), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let helper b = let fb = f b in if fb = b then (true, fb) else (false, fb) in
  wwhile (helper, b);;

*)

(* changed spans
(5,17)-(5,37)
let fb = f b in
if fb = b
then (true , fb)
else (false , fb)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (IteG EmptyG EmptyG EmptyG)

(5,49)-(5,59)
helper
VarG

(5,49)-(5,59)
b
VarG

*)

(* changed exprs
Let (Just (5,17)-(5,75)) NonRec [(VarPat (Just (5,21)-(5,23)) "fb",App (Just (5,26)-(5,29)) (Var (Just (5,26)-(5,27)) "f") [Var (Just (5,28)-(5,29)) "b"])] (Ite (Just (5,33)-(5,75)) (Bop (Just (5,36)-(5,42)) Eq (Var (Just (5,36)-(5,38)) "fb") (Var (Just (5,41)-(5,42)) "b")) (Tuple (Just (5,48)-(5,58)) [Lit (Just (5,49)-(5,53)) (LB True),Var (Just (5,55)-(5,57)) "fb"]) (Tuple (Just (5,64)-(5,75)) [Lit (Just (5,65)-(5,70)) (LB False),Var (Just (5,72)-(5,74)) "fb"]))
Var (Just (6,10)-(6,16)) "helper"
Var (Just (6,18)-(6,19)) "b"
*)

(* typed spans
(5,17)-(5,75)
(6,10)-(6,16)
(6,18)-(6,19)
*)

(* correct types
(bool * bool)
bool -> (bool * bool)
bool
*)

(* bad types
(bool * 'a)
(bool * 'a)
(bool * 'a)
*)
