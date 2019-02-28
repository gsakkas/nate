
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (mulByDigit i (List.rev (List.map (fun x  -> [x * 10]) t))) @ [h * i];;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @ [h * i];;

*)

(* changed spans
(6,51)-(6,59)
x * 10
BopG VarG LitG

*)

(* changed exprs
Bop (Just (6,51)-(6,57)) Times (Var (Just (6,51)-(6,52)) "x") (Lit (Just (6,55)-(6,57)) (LI 10))
*)

(* typed spans
(6,51)-(6,57)
*)

(* correct types
int
*)

(* bad types
int list
*)
