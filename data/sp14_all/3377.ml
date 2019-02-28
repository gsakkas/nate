
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> []
       | h::t ->
           let f a x = a + x in
           let base = 0 in List.fold_left f base (h :: t));;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> []
       | h::t ->
           let f a x = a + x in
           let base = 0 in [List.fold_left f base (h :: t)]);;

*)

(* changed spans
(12,27)-(12,57)
[List.fold_left f base
                (h :: t)]
ListG (AppG (fromList [EmptyG]))

*)

(* changed exprs
List (Just (12,27)-(12,59)) [App (Just (12,28)-(12,58)) (Var (Just (12,28)-(12,42)) "List.fold_left") [Var (Just (12,43)-(12,44)) "f",Var (Just (12,45)-(12,49)) "base",ConApp (Just (12,50)-(12,58)) "::" (Just (Tuple (Just (12,51)-(12,57)) [Var (Just (12,51)-(12,52)) "h",Var (Just (12,56)-(12,57)) "t"])) Nothing]] Nothing
*)

(* typed spans
(12,27)-(12,59)
*)

(* correct types
int list
*)

(* bad types
int
*)
