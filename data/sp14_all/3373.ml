
let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> []
       | h::t ->
           let rec helper acc v = if v = 0 then acc else v mod 10 in
           helper [] h);;


(* fix

let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> []
       | h::t ->
           let rec helper acc v = if v = 0 then acc else [v mod 10] in
           helper [] h);;

*)

(* changed spans
(11,57)-(11,65)
[v mod 10]
ListG (BopG EmptyG EmptyG)

*)

(* changed exprs
List (Just (11,57)-(11,67)) [Bop (Just (11,58)-(11,66)) Mod (Var (Just (11,58)-(11,59)) "v") (Lit (Just (11,64)-(11,66)) (LI 10))] Nothing
*)

(* typed spans
(11,57)-(11,67)
*)

(* correct types
int list
*)

(* bad types
int
*)
