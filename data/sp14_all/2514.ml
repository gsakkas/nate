
let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) = wwhile (let xx = (b * b) * b in ((xx, (xx < 100)), b));;


(* fix

let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile ((let g x = let xx = f x in (xx, (xx != b)) in g), b);;

*)

(* changed spans
(7,28)-(7,75)
EMPTY
EmptyG

(7,38)-(7,45)
EMPTY
EmptyG

(7,38)-(7,49)
EMPTY
EmptyG

(7,39)-(7,40)
EMPTY
EmptyG

(7,43)-(7,44)
EMPTY
EmptyG

(7,48)-(7,49)
EMPTY
EmptyG

(7,54)-(7,70)
let g =
  fun x ->
    (let xx = f x in
     (xx , xx <> b)) in
g
LetG NonRec (fromList [LamG EmptyG]) VarG

(7,59)-(7,69)
xx <> b
BopG VarG VarG

(7,65)-(7,68)
EMPTY
EmptyG

*)
