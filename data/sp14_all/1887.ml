
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (((=) f), b);;


(* fix

let g h x = let xx = h x in (xx, (xx = (h x)));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((g f), b);;

*)

(* changed spans
(2,16)-(2,77)
fun h ->
  fun x ->
    (let xx = h x in
     (xx , xx = h x))
LamG (LamG EmptyG)

(4,30)-(4,33)
g
VarG

*)
