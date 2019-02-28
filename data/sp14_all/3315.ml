
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> [(mulByDigit i t) ((h * i) mod 10)];;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> List.append (mulByDigit i t) [h * i];;

*)

(* changed spans
(5,12)-(5,47)
List.append (mulByDigit i t)
            [h * i]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
App (Just (5,12)-(5,48)) (Var (Just (5,12)-(5,23)) "List.append") [App (Just (5,24)-(5,40)) (Var (Just (5,25)-(5,35)) "mulByDigit") [Var (Just (5,36)-(5,37)) "i",Var (Just (5,38)-(5,39)) "t"],List (Just (5,41)-(5,48)) [Bop (Just (5,42)-(5,47)) Times (Var (Just (5,42)-(5,43)) "h") (Var (Just (5,46)-(5,47)) "i")] Nothing]
*)

(* typed spans
(5,12)-(5,48)
*)

(* correct types
int list
*)

(* bad types
'a list
*)
