
let rec wwhile (f,b) = match f b with | (_,t) -> if t = true then 5;;


(* fix

let rec wwhile (f,b) = match f b with | (h,t) -> if t = true then h;;

*)

(* changed spans
(2,23)-(2,67)
match f b with
| (h , t) -> if t = true
             then h
             else ()
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,IteG EmptyG EmptyG EmptyG)])

(2,66)-(2,67)
h
VarG

*)

(* typed spans
(2,23)-(2,67)
(2,66)-(2,67)
*)

(* typed spans
unit
unit
*)

(* typed spans
unit
int
*)
