# sudoku_solver_on_FPGA

数独を解きます．基本的にimem.vとmemory.v,test.vのみ編集しております．（imemには実行命令，memory.vにはメモリの初期値を編集しました．）

### シミュレーションする場合
fpga.v以外のvファイルをiverilogして，a.outを実行するとvcdファイルが生成されるのでgtkwaveで見ます．シミュレーション時間を延ばすなどをする場合は，test.vを編集してください．

### 論理合成してFPGAを動かす場合
test.v以外のvファイルとclk_wiz.xciをvivadoのプロジェクトに追加します．
