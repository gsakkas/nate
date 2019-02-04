
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (let g x = let calcfx = f x in (calcfx, (calcfx = x)) in ((g b), b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (let g x = let calcfx = f x in (calcfx, (calcfx = x)) in (g, b));;

*)

(* changed spans
(5,67)-(5,72)
EMPTY
EmptyG

(5,74)-(5,75)
EMPTY
EmptyG

*)
