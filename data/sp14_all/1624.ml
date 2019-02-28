
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem h seen) = false then h @ [seen] in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem h seen) = false then [h] @ seen else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,58)-(7,64)
h
VarG

(7,20)-(7,64)
seen
VarG

*)

(* changed exprs
Var (Just (7,55)-(7,56)) "h"
Var (Just (7,70)-(7,74)) "seen"
*)

(* typed spans
(7,55)-(7,56)
(7,70)-(7,74)
*)

(* correct types
'a
'a list
*)

(* bad types
'a list list list
unit
*)
