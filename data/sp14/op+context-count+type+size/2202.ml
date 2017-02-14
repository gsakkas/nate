
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
(7,32)-(7,35)
(7,61)-(7,62)
*)

(* type error slice
(3,2)-(7,62)
(3,2)-(7,62)
(7,17)-(7,18)
(7,17)-(7,20)
(7,19)-(7,20)
(7,32)-(7,33)
(7,32)-(7,35)
(7,34)-(7,35)
*)
