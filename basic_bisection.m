yTRUE=4.5;
% Guess Values
x1=3.5;
x2=5.5;
xmid = (x1+x2)/2;
ymid = (xmid)+sin(xmid/2);
tol=1e-16;
count = 0;
while abs(ymid-yTRUE) > tol;
    % start count
    count = count + 1;
    % define midpoints x
    xmid = (x1+x2)/2;
    
    % define function
    y1 = (x1)+sin(x1);
    y2 = (x2)+sin(x2);
    ymid = (xmid)+sin(xmid);

    % define error
    error1 = y1-yTRUE;
    error2 = y2-yTRUE;
    errormid = ymid-yTRUE;
    
    % start value tests
    %if tolerance is greater than error
    if abs(errormid) <= tol 
        disp('success')
        break
    % If error 2 is greater than 0 then x1 is xmid
    elseif error2*(errormid-tol)<0;
        x1 = xmid;
    % If error 1 is less than 0 then x2 is xmid 
    elseif error1*(errormid+tol)<0;
        x2 = xmid;
    else
        error('bad guesses')
    end
    
    count
    if count >=1000
        disp('too many iterations')
        break;
    end
end
disp('success of module. With iteration:')
count
disp('and values of x and y:')
xmid
ymid
