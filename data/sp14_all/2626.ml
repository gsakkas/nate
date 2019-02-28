
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = (x ^ sep) ^ a in
      let base = "" in let l = "" in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = (x ^ sep) ^ a in
      let base = "" in let l = [] in List.fold_left f base l;;

*)

(* changed spans
(7,31)-(7,33)
[]
ListG EmptyG

*)

(* changed exprs
List (Just (7,31)-(7,33)) [] Nothing
*)

(* typed spans
(7,31)-(7,33)
*)

(* correct types
string list
*)

(* bad types
string
*)
