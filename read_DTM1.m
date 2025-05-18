% DTMファイルのパスを指定
dtm_file = 'path/to/odm_dem/dtm.tif';

% ファイル読み込み
try
  % geotiffreadが利用可能な場合
  [dtm_data, dtm_map] = geotiffread(dtm_file);
catch
  % 通常の画像として読み込む
  dtm_data = imread(dtm_file);
end

% NaN値を処理（必要に応じて）
dtm_data = double(dtm_data);


% 2D表示（上から見た図）
figure(1);
imagesc(dtm_data);
colorbar;
title('DTM 2D View');
colormap(jet); % お好みのカラーマップを選択
