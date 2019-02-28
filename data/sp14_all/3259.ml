
let t x = x + 1;;

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if x = "a" then x :: a in
      let base = sep in let l = t in List.fold_left f base l;;


(* fix

let t x = x + 1;;

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = sep in let l = t in List.fold_left f base l;;

*)

(* changed spans
(8,18)-(8,40)
x ^ a
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (8,18)-(8,23)) (Var (Just (8,20)-(8,21)) "^") [Var (Just (8,18)-(8,19)) "x",Var (Just (8,22)-(8,23)) "a"]
*)

(* typed spans
(8,18)-(8,23)
*)

(* correct types
string
*)

(* bad types
unit
*)
