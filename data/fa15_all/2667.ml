
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let helper b = let fb = f b in if fb = b then (true, fb) else (false, fb) in
  wwhile ((helper b), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let helper b = let fb = f b in if fb = b then (true, fb) else (false, fb) in
  wwhile (helper, b);;

*)

(* changed spans
(6,10)-(6,20)
helper
VarG

(6,10)-(6,20)
b
VarG

*)

(* changed exprs
Var (Just (6,10)-(6,16)) "helper"
Var (Just (6,18)-(6,19)) "b"
*)

(* typed spans
(6,10)-(6,16)
(6,18)-(6,19)
*)

(* correct types
bool -> (bool * bool)
bool
*)

(* bad types
(bool * 'a)
(bool * 'a)
*)
