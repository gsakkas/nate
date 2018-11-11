
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> [((mulByDigit i (List.rev t)) * 10) + (h * i)];;


(* fix

let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @ [h * i];;

*)

(* changed spans
(5,15)-(5,25)
(@)
VarG

(5,15)-(5,25)
mulByDigit i
           (List.rev (List.map (fun x ->
                                  x * 10) t))
AppG [VarG,AppG [EmptyG]]

(5,38)-(5,39)
List.map (fun x -> x * 10) t
AppG [LamG EmptyG,VarG]

(5,44)-(5,46)
List.map
VarG

(5,44)-(5,46)
x
VarG

(5,44)-(5,46)
fun x -> x * 10
LamG (BopG EmptyG EmptyG)

(5,44)-(5,46)
x * 10
BopG VarG LitG

(5,50)-(5,57)
t
VarG

(5,50)-(5,57)
[h * i]
ListG (BopG EmptyG EmptyG) Nothing

*)