function x = gaussElim(a,b)
    B = [a b];
    determinant = det(a)
    if determinant == 0
        disp('System is unsolvable. det(a) == 0')
    else
        B = partialPivotRowSwap(B);
        B = recursiveElimination(B);
        disp(B)
        x = backwardsSub(B)
    end
end

% recursive solution, because recursion is more fun :D
% iterative solution can done quite easily by shifting tempArr calculation
% to multiple inner for loops to stitch together the eliminated matrix, and
% honestly that's what should be done, but recursion is so fun, and with a
% better optimised compiler with better tailcall optimisations (probably
% with C, Haskell or some other LLVM based language), recursion can be
% better than just writing iterative code.
function triangular = recursiveElimination(arr)
    inputArr = partialPivotRowSwap(arr)
    numRows = size(inputArr,1); % gets number of rows
    for n=2:numRows
        % do the actual elimination
        tempArr = (inputArr(n,1)/inputArr(1,1))*inputArr(1,:)
        inputArr(n,:) = inputArr(n,:)-tempArr
    end
    if numRows > 2
        % Slice sub-array
        triangularPartial = inputArr(2:numRows,2:numRows+1)
        % Call function recursively in order to compute triangular matrix
        triangularPartial = recursiveElimination(triangularPartial)
        disp(inputArr)
        inputArr(2:numRows,2:numRows+1) = triangularPartial
        triangular = inputArr;
    else
        triangular = inputArr;
    end
    
end

function a = partialPivotRowSwap(a)
    % For partial pivoting, we make the largest element the pivot point.
    % To partial pivot, we find the row with the highest absolute value on
    % the leftmost column. We can find the maximum of the absolutes of the
    % a(i, 1), which in matlab, we can placehold using :, thus,
    % a(:, 1) gives us an array of all elements in column 1,
    % which we can then absolute, and then find the maximum in the array.
    % [~, maxRow] means that we store the actual maximum value into '~' by
    % running the function, and then we discard the value, and find the
    % index of that element, which we can then use to swap using the code
    % below. This allows us to handle any possible case of code, including
    % for if the given pivot is zero.
    [~, maxRow] = max(abs(a(:,1)));
    % The code below here stores the current pivot row to a temporary
    % storage, then pushes the row with the highest absolute value on the
    % left to the pivot row, then stores the replaces that row with the
    % initial pivot.
    temp = a(1,:);
    a(1,:) = a(maxRow,:);
    a(maxRow,:) = temp;
end

function x = backwardsSub(inputArr)
    numRows = size(inputArr, 1)
    numCols = size(inputArr, 2)
    upperTriangular = inputArr(:,1:numCols-1)
    rightMatrix = inputArr(:,numCols)
    x = zeros(numRows, 1);
    for i = numRows:-1:1
        disp(i)
        % This part was hard to understand and thus, implement into code.
        % Thankfully, after writing out a 5x5 upper triangular matrix to
        % try and solve, I noticed that the inner portion of the backwards
        % substitution was just a dot product of the current row and the
        % output matrix up until the current row multiplied by -1 to make
        % negative. After finding this out, implementing it was trivial.
        aMatrix = upperTriangular(i, i:numRows)
        cMatrix = x(i:numRows)
        aDotC = dot(aMatrix,cMatrix)
        x(i) = (rightMatrix(i) - aDotC) / upperTriangular(i, i)
    end
end