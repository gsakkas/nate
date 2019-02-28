
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then [] else seen @ h in
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
(7,44)-(7,46)
seen
VarG

(7,59)-(7,60)
[h]
ListG VarG

*)

(* changed exprs
Var (Just (7,44)-(7,48)) "seen"
List (Just (7,61)-(7,64)) [Var (Just (7,62)-(7,63)) "h"] Nothing
*)

(* typed spans
(7,44)-(7,48)
(7,61)-(7,64)
*)

(* correct types
'a list
'a list
*)

(* bad types
'a list
'a
*)
