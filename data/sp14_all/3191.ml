
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h in let base = t in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h in let base = "" in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,34)-(6,35)
""
LitG

*)

(* changed exprs
Lit (Just (6,34)-(6,36)) (LS "")
*)

(* typed spans
(6,34)-(6,36)
*)

(* correct types
string
*)

(* bad types
'a list
*)
