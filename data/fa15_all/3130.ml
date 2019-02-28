
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then seen else h @ seen in
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
(7,54)-(7,62)
h :: seen
ConAppG (Just (TupleG (fromList [VarG])))

*)

(* changed exprs
ConApp (Just (7,54)-(7,63)) "::" (Just (Tuple (Just (7,54)-(7,63)) [Var (Just (7,54)-(7,55)) "h",Var (Just (7,59)-(7,63)) "seen"])) Nothing
*)

(* typed spans
(7,54)-(7,63)
*)

(* correct types
'a list
*)

(* bad types
'a list list
*)
