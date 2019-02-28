
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a @ sep in
      let base = h in let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ sep in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,20)-(6,21)
(^)
VarG

(7,30)-(7,32)
t
VarG

*)

(* changed exprs
Var (Just (6,20)-(6,21)) "^"
Var (Just (7,30)-(7,31)) "t"
*)

(* typed spans
(6,20)-(6,21)
(7,30)-(7,31)
*)

(* correct types
string -> string -> string
string list
*)

(* bad types
'a list -> 'a list -> 'a list
'a list list
*)
