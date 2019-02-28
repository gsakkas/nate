
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> [((h * i) / 10) + (mulByDigit i t); (h * i) mod 10];;


(* fix

let rec mulByDigit i l =
  match List.rev l with | [] -> [] | h::t -> [(h * i) mod 10];;

*)

(* changed spans
(5,12)-(5,63)
[(h * i) mod 10]
ListG (BopG EmptyG EmptyG)

*)

(* changed exprs
List (Just (3,45)-(3,61)) [Bop (Just (3,46)-(3,60)) Mod (Bop (Just (3,46)-(3,53)) Times (Var (Just (3,47)-(3,48)) "h") (Var (Just (3,51)-(3,52)) "i")) (Lit (Just (3,58)-(3,60)) (LI 10))] Nothing
*)

(* typed spans
(3,45)-(3,61)
*)

(* correct types
int list
*)

(* bad types
int list
*)
