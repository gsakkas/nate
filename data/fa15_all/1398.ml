
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' =
          match List.mem (h, seen) with | true  -> [] | false  -> [h] in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if true then [] else [h] in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(8,10)-(8,69)
if true then [] else [h]
IteG LitG (ListG EmptyG) (ListG EmptyG)

*)

(* changed exprs
Ite (Just (7,20)-(7,44)) (Lit (Just (7,23)-(7,27)) (LB True)) (List (Just (7,33)-(7,35)) [] Nothing) (List (Just (7,41)-(7,44)) [Var (Just (7,42)-(7,43)) "h"] Nothing)
*)

(* typed spans
(7,20)-(7,44)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
