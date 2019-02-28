
let rec wwhile (f,b) =
  let f' = f b in
  match f' with | (b',false ) -> b' | (b',true ) -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((let whilesFun f' b' = let fOfB = f' b' in (b', (b' = fOfB)) in
      whilesFun (f, b)), b);;


(* fix

let rec wwhile (f,b) =
  let f' = f b in
  match f' with | (b',false ) -> b' | (b',true ) -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((let whilesFun f' b' = let fOfB = f' b' in (b', (b' = fOfB)) in
      whilesFun f), b);;

*)

(* changed spans
(9,16)-(9,22)
f
VarG

(9,16)-(9,22)
b
VarG

*)

(* changed exprs
Var (Just (9,16)-(9,17)) "f"
Var (Just (9,20)-(9,21)) "b"
*)

(* typed spans
(9,16)-(9,17)
(9,20)-(9,21)
*)

(* correct types
'a -> 'a
'a
*)

(* bad types
('a * 'b)
('a * 'b)
*)
