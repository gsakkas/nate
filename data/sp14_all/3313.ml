
let rec mulByDigit i l =
  match List.rev l with | [] -> [] | h::t -> [mulByDigit i t; (h * i) mod 10];;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> List.append (mulByDigit i t) [(h * i) mod 10];;

*)

(* changed spans
(3,45)-(3,77)
List.append (mulByDigit i t)
            [(h * i) mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
App (Just (5,12)-(5,57)) (Var (Just (5,12)-(5,23)) "List.append") [App (Just (5,24)-(5,40)) (Var (Just (5,25)-(5,35)) "mulByDigit") [Var (Just (5,36)-(5,37)) "i",Var (Just (5,38)-(5,39)) "t"],List (Just (5,41)-(5,57)) [Bop (Just (5,42)-(5,56)) Mod (Bop (Just (5,42)-(5,49)) Times (Var (Just (5,43)-(5,44)) "h") (Var (Just (5,47)-(5,48)) "i")) (Lit (Just (5,54)-(5,56)) (LI 10))] Nothing]
*)

(* typed spans
(5,12)-(5,57)
*)

(* correct types
int list
*)

(* bad types
int list
*)
