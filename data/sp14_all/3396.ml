
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ (" " x)) in
      let base = [] in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ (" " ^ x)) in
      let base = "" in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,29)-(6,36)
" " ^ x
AppG (fromList [VarG,LitG])

(7,17)-(7,19)
""
LitG

*)

(* changed exprs
App (Just (6,29)-(6,38)) (Var (Just (6,34)-(6,35)) "^") [Lit (Just (6,30)-(6,33)) (LS " "),Var (Just (6,36)-(6,37)) "x"]
Lit (Just (7,17)-(7,19)) (LS "")
*)

(* typed spans
(6,29)-(6,38)
(7,17)-(7,19)
*)

(* correct types
string
string
*)

(* bad types
string
'a list
*)
