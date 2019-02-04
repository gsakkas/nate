
let pipe fs =
  let f a x y z = z y in let base b = b in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = let an = a in x in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,21)
EMPTY
EmptyG

(3,14)-(3,21)
EMPTY
EmptyG

(3,18)-(3,19)
EMPTY
EmptyG

(3,18)-(3,21)
EMPTY
EmptyG

(3,20)-(3,21)
let an = a in x
LetG NonRec (fromList [VarG]) VarG

(3,25)-(3,67)
x
VarG

*)
