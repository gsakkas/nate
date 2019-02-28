
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in let base = h in let l = t in List.fold_left f base;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,22)-(6,23)
sep ^ x
AppG (fromList [VarG])

(6,56)-(6,77)
List.fold_left f base l
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (6,22)-(6,31)) (Var (Just (6,27)-(6,28)) "^") [Var (Just (6,23)-(6,26)) "sep",Var (Just (6,29)-(6,30)) "x"]
App (Just (7,35)-(7,58)) (Var (Just (7,35)-(7,49)) "List.fold_left") [Var (Just (7,50)-(7,51)) "f",Var (Just (7,52)-(7,56)) "base",Var (Just (7,57)-(7,58)) "l"]
*)

(* typed spans
(6,22)-(6,31)
(7,35)-(7,58)
*)

(* correct types
string
string
*)

(* bad types
string
string list -> string
*)
