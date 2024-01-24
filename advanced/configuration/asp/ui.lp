#const root_name="ROOT".

% main window
elem(w, window, root).
        
    % title
    elem(menu_bar, menu_bar, w). 
    attr(menu_bar, title, "Product configuration").

    % one container per feature
    elem(c(F), container, w) :- feature(root_name,F,T,_,_).
    attr(c(F), width, "500") :- feature(root_name,F,T,_,_).
    attr(c(F), class, ("m-3";"p-3";"bg-primary";"bg-opacity-50";"rounded"))           :- feature(root_name,F,T,_,_).
    attr(c(F), class, ("d-inline-flex";"flex-row-reverse";"justify-content-between")) :- feature(root_name,F,T,_,_).

        % label
        elem(l(F), label, c(F)) :- feature(root_name,F,T,_,_).
        attr(l(F), label, F) :- feature(root_name,F,T,_,_).

        % dropdown menu
        elem(ldd(F), dropdown_menu, c(F)) :- feature(root_name,F,T,_,_).
        attr(ldd(F), class, ("border-dark";"bg-primary";"bg-opacity-50")) :- feature(root_name,F,T,_,_).
        % select V for F if all answer sets have value V for F
        attr(ldd(F), selected, V) :- feature(root_name,F,T,_,_), _all(value(F,V)).

            % otherwise allow the selection of V for F if any answer set has value V for V
            elem(lddi(F,V), dropdown_menu_item, ldd(F)) :- feature(root_name,F,T,_,_), _any(value(F,V)).
            attr(lddi(F,V), label, V) :- feature(root_name,F,T,_,_), _any(value(F,V)).
            % if option (F,V) is selected then add the assumption that value(F,T) must hold
            when(lddi(F,V), click, call, add_assumption(value(F,V))) :- feature(root_name,F,T,_,_), _any(value(F,V)).
