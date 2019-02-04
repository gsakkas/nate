
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
EMPTY
EmptyG

(8,15)-(8,34)
EMPTY
EmptyG

(8,26)-(8,27)
EMPTY
EmptyG

(8,26)-(8,33)
EMPTY
EmptyG

(8,28)-(8,29)
EMPTY
EmptyG

(8,30)-(8,33)
sl
VarG

*)
