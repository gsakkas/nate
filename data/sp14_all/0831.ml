
let rec wwhile (f,b) =
  let rec acc result =
    let res = f result in
    match res with | (b',c') -> if c' then acc b' else b' in
  acc b;;

let fixpoint (f,b) = wwhile (fun xx  -> ((xx, ((f xx) = xx)), b));;


(* fix

let rec wwhile (f,b) =
  let rec acc result =
    let res = f result in
    match res with | (b',c') -> if c' then acc b' else b' in
  acc b;;

let fixpoint (f,b) = wwhile ((fun xx  -> (xx, ((f xx) = xx))), b);;

*)

(* changed spans
(8,28)-(8,65)
EMPTY
EmptyG

(8,41)-(8,60)
fun xx -> (xx , f xx = xx)
LamG (TupleG (fromList [EmptyG]))

*)
