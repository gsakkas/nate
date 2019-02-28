
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
(7,44)-(7,48)
seen
VarG

(7,58)-(7,59)
seen
VarG

*)

(* changed exprs
Var (Just (7,44)-(7,48)) "seen"
Var (Just (7,54)-(7,58)) "seen"
*)

(* typed spans
(7,44)-(7,48)
(7,54)-(7,58)
*)

(* correct types
'a list
'a list
*)

(* bad types
'a list
'a list list list -> 'a list list list -> 'a list list list
*)
