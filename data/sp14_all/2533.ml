
let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile ((let helper x = ((f x), (x != (f x))) in helper b), b);;


(* fix

let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile ((let helper x = ((f x), (x != (f x))) in helper), b);;

*)

(* changed spans
(8,51)-(8,59)
helper
VarG

(8,51)-(8,59)
b
VarG

*)

(* changed exprs
Var (Just (8,51)-(8,57)) "helper"
Var (Just (8,60)-(8,61)) "b"
*)

(* typed spans
(8,51)-(8,57)
(8,60)-(8,61)
*)

(* correct types
'a -> ('a * bool)
'a
*)

(* bad types
('a * bool)
('a * bool)
*)
