
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> ((mulByDigit i (List.rev t)) @ 0) @ [h * i];;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> ((mulByDigit i (List.rev t)) @ [0]) @ [h * i];;

*)

(* changed spans
(5,43)-(5,44)
[0]
ListG LitG

*)

(* changed exprs
List (Just (5,43)-(5,46)) [Lit (Just (5,44)-(5,45)) (LI 0)] Nothing
*)

(* typed spans
(5,43)-(5,46)
*)

(* correct types
int list
*)

(* bad types
int
*)
