
let rec wwhile (f,b) = match f b with | (h,t) -> if t = true then t;;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' = false then b' else wwhile (f, b');;

*)

(* changed spans
(2,23)-(2,67)
match f b with
| (b' , c') -> if c' = false
               then b'
               else wwhile (f , b')
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,IteG EmptyG EmptyG EmptyG)])

(2,52)-(2,53)
c'
VarG

*)

(* typed spans
(3,2)-(3,71)
(3,33)-(3,35)
*)

(* typed spans
'a
bool
*)

(* typed spans
unit
bool
*)
