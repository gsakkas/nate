
let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile ((let g x = let xx = f x in (xx, (xx != b)) in g b), b);;


(* fix

let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile ((let g x = let xx = f x in (b, (xx != b)) in g), b);;

*)

(* changed spans
(8,38)-(8,40)
b
VarG

(8,56)-(8,59)
g
VarG

(8,56)-(8,59)
b
VarG

*)

(* changed exprs
Var (Just (8,38)-(8,39)) "b"
Var (Just (8,55)-(8,56)) "g"
Var (Just (8,59)-(8,60)) "b"
*)

(* typed spans
(8,38)-(8,39)
(8,55)-(8,56)
(8,59)-(8,60)
*)

(* correct types
'a
'a -> ('a * bool)
'a
*)

(* bad types
'a
('a * bool)
('a * bool)
*)
