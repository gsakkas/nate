
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x acc x = x ^ acc in
      let base = "" in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = "" in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,16)-(6,31)
a ^ x
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (6,18)-(6,23)) (Var (Just (6,20)-(6,21)) "^") [Var (Just (6,18)-(6,19)) "a",Var (Just (6,22)-(6,23)) "x"]
*)

(* typed spans
(6,18)-(6,23)
*)

(* correct types
string
*)

(* bad types
string -> string -> string
*)
