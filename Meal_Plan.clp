(defrule p1 (or ?p <- (start)) =>
   (printout t crlf crlf "Do you have dietary restrictions " 
   crlf "Enter Your Answer (yes|no): ")
   (assert (dietary (read)))
   (retract ?p))
   
;-----------Ask about allergy on milk ---------------------

(defrule ask-allergy-on-milk (or(dietary yes)) =>
   (printout t crlf crlf "Do you have allergy on milk? "  
   crlf "Enter Your Answer (yes|no): ")
   (assert (allergy-on-milk (read))))

;-----------Ask about diabetics ---------------------

(defrule ask-have-diabetics (or(allergy-on-milk yes)) =>
   (printout t crlf crlf "Do you have diabetics? "  
   crlf "Enter Your Answer (yes|no): ")
   (assert (diabetics (read))))

;-----------Ask about age group ---------------------

(defrule ask-age-group (or(diabetics yes)) =>
   (printout t crlf crlf "What is your age group? "  
   crlf "Enter Your Answer (young|adult): ")
   (assert (age (read))))

;-----------Ask about high proteins ---------------------

(defrule ask-high-protein (or(diabetics no)) =>
   (printout t crlf crlf "Do you need high proteins? "  
   crlf "Enter Your Answer (yes|no): ")
   (assert (protein (read))))

;-----------Ask about taste preference ---------------------

(defrule ask-taste-preference (or(allergy-on-milk no)) =>
   (printout t crlf crlf "What is your taste preference? "  
   crlf "Enter Your Answer (spicy|sugary): ")
   (assert (taste (read))))

;-----------Ask about cholesterol ---------------------

(defrule ask-have-cholesterol (or(dietary no)) =>
   (printout t crlf crlf "Do you have cholesterol? "  
   crlf "Enter Your Answer (yes|no): ")
   (assert (cholesterol (read))))

;-----------Ask about age group ---------------------

(defrule ask-ageGroup (or(cholesterol yes)) =>
   (printout t crlf crlf "What is your age group? "  
   crlf "Enter Your Answer (young|adult): ")
   (assert (ageGroup (read))))

;-----------Ask about taste preference ---------------------

(defrule ask-TastePreference (or(cholesterol no)) =>
   (printout t crlf crlf "What is your taste preference? "  
   crlf "Enter Your Answer (spicy|sugary): ")
   (assert (TastePreference (read))))


;-----------Meal Plan---------------------


;-----------Rule-01 dietatry restrictions, allergy on milk, have diabetics, young ---------------------
(defrule plan1 (dietary yes)(allergy-on-milk yes)(diabetics yes) (age young)=> 
(printout t crlf crlf "Recommended meal plan is: -- Oats, Banana, BlueBerry and Poached Egg --" crlf crlf)) 

;-----------Rule-02 dietatry restrictions, allergy on milk, have diabetics, Adult ---------------------
(defrule plan2 (dietary yes)(allergy-on-milk yes)(diabetics yes) (age adult)=> 
(printout t crlf crlf "Recommended meal plan is: -- Grilled chicken, Avacado salad and Cherry --" crlf crlf)) 

;-----------Rule-03 dietatry restrictions, allergy on milk, have no diabetics, high proteins---------------------
(defrule plan3 (dietary yes)(allergy-on-milk yes)(diabetics no)(protein yes) => 
(printout t crlf crlf "Recommended meal plan is: -- Boiled egg, Beans, Nuts and seeds --" crlf crlf)) 

;-----------Rule-04 dietatry restrictions, allergy on milk, have no diabetics, low proteins ---------------------
(defrule plan4 (dietary yes)(allergy-on-milk yes)(diabetics no) (protein no)=> 
(printout t crlf crlf "Recommended meal plan is: -- Steamed Brocolli, Carrot, Orange Juice --" crlf crlf)) 

;-----------Rule-05 dietatry restrictions, do not allergy on milk, spicy ---------------------
(defrule plan5 (dietary yes)(allergy-on-milk no)(taste spicy)=> 
(printout t crlf crlf "Recommended meal plan is: -- Sandwitch, Fried Egg and Milk --" crlf crlf)) 

;-----------Rule-06 dietatry restrictions, do not allergy on milk, spicy ---------------------
(defrule plan6 (dietary yes)(allergy-on-milk no)(taste sugary)=> 
(printout t crlf crlf "Recommended meal plan is: -- Yoghurt with honey, Cheese, Roasted Sweet Potatoe --" crlf crlf)) 

;-----------Rule-07 No dietatry restrictions, cholesterol, Young ---------------------
(defrule plan7 (dietary no)(cholesterol yes)(ageGroup young)=> 
(printout t crlf crlf "Recommended meal plan is: -- Pasta, Bluberry, Coffee --" crlf crlf)) 

;-----------Rule-08 No dietatry restrictions, cholesterol, Adult ---------------------
(defrule plan8 (dietary no)(cholesterol yes)(ageGroup adult)=> 
(printout t crlf crlf "Recommended meal plan is: -- Wheat Bread, Avacdo salad, Apple --" crlf crlf))

;-----------Rule-09 No dietatry restrictions, No cholesterol, spicy ---------------------
(defrule plan9 (dietary no)(cholesterol no)(TastePreference spicy)=> 
(printout t crlf crlf "Recommended meal plan is: -- Pasta, Grilled Chicken, Milk --" crlf crlf))  

;-----------Rule-10 No dietatry restrictions, No cholesterol, sugary ---------------------
(defrule plan10 (dietary no)(cholesterol no)(TastePreference sugary)=> 
(printout t crlf crlf "Recommended meal plan is: -- Cheese, Wallnut, Raspberry --" crlf crlf))  


