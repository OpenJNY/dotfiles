# matplotlib

使えるフォントの列挙


## フォントの変更

使えるフォントを調べる

```bash
python -c "
import matplotlib.font_manager as fm;
fonts = [f.split('/')[-1] for f in fm.findSystemFonts()];
print('\n'.join(fonts))
"
```

設定ファイルの場所を調べる

```python
import matplotlib as mpl
mpl.matplotlib_fname()
```

こんな感じで
```
### FIGURE
# figure.figsize    : 10, 8      # figure size in inches
# figure.dpi        : 300       # figure dots per inch
#figure.autolayout : True     # When True, automatically adjust subplot parameters to make the plot fit the figure

### FONT
font.family : Noto Sans CJK JP, Source Han Code JP
#ont.family         : sans-serif
#font.style          : normal
#font.variant        : normal
#font.weight         : medium
#font.stretch        : normal

#font.size           : 10.0
#font.serif          : Source Han Code JP,DejaVu Serif, Bitstream Vera Serif, New Century Schoolbook, Century Schoolbook L, Utopia, ITC Bookman, Bookman, Nimbus Roman No9 L, Times New Roman, Times, Palatino, Charter, serif
font.sans-serif     : Noto Sans CJK JP, DejaVu Sans, Bitstream Vera Sans, Lucida Grande, Verdana, Geneva, Lucid, Arial, Helvetica, Avant Garde, sans-serif
#font.cursive        : Apple Chancery, Textile, Zapf Chancery, Sand, Script MT, Felipa, cursive
#font.fantasy        : Comic Sans MS, Chicago, Charcoal, Impact, Western, Humor Sans, xkcd, fantasy
#font.monospace      : DejaVu Sans Mono, Bitstream Vera Sans Mono, Andale Mono, Nimbus Mono L, Courier New, Courier, Fixed, Terminal, monospace

# font.size            : 14
# axes.titlesize       : large
# axes.labelsize       : medium
# xtick.labelsize      : medium
# ytick.labelsize      : medium
# legend.fontsize      : medium

#ytick.labelsize : 15
#xtick.labelsize : 15

### PDF
pdf.fonttype : 42        # Output Type 3 (Type3) or Type 42 (TrueType)

### SAVEFIG
savefig.dpi           : 300      # figure dots per inch
#savefig.facecolor    : white    # figure facecolor when saving
#savefig.edgecolor    : white    # figure edgecolor when saving
#savefig.format       : png      # png, ps, pdf, svg
#savefig.pad_inches   : 0.1      # Padding to be used when bbox is set to 'tight'
savefig.jpeg_quality  : 100       # when a jpeg is saved, the default quality parameter.
```

キャッシュの削除

```bash
python -c "import matplotlib.font_manager as fm; fm._rebuild()"
```

#### スクリプト毎のフォント設定

```python
import matplotlib as mpl
font = {"family":"Noto Sans CJK JP"}
mpl.rc('font', **font)
```
