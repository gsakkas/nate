
let pipe fs =
  let f a x g = a (x g) in
  let base = match fs with | h::t -> f 0 h | [] -> (fun x  -> x) in
  List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x g = a (x g) in
  let base = match fs with | h::t -> f h h | [] -> (fun x  -> x) in
  List.fold_left f base fs;;

*)

(* changed spans
(4,39)-(4,40)
EMPTY
EmptyG

(4,51)-(4,64)
h
VarG

*)
