
let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile ((fun b  -> (f, ((f b) != b))), b);;


(* fix

let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile ((fun b  -> ((f b), ((f b) != b))), b);;

*)

(* changed spans
(6,41)-(6,42)
f b
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (6,41)-(6,46)) (Var (Just (6,42)-(6,43)) "f") [Var (Just (6,44)-(6,45)) "b"]
*)

(* typed spans
(6,41)-(6,46)
*)

(* correct types
'a
*)

(* bad types
'a -> 'a
*)
