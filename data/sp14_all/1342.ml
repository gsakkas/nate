
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ (sep ^ a) in
      let base = "" in let l = sepConcat sep t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ (sep ^ a) in
      let base = sepConcat sep t in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,17)-(7,19)
EMPTY
EmptyG

(7,23)-(7,73)
EMPTY
EmptyG

(7,50)-(7,73)
let l = t in
List.fold_left f base l
LetG NonRec (fromList [VarG]) (AppG (fromList [EmptyG]))

*)
