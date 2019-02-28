
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem h seen) = true then seen else seen @ h in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem h seen) = true then seen else seen @ [h] in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,70)-(7,71)
[h]
ListG VarG

*)

(* changed exprs
List (Just (7,70)-(7,73)) [Var (Just (7,71)-(7,72)) "h"] Nothing
*)

(* typed spans
(7,70)-(7,73)
*)

(* correct types
'a list
*)

(* bad types
'a
*)
