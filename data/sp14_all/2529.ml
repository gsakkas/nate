
let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile ((let helper x = ((f b), (b = (f b))) in helper b), b);;


(* fix

let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile ((let helper x = ((f b), (b = (f b))) in helper), b);;

*)

(* changed spans
(8,50)-(8,58)
helper
VarG

(8,50)-(8,58)
b
VarG

*)

(* changed exprs
Var (Just (8,50)-(8,56)) "helper"
Var (Just (8,59)-(8,60)) "b"
*)

(* typed spans
(8,50)-(8,56)
(8,59)-(8,60)
*)

(* correct types
'a -> ('a * bool)
'a
*)

(* bad types
('a * bool)
('a * bool)
*)
