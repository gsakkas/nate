
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = "" in
      let l = [(fun x  -> x ^ sep)] in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = "" in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(8,14)-(8,35)
sl
VarG

*)

(* changed exprs
Var (Just (7,31)-(7,33)) "sl"
*)

(* typed spans
(7,31)-(7,33)
*)

(* correct types
string list
*)

(* bad types
string -> string list
*)
