
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = if t = sep then sep else h ^ sep in
      let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = if t = [] then sep else h in
      let l = sl in List.fold_left f base l;;

*)

(* changed spans
(7,24)-(7,27)
[]
ListG EmptyG

(7,42)-(7,49)
h
VarG

*)

(* changed exprs
List (Just (7,24)-(7,26)) [] Nothing
Var (Just (7,41)-(7,42)) "h"
*)

(* typed spans
(7,24)-(7,26)
(7,41)-(7,42)
*)

(* correct types
string list
string
*)

(* bad types
string list
string list
*)
