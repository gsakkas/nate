
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = [h] in let rest' = List.mem h l in helper (seen', rest') in
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
(7,27)-(7,76)
if List.mem h seen
then seen
else h :: seen
IteG (AppG (fromList [EmptyG])) VarG (ConAppG (Just EmptyG))

(7,55)-(7,76)
let rest' = t in
helper (seen' , rest')
LetG NonRec (fromList [VarG]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Ite (Just (7,20)-(7,63)) (App (Just (7,23)-(7,38)) (Var (Just (7,23)-(7,31)) "List.mem") [Var (Just (7,32)-(7,33)) "h",Var (Just (7,34)-(7,38)) "seen"]) (Var (Just (7,44)-(7,48)) "seen") (ConApp (Just (7,54)-(7,63)) "::" (Just (Tuple (Just (7,54)-(7,63)) [Var (Just (7,54)-(7,55)) "h",Var (Just (7,59)-(7,63)) "seen"])) Nothing)
Let (Just (8,8)-(8,46)) NonRec [(VarPat (Just (8,12)-(8,17)) "rest'",Var (Just (8,20)-(8,21)) "t")] (App (Just (8,25)-(8,46)) (Var (Just (8,25)-(8,31)) "helper") [Tuple (Just (8,32)-(8,46)) [Var (Just (8,33)-(8,38)) "seen'",Var (Just (8,40)-(8,45)) "rest'"]])
*)

(* typed spans
(7,20)-(7,63)
(8,8)-(8,46)
*)

(* correct types
'a list
'a list
*)

(* bad types
'a list
'a list
*)
