
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let f a x = a + x in
      let base = 0 in
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      helper []
        [List.fold_left f base
           ((mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
              [h * i])];;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let f a x = a + x in
      let base = 0 in
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      helper []
        (List.hd
           [List.fold_left f base
              ((mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
                 [h * i])]);;

*)

(* changed spans
(11,8)-(13,23)
List.hd [List.fold_left f base
                        (mulByDigit i
                                    (List.rev (List.map (fun x ->
                                                           x * 10)
                                                        t)) @ [h * i])]
AppG (fromList [ListG EmptyG])

*)

(* changed exprs
App (Just (11,8)-(14,27)) (Var (Just (11,9)-(11,16)) "List.hd") [List (Just (12,11)-(14,26)) [App (Just (12,12)-(14,25)) (Var (Just (12,12)-(12,26)) "List.fold_left") [Var (Just (12,27)-(12,28)) "f",Var (Just (12,29)-(12,33)) "base",App (Just (13,14)-(14,25)) (Var (Just (13,73)-(13,74)) "@") [App (Just (13,15)-(13,72)) (Var (Just (13,16)-(13,26)) "mulByDigit") [Var (Just (13,27)-(13,28)) "i",App (Just (13,29)-(13,71)) (Var (Just (13,30)-(13,38)) "List.rev") [App (Just (13,39)-(13,70)) (Var (Just (13,40)-(13,48)) "List.map") [Lam (Just (13,49)-(13,67)) (VarPat (Just (13,54)-(13,55)) "x") (Bop (Just (13,60)-(13,66)) Times (Var (Just (13,60)-(13,61)) "x") (Lit (Just (13,64)-(13,66)) (LI 10))) Nothing,Var (Just (13,68)-(13,69)) "t"]]],List (Just (14,17)-(14,24)) [Bop (Just (14,18)-(14,23)) Times (Var (Just (14,18)-(14,19)) "h") (Var (Just (14,22)-(14,23)) "i")] Nothing]]] Nothing]
*)

(* typed spans
(11,8)-(14,27)
*)

(* correct types
int
*)

(* bad types
int list
*)
