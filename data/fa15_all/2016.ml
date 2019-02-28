
let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | true  -> wwhile (f, b');;

let fixpoint (f,b) =
  let f' x = if (f x) = b then f x else f (x + 1) in wwhile (f', b);;


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

(6,31)-(6,34)
EMPTY
EmptyG

(6,40)-(6,41)
g
VarG

(6,53)-(6,59)
g
VarG

*)

(* typed spans
(2,21)-(2,76)
(2,60)-(2,61)
(2,73)-(2,74)
*)

(* typed spans
int
int -> int
int -> int
*)

(* typed spans
int
int -> (int * bool)
(int -> (int * bool) * int) -> int
*)
