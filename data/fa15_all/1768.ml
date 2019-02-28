
let helper f b = if (f b) = b then (true, b) else (false, (f b));;

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((helper f b), b);;


(* fix

let helper f b = if (f b) = b then (true, b) else (false, (f b));;

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((helper f), b);;

*)

(* changed spans
(7,29)-(7,41)
helper f
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (7,29)-(7,39)) (Var (Just (7,30)-(7,36)) "helper") [Var (Just (7,37)-(7,38)) "f"]
*)

(* typed spans
(7,29)-(7,39)
*)

(* correct types
bool -> (bool * bool)
*)

(* bad types
(bool * 'a)
*)
