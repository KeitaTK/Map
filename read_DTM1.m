% DTMを読み込んで、2Dで表示
% DTMファイルのパスを指定
dtm_file = 'C:\Users\keita\Documents\local\Map\-2025-5-15-dtm.tif';

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

##
##% 2D表示（上から見た図）
##figure(1);
##imagesc(dtm_data);
##colorbar;
##title('DTM 2D View');
##colormap(jet); % お好みのカラーマップを選択

% 3D表示用のグリッド作成
[rows, cols] = size(dtm_data);
[X, Y] = meshgrid(1:cols, 1:rows);

% 3D表示
figure(2);
surf(X, Y, dtm_data);
title('DTM 3D View');
xlabel('X');
ylabel('Y');
zlabel('Elevation (m)');
colorbar;
shading interp; % 滑らかな表示（オプション）

% 視点を調整
view(45, 30); % 方位角、仰角
