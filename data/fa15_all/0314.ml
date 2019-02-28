
let stringOfList f l = "[" ^ ((List.map f l) ^ "]");;


(* fix

let stringOfList f l = "[" ^ ("List.map f l" ^ "]");;

*)

(* changed spans
(2,30)-(2,44)
"List.map f l"
LitG

*)

(* changed exprs
Lit (Just (2,30)-(2,44)) (LS "List.map f l")
*)

(* typed spans
(2,30)-(2,44)
*)

(* correct types
string
*)

(* bad types
'a list
*)
