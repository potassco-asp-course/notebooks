#const root_name="ROOT".

elem(w, window, root).

    elem(c(F), container, w) :- feature(root_name,F,T,_,_).
    attr(c(F), width, "500") :- feature(root_name,F,T,_,_).
    attr(c(F), class, ("m-3";"p-3";"bg-primary";"bg-opacity-50";"rounded";"d-inline-flex";"flex-row-reverse";"justify-content-between")) :- feature(root_name,F,T,_,_).

        elem(l(F), label, c(F)) :- feature(root_name,F,T,_,_).
        attr(l(F), label, F) :- feature(root_name,F,T,_,_).

        elem(ldd(F), dropdown_menu, c(F)) :- feature(root_name,F,T,_,_).
        attr(ldd(F), class, ("border-dark";"bg-primary";"bg-opacity-50")) :- feature(root_name,F,T,_,_).
        attr(ldd(F), selected, V) :- feature(root_name,F,T,_,_), _all(value(F,V)).

            elem(lddi(F,V), dropdown_menu_item, ldd(F)) :- feature(root_name,F,T,_,_), _any(value(F,V)).
            attr(lddi(F,V), label, V) :- feature(root_name,F,T,_,_), _any(value(F,V)).
            when(lddi(F,V), click, call, add_assumption(value(F,V))) :- feature(root_name,F,T,_,_), _any(value(F,V)).
    
    elem(menu_bar, menu_bar, w).
    attr(menu_bar, title, "Product configuration").
