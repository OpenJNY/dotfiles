# tensorflowのインストール

## ソースからコンパイル

* GPU機能付きの tensorflow-gpu をインストールしたいときに，`pip` 経由だとCUDAのバージョンを揃えないといけないことがある．
* 任意の CUDA で tensorflow したければ，自分でコンパイルする．
* [公式ドキュメント](https://www.tensorflow.org/install/install_sources) を読めば基本的には問題ない．


```bash
# miniconda/anaconda (py3) が入っている状態
conda update conda
conda install six numpy wheel

# 適当な（コンパイルのための）作業ディレクトリ
git clone https://github.com/tensorflow/tensorflow
cd tensorflow
git checkout r1.5
```
