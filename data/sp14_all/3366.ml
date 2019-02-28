
let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      sqsum
        ((mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @ [h * i]);;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      [sqsum
         ((mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @ [h * i])];;

*)

(* changed spans
(9,6)-(10,77)
[sqsum (mulByDigit i
                   (List.rev (List.map (fun x ->
                                          x * 10)
                                       t)) @ [h * i])]
ListG (AppG (fromList [EmptyG]))

*)

(* changed exprs
List (Just (9,6)-(10,79)) [App (Just (9,7)-(10,78)) (Var (Just (9,7)-(9,12)) "sqsum") [App (Just (10,9)-(10,78)) (Var (Just (10,68)-(10,69)) "@") [App (Just (10,10)-(10,67)) (Var (Just (10,11)-(10,21)) "mulByDigit") [Var (Just (10,22)-(10,23)) "i",App (Just (10,24)-(10,66)) (Var (Just (10,25)-(10,33)) "List.rev") [App (Just (10,34)-(10,65)) (Var (Just (10,35)-(10,43)) "List.map") [Lam (Just (10,44)-(10,62)) (VarPat (Just (10,49)-(10,50)) "x") (Bop (Just (10,55)-(10,61)) Times (Var (Just (10,55)-(10,56)) "x") (Lit (Just (10,59)-(10,61)) (LI 10))) Nothing,Var (Just (10,63)-(10,64)) "t"]]],List (Just (10,70)-(10,77)) [Bop (Just (10,71)-(10,76)) Times (Var (Just (10,71)-(10,72)) "h") (Var (Just (10,75)-(10,76)) "i")] Nothing]]] Nothing
*)

(* typed spans
(9,6)-(10,79)
*)

(* correct types
int list
*)

(* bad types
int
*)
