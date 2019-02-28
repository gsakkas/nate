
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = if t = sep then sep else h in
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

*)

(* changed exprs
List (Just (7,24)-(7,26)) [] Nothing
*)

(* typed spans
(7,24)-(7,26)
*)

(* correct types
string list
*)

(* bad types
string list
*)
