
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> []
       | h::t ->
           let rec helper acc v =
             if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
           helper h);;


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
           let rec helper acc v =
             if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
           helper [] h);;

*)

(* changed spans
(13,11)-(13,19)
helper [] h
AppG (fromList [VarG,ListG EmptyG])

*)

(* changed exprs
App (Just (13,11)-(13,22)) (Var (Just (13,11)-(13,17)) "helper") [List (Just (13,18)-(13,20)) [] Nothing,Var (Just (13,21)-(13,22)) "h"]
*)

(* typed spans
(13,11)-(13,22)
*)

(* correct types
int list
*)

(* bad types
int -> int list
*)
