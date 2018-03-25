function [beta_index, beta_nonindex] = InterpretData(FileName, rf);
    asset_data = xlsread(FileName);
    index_data = asset_data(:, 1);
    index_equity_data = asset_data(:, 2:11);
    nonindex_equity_data = asset_data(:, 12:21);
    rm = GetIndexReturn(index_data);
    index_rets = ReturnMean(index_equity_data);
    nonindex_rets = ReturnMean(nonindex_equity_data);
    beta_index = (index_rets - rf) ./ (rm - rf);
    beta_nonindex = (nonindex_rets - rf) ./ (rm - rf);
end
