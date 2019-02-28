
let rec append_new xs1 xs2 =
  match xs1 with | [] -> xs2 | head::tail -> head :: (append_new tail xs2);;

let rec listReverse l =
  match l with | [] -> [] | head::tail -> append_new listReverse tail [head];;


(* fix

let rec append_new xs1 xs2 =
  match xs1 with | [] -> xs2 | head::tail -> head :: (append_new tail xs2);;

let rec listReverse l =
  match l with
  | [] -> []
  | head::tail -> append_new (listReverse tail) [head];;

*)

(* changed spans
(6,42)-(6,76)
append_new (listReverse tail)
           [head]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
App (Just (8,18)-(8,54)) (Var (Just (8,18)-(8,28)) "append_new") [App (Just (8,29)-(8,47)) (Var (Just (8,30)-(8,41)) "listReverse") [Var (Just (8,42)-(8,46)) "tail"],List (Just (8,48)-(8,54)) [Var (Just (8,49)-(8,53)) "head"] Nothing]
*)

(* typed spans
(8,18)-(8,54)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
