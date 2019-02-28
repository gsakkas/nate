
let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | true  -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((let g x = if (f x) = b then f x else f (x + 1) in g 0), b);;


(* fix

let fixpoint (f,b) = let rec g x = if (f x) = b then x else g (x + 1) in g 0;;

*)

(* changed spans
(3,2)-(3,77)
let rec g =
  fun x ->
    if f x = b
    then x
    else g (x + 1) in
g 0
LetG Rec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(6,39)-(6,42)
EMPTY
EmptyG

(6,48)-(6,49)
g
VarG

(6,67)-(6,68)
EMPTY
EmptyG

*)

(* typed spans
(2,21)-(2,76)
(2,60)-(2,61)
*)

(* typed spans
int
int -> int
*)

(* typed spans
'a
int -> 'a -> ('a * bool)
*)
