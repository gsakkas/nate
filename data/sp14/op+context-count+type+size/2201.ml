
let pipe fs =
  let f a x g = a (x g) in
  let base = match fs with | [] -> 0 | h::t -> f (fun x  -> x) h in
  List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x g = a (x g) in
  let base =
    match fs with | [] -> (fun x  -> x * 1) | h::t -> f (fun x  -> x * 1) h in
  List.fold_left f base fs;;

*)

(* changed spans
(4,35)-(4,36)
(4,47)-(4,64)
(4,60)-(4,61)
(4,63)-(4,64)
(5,2)-(5,16)
(5,17)-(5,18)
(5,19)-(5,23)
(5,24)-(5,26)
*)

(* type error slice
(3,2)-(5,26)
(3,8)-(3,23)
(3,10)-(3,23)
(3,12)-(3,23)
(4,13)-(4,64)
(4,13)-(4,64)
(4,35)-(4,36)
(4,47)-(4,48)
(4,47)-(4,64)
(4,49)-(4,62)
(5,2)-(5,16)
(5,2)-(5,26)
(5,17)-(5,18)
*)
