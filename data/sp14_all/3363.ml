
let rec mulByDigit i l =
  match List.rev l with
  | [] -> 0
  | h::t -> (List.rev (List.map (fun x  -> x * 10) t)) @ [h * i];;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @ [h * i];;

*)

(* changed spans
(4,10)-(4,11)
[]
ListG EmptyG

(5,12)-(5,54)
mulByDigit i
           (List.rev (List.map (fun x ->
                                  x * 10) t))
AppG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* changed exprs
List (Just (4,10)-(4,12)) [] Nothing
App (Just (6,6)-(6,63)) (Var (Just (6,7)-(6,17)) "mulByDigit") [Var (Just (6,18)-(6,19)) "i",App (Just (6,20)-(6,62)) (Var (Just (6,21)-(6,29)) "List.rev") [App (Just (6,30)-(6,61)) (Var (Just (6,31)-(6,39)) "List.map") [Lam (Just (6,40)-(6,58)) (VarPat (Just (6,45)-(6,46)) "x") (Bop (Just (6,51)-(6,57)) Times (Var (Just (6,51)-(6,52)) "x") (Lit (Just (6,55)-(6,57)) (LI 10))) Nothing,Var (Just (6,59)-(6,60)) "t"]]]
*)

(* typed spans
(4,10)-(4,12)
(6,6)-(6,63)
*)

(* correct types
int list
int list
*)

(* bad types
int
int list
*)
