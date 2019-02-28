
let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> []
       | h::t -> h);;


(* fix

let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> []
       | h::t -> [h]);;

*)

(* changed spans
(10,17)-(10,18)
[h]
ListG VarG

*)

(* changed exprs
List (Just (10,17)-(10,20)) [Var (Just (10,18)-(10,19)) "h"] Nothing
*)

(* typed spans
(10,17)-(10,20)
*)

(* correct types
int list
*)

(* bad types
int
*)
