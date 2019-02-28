
let rec wwhile (f,b) =
  let f' = f b in
  match f' with | (b',false ) -> b' | (b',true ) -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((let whilesFun f' b' = let fOfB = f' b' in (b', (fOfB = b')) in
      ((whilesFun f), b)), b);;


(* fix

let rec wwhile (f,b) =
  let f' = f b in
  match f' with | (b',false ) -> b' | (b',true ) -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((let whilesFun f' b' = let fOfB = f' b' in (b', (fOfB = b')) in
      whilesFun f), b);;

*)

(* changed spans
(9,6)-(9,24)
whilesFun f
AppG (fromList [VarG])

(9,6)-(9,24)
b
VarG

*)

(* changed exprs
App (Just (9,6)-(9,17)) (Var (Just (9,6)-(9,15)) "whilesFun") [Var (Just (9,16)-(9,17)) "f"]
Var (Just (9,20)-(9,21)) "b"
*)

(* typed spans
(9,6)-(9,17)
(9,20)-(9,21)
*)

(* correct types
'a -> ('a * bool)
'a
*)

(* bad types
('a -> ('a * bool) * 'b)
('a -> ('a * bool) * 'b)
*)
