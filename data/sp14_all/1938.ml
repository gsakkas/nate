
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let y x = ((f b), (b = (f b))) in wwhile ((y b), b);;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let y x = ((f b), (b = (f b))) in wwhile (y, b);;

*)

(* changed spans
(7,63)-(7,68)
EMPTY
EmptyG

(7,70)-(7,71)
EMPTY
EmptyG

*)
