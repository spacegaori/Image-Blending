function [left, right] = get_images()
    default_file_name = fullfile(pwd, '*.*');
    [base_file_name, folder] = uigetfile(default_file_name, 'Select a file');

    if base_file_name == 0
        fprintf('File Selection Failure\n');
        return;
    end

    left_file_name = fullfile(folder, base_file_name);

    default_file_name = fullfile(pwd, '*.*');
    [base_file_name, folder] = uigetfile(default_file_name, 'Select a file');

    if base_file_name == 0
        fprintf('File Selection Failure\n');
        return;
    end

    right_file_name = fullfile(folder, base_file_name);

    left = im2double(imread(left_file_name));
    right = im2double(imread(right_file_name));

    if ~isequal(size(left), size(right))
        fprintf('Incompatible Size\n');
    end

end
