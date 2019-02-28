
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = if (List.length t) <> 0 then t else [] in
      let l = if (List.length t) <> 0 then "" else sep in
      List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = if (List.length t) <> 0 then "" else sep in
      let l = if (List.length t) <> 0 then t else [] in
      List.fold_left f base l;;

*)

(* changed spans
(7,53)-(7,55)
""
LitG

(8,6)-(9,29)
sep
VarG

(8,51)-(8,54)
t
VarG

(9,6)-(9,29)
[]
ListG EmptyG

*)

(* changed exprs
Lit (Just (7,46)-(7,48)) (LS "")
Var (Just (7,54)-(7,57)) "sep"
Var (Just (8,43)-(8,44)) "t"
List (Just (8,50)-(8,52)) [] Nothing
*)

(* typed spans
(7,46)-(7,48)
(7,54)-(7,57)
(8,43)-(8,44)
(8,50)-(8,52)
*)

(* correct types
string
string
string list
string list
*)

(* bad types
'a list
string
string
string
*)
