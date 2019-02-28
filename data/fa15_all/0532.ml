
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' =
          match List.mem (h, seen) with
          | true  -> seen @ [h]
          | false  -> seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' =
          match List.mem h seen with | true  -> seen @ [h] | false  -> seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(8,16)-(8,34)
List.mem h seen
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (8,16)-(8,31)) (Var (Just (8,16)-(8,24)) "List.mem") [Var (Just (8,25)-(8,26)) "h",Var (Just (8,27)-(8,31)) "seen"]
*)

(* typed spans
(8,16)-(8,31)
*)

(* correct types
bool
*)

(* bad types
('a * 'a list) list -> bool
*)
