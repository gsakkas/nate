
let stringOfList f l =
  match l with
  | [] -> ""
  | h::t ->
      let g a x = a ^ (";" ^ x) in
      let base = f h in let x = f t in List.fold_left g base x;;


(* fix

let stringOfList f l =
  match l with
  | [] -> ""
  | h::t ->
      let g a x = a ^ (";" ^ x) in
      let base = f h in let x = t in List.fold_left g base l;;

*)

(* changed spans
(7,32)-(7,33)
EMPTY
EmptyG

(7,32)-(7,35)
EMPTY
EmptyG

(7,61)-(7,62)
l
VarG

*)
