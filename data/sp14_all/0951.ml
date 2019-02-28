
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x c = a ^ (sep ^ x) in
      let base = "" in let l = "" in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = "" in let l = [] in List.fold_left f base l;;

*)

(* changed spans
(6,16)-(6,33)
a ^ (sep ^ x)
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(7,31)-(7,33)
[]
ListG EmptyG

*)

(* changed exprs
App (Just (6,18)-(6,31)) (Var (Just (6,20)-(6,21)) "^") [Var (Just (6,18)-(6,19)) "a",App (Just (6,22)-(6,31)) (Var (Just (6,27)-(6,28)) "^") [Var (Just (6,23)-(6,26)) "sep",Var (Just (6,29)-(6,30)) "x"]]
List (Just (7,31)-(7,33)) [] Nothing
*)

(* typed spans
(6,18)-(6,31)
(7,31)-(7,33)
*)

(* correct types
string
string list
*)

(* bad types
'a -> string
string
*)
