
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t -> let seen' = h :: seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,20)-(7,53)
h :: seen
ConAppG (Just (TupleG (fromList [VarG])))

*)

(* changed exprs
ConApp (Just (6,26)-(6,35)) "::" (Just (Tuple (Just (6,26)-(6,35)) [Var (Just (6,26)-(6,27)) "h",Var (Just (6,31)-(6,35)) "seen"])) Nothing
*)

(* typed spans
(6,26)-(6,35)
*)

(* correct types
'a list
*)

(* bad types
unit
*)
