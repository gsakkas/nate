
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem h seen) = false then seen @ h in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem h seen) = false then seen @ [h] else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,61)-(7,62)
[h]
ListG VarG

(7,20)-(7,62)
seen
VarG

*)

(* changed exprs
List (Just (7,61)-(7,64)) [Var (Just (7,62)-(7,63)) "h"] Nothing
Var (Just (7,70)-(7,74)) "seen"
*)

(* typed spans
(7,61)-(7,64)
(7,70)-(7,74)
*)

(* correct types
'a list
'a list
*)

(* bad types
'a
unit
*)
