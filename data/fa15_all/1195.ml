
let rec wwhile (f,b) = match f b with | (h,t) -> if t = false then h else f h;;


(* fix

let rec wwhile (f,b) = match f b with | (h,t) -> if t = false then h;;

*)

(* changed spans
(2,74)-(2,75)
EMPTY
EmptyG

(2,74)-(2,77)
EMPTY
EmptyG

(2,76)-(2,77)
()
ConAppG Nothing (Just (TApp "unit" []))

*)
