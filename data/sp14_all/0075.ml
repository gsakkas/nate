
let pipe fs = let f a x c = c x in let base b = b in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x c = x (let fn d = d in fn) in
  let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(2,28)-(2,29)
EMPTY
EmptyG

(2,35)-(2,77)
let fn = fun d -> d in fn
LetG NonRec (fromList [LamG EmptyG]) VarG

*)
