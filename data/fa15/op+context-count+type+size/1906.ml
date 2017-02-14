
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = List.mem seen h in let rest' = t in helper (seen', rest') in
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
(7,21)-(7,36)
(7,30)-(7,34)
(7,35)-(7,36)
(7,40)-(7,77)
(8,3)-(8,11)
(8,13)-(8,19)
(8,13)-(8,26)
(8,21)-(8,23)
(8,21)-(8,26)
(8,25)-(8,26)
*)

(* type error slice
(7,9)-(7,77)
(7,21)-(7,29)
(7,21)-(7,36)
(7,57)-(7,63)
(7,57)-(7,77)
(7,65)-(7,70)
(7,65)-(7,77)
(8,13)-(8,19)
(8,13)-(8,26)
(8,21)-(8,23)
(8,21)-(8,26)
*)
