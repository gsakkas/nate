
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = List.mem h seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then h :: seen else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,20)-(7,35)
if List.mem h seen
then h :: seen
else seen
IteG (AppG (fromList [EmptyG])) (ConAppG (Just EmptyG)) VarG

*)

(* changed exprs
Ite (Just (7,20)-(7,63)) (App (Just (7,23)-(7,38)) (Var (Just (7,23)-(7,31)) "List.mem") [Var (Just (7,32)-(7,33)) "h",Var (Just (7,34)-(7,38)) "seen"]) (ConApp (Just (7,44)-(7,53)) "::" (Just (Tuple (Just (7,44)-(7,53)) [Var (Just (7,44)-(7,45)) "h",Var (Just (7,49)-(7,53)) "seen"])) Nothing) (Var (Just (7,59)-(7,63)) "seen")
*)

(* typed spans
(7,20)-(7,63)
*)

(* correct types
'a list
*)

(* bad types
bool
*)
