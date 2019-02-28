
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = sep ^ x in
      let base = "" in let l = sl in List.fold_left f base;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = sep ^ a in
      let base = "" in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(6,24)-(6,25)
a
VarG

(7,37)-(7,58)
List.fold_left f base l
AppG (fromList [VarG])

*)

(* changed exprs
Var (Just (6,24)-(6,25)) "a"
App (Just (7,37)-(7,60)) (Var (Just (7,37)-(7,51)) "List.fold_left") [Var (Just (7,52)-(7,53)) "f",Var (Just (7,54)-(7,58)) "base",Var (Just (7,59)-(7,60)) "l"]
*)

(* typed spans
(6,24)-(6,25)
(7,37)-(7,60)
*)

(* correct types
string
string
*)

(* bad types
string
string list -> string
*)
