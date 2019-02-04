
let rec mulByDigit i l =
  match List.rev l with
  | [] -> 0
  | h::t -> (List.rev (List.map (fun x  -> x * 10) t)) + (h * i);;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @ [h * i];;

*)

(* changed spans
(4,10)-(4,11)
EMPTY
EmptyG

(5,12)-(5,54)
mulByDigit i
           (List.rev (List.map (fun x ->
                                  x * 10) t)) @ [h * i]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(5,12)-(5,64)
[]
ListG EmptyG Nothing

(5,57)-(5,64)
[h * i]
ListG (BopG EmptyG EmptyG) Nothing

*)
