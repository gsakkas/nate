
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = if t then "" else "a" in
      let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = if t = [] then "A" else "" in
      let l = sl in List.fold_left f base l;;

*)

(* changed spans
(7,20)-(7,21)
t = []
BopG VarG (ListG EmptyG)

(7,27)-(7,29)
"A"
LitG

*)

(* changed exprs
Bop (Just (7,20)-(7,26)) Eq (Var (Just (7,20)-(7,21)) "t") (List (Just (7,24)-(7,26)) [] Nothing)
Lit (Just (7,32)-(7,35)) (LS "A")
*)

(* typed spans
(7,20)-(7,26)
(7,32)-(7,35)
*)

(* correct types
bool
string
*)

(* bad types
string list
string
*)
