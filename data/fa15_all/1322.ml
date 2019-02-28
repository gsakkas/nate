
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = "" in let l = h ^ (sep :: t) in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = h ^ sep in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,17)-(7,19)
EMPTY
EmptyG

(7,35)-(7,45)
EMPTY
EmptyG

(7,43)-(7,44)
let l = t in
List.fold_left f base l
LetG NonRec (fromList [VarG]) (AppG (fromList [EmptyG]))

*)

(* typed spans
(7,28)-(7,64)
*)

(* typed spans
string
*)

(* typed spans
string list
*)
