
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = match x with | [] -> "none" | hea::tail -> a ^ (sep ^ hea) in
      let base = h in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = match x with | [] -> "none" | hea::tail -> a ^ (sep ^ hea) in
      let base = h in let l = [t] in List.fold_left f base l;;

*)

(* changed spans
(7,30)-(7,31)
[t]
ListG VarG

*)

(* changed exprs
List (Just (7,30)-(7,33)) [Var (Just (7,31)-(7,32)) "t"] Nothing
*)

(* typed spans
(7,30)-(7,33)
*)

(* correct types
string list list
*)

(* bad types
string list
*)
