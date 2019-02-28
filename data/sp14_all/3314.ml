
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> ((h * i) mod 10) :: (((h * i) / 10) + h);;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> [(h * i) mod 10; ((h * i) / 10) + h];;

*)

(* changed spans
(5,12)-(5,52)
[(h * i) mod 10 ; ((h * i) / 10) + h]
ListG (BopG EmptyG EmptyG)

*)

(* changed exprs
List (Just (5,12)-(5,48)) [Bop (Just (5,13)-(5,27)) Mod (Bop (Just (5,13)-(5,20)) Times (Var (Just (5,14)-(5,15)) "h") (Var (Just (5,18)-(5,19)) "i")) (Lit (Just (5,25)-(5,27)) (LI 10)),Bop (Just (5,29)-(5,47)) Plus (Bop (Just (5,29)-(5,43)) Div (Bop (Just (5,30)-(5,37)) Times (Var (Just (5,31)-(5,32)) "h") (Var (Just (5,35)-(5,36)) "i")) (Lit (Just (5,40)-(5,42)) (LI 10))) (Var (Just (5,46)-(5,47)) "h")] Nothing
*)

(* typed spans
(5,12)-(5,48)
*)

(* correct types
int list
*)

(* bad types
int list
*)
