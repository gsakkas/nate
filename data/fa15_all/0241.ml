
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h t then h else h :: t in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,41)-(7,42)
seen
VarG

(7,48)-(7,54)
seen
VarG

(7,53)-(7,54)
seen
VarG

*)

(* changed exprs
Var (Just (7,34)-(7,38)) "seen"
Var (Just (7,44)-(7,48)) "seen"
Var (Just (7,59)-(7,63)) "seen"
*)

(* typed spans
(7,34)-(7,38)
(7,44)-(7,48)
(7,59)-(7,63)
*)

(* correct types
'a list
'a list
'a list
*)

(* bad types
'a
'a list
'a list
*)
