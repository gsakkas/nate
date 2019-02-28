
let rec listReverse l =
  match l with
  | [] -> []
  | head::[] -> [head]
  | head::tail -> [listReverse [tail]; head];;


(* fix

let rec listReverse l =
  match l with
  | [] -> []
  | head::[] -> [head]
  | head::tail -> (listReverse tail) @ [head];;

*)

(* changed spans
(6,18)-(6,44)
listReverse tail @ [head]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
App (Just (6,18)-(6,45)) (Var (Just (6,37)-(6,38)) "@") [App (Just (6,18)-(6,36)) (Var (Just (6,19)-(6,30)) "listReverse") [Var (Just (6,31)-(6,35)) "tail"],List (Just (6,39)-(6,45)) [Var (Just (6,40)-(6,44)) "head"] Nothing]
*)

(* typed spans
(6,18)-(6,45)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
