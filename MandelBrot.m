xSize = 500;
ySize = 500;
iterations = 15;

Cs = linspace(-2.5,2.5,xSize);
numOfSteps = zeros(xSize,ySize);
values = zeros(xSize, ySize);
for i=1:iterations
    for j = 1:xSize
        for k = 1:ySize
            if abs(values(j,k)) <= 2
                values(j,k) = values(j,k)*values(j,k)+Cs(j)+1i*Cs(k);
            elseif numOfSteps(j,k) ==0
                numOfSteps(j,k) = i;
            end
        end
    end
end

img = mat2gray(numOfSteps);
imshow(img)
            