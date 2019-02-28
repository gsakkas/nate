
let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [helper [] (h * i)]
       with
       | [] -> []
       | h::t -> h);;


(* fix

let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
        ((helper [] (h * i)) @ []);;

*)

(* changed spans
(8,6)-(12,19)
mulByDigit i
           (List.rev (List.map (fun x ->
                                  x * 10) t)) @ (helper []
                                                        (h * i) @ [])
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (8,6)-(9,34)) (Var (Just (8,64)-(8,65)) "@") [App (Just (8,6)-(8,63)) (Var (Just (8,7)-(8,17)) "mulByDigit") [Var (Just (8,18)-(8,19)) "i",App (Just (8,20)-(8,62)) (Var (Just (8,21)-(8,29)) "List.rev") [App (Just (8,30)-(8,61)) (Var (Just (8,31)-(8,39)) "List.map") [Lam (Just (8,40)-(8,58)) (VarPat (Just (8,45)-(8,46)) "x") (Bop (Just (8,51)-(8,57)) Times (Var (Just (8,51)-(8,52)) "x") (Lit (Just (8,55)-(8,57)) (LI 10))) Nothing,Var (Just (8,59)-(8,60)) "t"]]],App (Just (9,8)-(9,34)) (Var (Just (9,29)-(9,30)) "@") [App (Just (9,9)-(9,28)) (Var (Just (9,10)-(9,16)) "helper") [List (Just (9,17)-(9,19)) [] Nothing,Bop (Just (9,20)-(9,27)) Times (Var (Just (9,21)-(9,22)) "h") (Var (Just (9,25)-(9,26)) "i")],List (Just (9,31)-(9,33)) [] Nothing]]
*)

(* typed spans
(8,6)-(9,34)
*)

(* correct types
int list
*)

(* bad types
int list
*)
