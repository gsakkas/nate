
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> 0
       | h::t -> h);;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> []
       | h::t -> [h]);;

*)

(* changed spans
(9,15)-(9,16)
[]
ListG EmptyG

(10,17)-(10,18)
[h]
ListG VarG

*)

(* changed exprs
List (Just (9,15)-(9,17)) [] Nothing
List (Just (10,17)-(10,20)) [Var (Just (10,18)-(10,19)) "h"] Nothing
*)

(* typed spans
(9,15)-(9,17)
(10,17)-(10,20)
*)

(* correct types
int list
int list
*)

(* bad types
int
int
*)
