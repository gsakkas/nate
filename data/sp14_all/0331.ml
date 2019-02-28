
let rec wwhile (f,b) =
  match f b with | (i,true ) -> wwhile (f, i) | (i,false ) -> i;;

let fixpoint (f,b) =
  let helper x = if b = (f b) then (b, false) else (b, true) in
  wwhile ((helper b), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (i,true ) -> wwhile (f, i) | (i,false ) -> i;;

let fixpoint (f,b) =
  let helper x = if b = (f b) then (b, false) else (b, true) in
  wwhile (helper, b);;

*)

(* changed spans
(7,10)-(7,20)
helper
VarG

(7,10)-(7,20)
b
VarG

*)

(* changed exprs
Var (Just (7,10)-(7,16)) "helper"
Var (Just (7,18)-(7,19)) "b"
*)

(* typed spans
(7,10)-(7,16)
(7,18)-(7,19)
*)

(* correct types
'a -> ('a * bool)
'a
*)

(* bad types
('a * bool)
('a * bool)
*)
