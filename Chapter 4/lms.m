function [estimatedOutput, errorSignal, filterWeights] = lms(inputSignal, desiredSignal, stepSize, filterOrder)
    signalLength = length(inputSignal);
    errorSignal = zeros(1, signalLength);
    estimatedOutput = zeros(1, signalLength);
    filterWeights = zeros(filterOrder + 1, signalLength);

    for sampleIndex = filterOrder + 1 : signalLength
        estimatedOutput(sampleIndex) = filterWeights(:, sampleIndex).' * inputSignal(sampleIndex : -1 : sampleIndex - filterOrder).';
        errorSignal(sampleIndex) = desiredSignal(sampleIndex) - estimatedOutput(sampleIndex);
        filterWeights(:, sampleIndex + 1) = filterWeights(:, sampleIndex) + stepSize * errorSignal(sampleIndex) * inputSignal(sampleIndex : -1 : sampleIndex - filterOrder).';
    end
end