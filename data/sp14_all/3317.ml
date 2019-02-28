
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::m::t -> ((h * i) mod 10) :: (((h * i) / 10) + (m * i));;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::m::t -> [(h * i) mod 10; ((h * i) / 10) + (m * i)];;

*)

(* changed spans
(5,15)-(5,61)
[(h * i) mod 10 ; ((h * i) / 10) + (m * i)]
ListG (BopG EmptyG EmptyG)

*)

(* changed exprs
List (Just (5,15)-(5,57)) [Bop (Just (5,16)-(5,30)) Mod (Bop (Just (5,16)-(5,23)) Times (Var (Just (5,17)-(5,18)) "h") (Var (Just (5,21)-(5,22)) "i")) (Lit (Just (5,28)-(5,30)) (LI 10)),Bop (Just (5,32)-(5,56)) Plus (Bop (Just (5,32)-(5,46)) Div (Bop (Just (5,33)-(5,40)) Times (Var (Just (5,34)-(5,35)) "h") (Var (Just (5,38)-(5,39)) "i")) (Lit (Just (5,43)-(5,45)) (LI 10))) (Bop (Just (5,49)-(5,56)) Times (Var (Just (5,50)-(5,51)) "m") (Var (Just (5,54)-(5,55)) "i"))] Nothing
*)

(* typed spans
(5,15)-(5,57)
*)

(* correct types
int list
*)

(* bad types
int list
*)
