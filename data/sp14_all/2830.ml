
let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f, b);;


(* fix

let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

*)

(* changed spans
(4,9)-(4,15)
f b
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (4,9)-(4,14)) (Var (Just (4,10)-(4,11)) "f") [Var (Just (4,12)-(4,13)) "b"]
*)

(* typed spans
(4,9)-(4,14)
*)

(* correct types
('a * bool)
*)

(* bad types
('a -> ('a * bool) * 'b)
*)
