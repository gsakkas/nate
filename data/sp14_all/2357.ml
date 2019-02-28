
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = "" in
      let base = "" in let l = "" in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = sepConcat sep t in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,20)
x ^ a
AppG (fromList [VarG])

(7,17)-(7,19)
sepConcat sep t
AppG (fromList [VarG])

(7,31)-(7,33)
t
VarG

*)

(* changed exprs
App (Just (6,18)-(6,23)) (Var (Just (6,20)-(6,21)) "^") [Var (Just (6,18)-(6,19)) "x",Var (Just (6,22)-(6,23)) "a"]
App (Just (7,17)-(7,32)) (Var (Just (7,17)-(7,26)) "sepConcat") [Var (Just (7,27)-(7,30)) "sep",Var (Just (7,31)-(7,32)) "t"]
Var (Just (7,44)-(7,45)) "t"
*)

(* typed spans
(6,18)-(6,23)
(7,17)-(7,32)
(7,44)-(7,45)
*)

(* correct types
string
string
string list
*)

(* bad types
string
string
string
*)
