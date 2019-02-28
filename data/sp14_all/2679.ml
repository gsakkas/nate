
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | _ ->
        let seen' = if List.mem 0 seen then seen else 0 :: seen in
        let rest' = 0 in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | _ ->
        let seen' = if List.mem 0 seen then seen else 0 :: seen in
        let rest' = [0] in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(8,20)-(8,21)
[0]
ListG LitG

*)

(* changed exprs
List (Just (8,20)-(8,23)) [Lit (Just (8,21)-(8,22)) (LI 0)] Nothing
*)

(* typed spans
(8,20)-(8,23)
*)

(* correct types
int list
*)

(* bad types
int
*)
