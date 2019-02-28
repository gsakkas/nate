
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t -> let seen' = seen :: h in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t -> let seen' = seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(6,26)-(6,35)
seen
VarG

*)

(* changed exprs
Var (Just (6,26)-(6,30)) "seen"
*)

(* typed spans
(6,26)-(6,30)
*)

(* correct types
'a list
*)

(* bad types
'a list list
*)
