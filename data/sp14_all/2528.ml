
let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile ((let helper x = ((f x), ((f x) = (f b))) in helper b), b);;


(* fix

let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile ((let helper x = ((f x), ((f x) = (f b))) in helper), b);;

*)

(* changed spans
(8,54)-(8,62)
helper
VarG

(8,54)-(8,62)
b
VarG

*)

(* changed exprs
Var (Just (8,54)-(8,60)) "helper"
Var (Just (8,63)-(8,64)) "b"
*)

(* typed spans
(8,54)-(8,60)
(8,63)-(8,64)
*)

(* correct types
'a -> ('a * bool)
'a
*)

(* bad types
('a * bool)
('a * bool)
*)
