
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x =
    let isFPoint s = (f s) = s in
    let rec go r = if isFPoint r then r else go (f r) in
    ((go x), (isFPoint x)) in
  wwhile ((gs b), b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x =
    let isFPoint s = (f s) = s in
    let rec go r = if isFPoint r then r else go (f r) in
    ((go x), (isFPoint x)) in
  wwhile (gs, b);;

*)

(* changed spans
(11,10)-(11,16)
EMPTY
EmptyG

(11,18)-(11,19)
EMPTY
EmptyG

*)
