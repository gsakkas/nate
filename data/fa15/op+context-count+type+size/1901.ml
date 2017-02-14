
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem seen h then seen else [h] @ [seen] in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then seen else seen @ [h] in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,32)-(7,36)
(7,54)-(7,57)
(7,54)-(7,66)
(7,60)-(7,66)
(7,61)-(7,65)
*)

(* type error slice
(7,23)-(7,31)
(7,23)-(7,38)
(7,32)-(7,36)
(7,37)-(7,38)
(7,54)-(7,57)
(7,54)-(7,57)
(7,54)-(7,66)
(7,55)-(7,56)
(7,58)-(7,59)
(7,60)-(7,66)
(7,60)-(7,66)
(7,61)-(7,65)
*)
