
let rec listReverse l =
  if List.length > 0 then (listReverse List.tl l) @ [List.hd l] else [];;


(* fix

let rec listReverse l = if (List.length l) > 0 then [List.hd l] else [];;

*)

(* changed spans
(3,5)-(3,16)
List.length l
AppG (fromList [VarG])

(3,26)-(3,63)
0
LitG

*)

(* changed exprs
App (Just (2,27)-(2,42)) (Var (Just (2,28)-(2,39)) "List.length") [Var (Just (2,40)-(2,41)) "l"]
Lit (Just (2,45)-(2,46)) (LI 0)
*)

(* typed spans
(2,27)-(2,42)
(2,45)-(2,46)
*)

(* correct types
int
int
*)

(* bad types
'a list -> int
'a list
*)
