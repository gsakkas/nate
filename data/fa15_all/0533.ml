
let rec wwhile (f,b) =
  let (b',c') = b in match c' with | true  -> wwhile (f, b') | false  -> b';;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | true  -> wwhile (f, b') | false  -> b';;

*)

(* changed spans
(3,16)-(3,17)
f b
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (3,16)-(3,19)) (Var (Just (3,16)-(3,17)) "f") [Var (Just (3,18)-(3,19)) "b"]
*)

(* typed spans
(3,16)-(3,19)
*)

(* correct types
('a * bool)
*)

(* bad types
('a * bool)
*)
