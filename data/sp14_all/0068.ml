
let pipe fs =
  let f a x y z = z (fun r  -> y) in
  let base b = b in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = let an = a in x in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,33)
EMPTY
EmptyG

(3,14)-(3,33)
EMPTY
EmptyG

(3,18)-(3,19)
EMPTY
EmptyG

(3,18)-(3,33)
EMPTY
EmptyG

(3,20)-(3,33)
EMPTY
EmptyG

(3,31)-(3,32)
let an = a in x
LetG NonRec (fromList [VarG]) VarG

(4,2)-(4,44)
x
VarG

*)
