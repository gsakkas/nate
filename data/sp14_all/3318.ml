
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::m::t ->
      [(mulByDigit m)
      ::
      t;
      ((h * i) / 10) + ((m * i) mod 10);
      (h * i) mod 10];;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::m::t ->
      (mulByDigit i (m :: t)) @
        [((h * i) / 10) + ((m * i) mod 10); (h * i) mod 10];;

*)

(* changed spans
(6,6)-(10,21)
mulByDigit i
           (m :: t) @ [((h * i) / 10) + ((m * i) mod 10) ; (h * i) mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
App (Just (6,6)-(7,59)) (Var (Just (6,30)-(6,31)) "@") [App (Just (6,6)-(6,29)) (Var (Just (6,7)-(6,17)) "mulByDigit") [Var (Just (6,18)-(6,19)) "i",ConApp (Just (6,20)-(6,28)) "::" (Just (Tuple (Just (6,21)-(6,27)) [Var (Just (6,21)-(6,22)) "m",Var (Just (6,26)-(6,27)) "t"])) Nothing],List (Just (7,8)-(7,59)) [Bop (Just (7,9)-(7,42)) Plus (Bop (Just (7,9)-(7,23)) Div (Bop (Just (7,10)-(7,17)) Times (Var (Just (7,11)-(7,12)) "h") (Var (Just (7,15)-(7,16)) "i")) (Lit (Just (7,20)-(7,22)) (LI 10))) (Bop (Just (7,26)-(7,42)) Mod (Bop (Just (7,27)-(7,34)) Times (Var (Just (7,28)-(7,29)) "m") (Var (Just (7,32)-(7,33)) "i")) (Lit (Just (7,39)-(7,41)) (LI 10))),Bop (Just (7,44)-(7,58)) Mod (Bop (Just (7,44)-(7,51)) Times (Var (Just (7,45)-(7,46)) "h") (Var (Just (7,49)-(7,50)) "i")) (Lit (Just (7,56)-(7,58)) (LI 10))] Nothing]
*)

(* typed spans
(6,6)-(7,59)
*)

(* correct types
int list
*)

(* bad types
int list list
*)
