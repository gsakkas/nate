
let stringOfList f l = "[" ^ ((List.map f l) ^ "]");;


(* fix

let stringOfList f l = "[" ^ ("List.map f l" ^ "]");;

*)

(* changed spans
(2,30)-(2,44)
EMPTY
EmptyG

(2,31)-(2,39)
EMPTY
EmptyG

(2,40)-(2,41)
EMPTY
EmptyG

(2,42)-(2,43)
"List.map f l"
LitG

*)
