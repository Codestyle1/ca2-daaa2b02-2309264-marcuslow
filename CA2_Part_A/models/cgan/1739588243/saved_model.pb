Бя
ч«
^
AssignVariableOp
resource
value"dtype"
dtypetype"
validate_shapebool( И
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
h
ConcatV2
values"T*N
axis"Tidx
output"T"
Nint(0"	
Ttype"
Tidxtype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype
ј
Conv2DBackpropInput
input_sizes
filter"T
out_backprop"T
output"T"
Ttype:	
2"
strides	list(int)"
use_cudnn_on_gpubool(",
paddingstring:
SAMEVALIDEXPLICIT""
explicit_paddings	list(int)
 "-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

ы
FusedBatchNormV3
x"T

scale"U
offset"U	
mean"U
variance"U
y"T

batch_mean"U
batch_variance"U
reserve_space_1"U
reserve_space_2"U
reserve_space_3"U"
Ttype:
2"
Utype:
2"
epsilonfloat%Ј—8"&
exponential_avg_factorfloat%  А?";
data_formatstringNHWC:
NHWCNCHWNDHWCNCDHW"
is_trainingbool(
.
Identity

input"T
output"T"	
Ttype
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
Ж
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool("
allow_missing_filesbool( И

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
@
ReadVariableOp
resource
value"dtype"
dtypetypeИ
E
Relu
features"T
activations"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0И
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0И
?
Select
	condition

t"T
e"T
output"T"	
Ttype
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
Ѕ
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring И®
@
StaticRegexFullMatch	
input

output
"
patternstring
ч
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
-
Tanh
x"T
y"T"
Ttype:

2
Ц
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 И"serve*2.10.02v2.10.0-rc3-6-g359c3cdfc5f8ёЇ
Ж
conv2d_transpose_3/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*(
shared_nameconv2d_transpose_3/bias

+conv2d_transpose_3/bias/Read/ReadVariableOpReadVariableOpconv2d_transpose_3/bias*
_output_shapes
:*
dtype0
Ц
conv2d_transpose_3/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape: **
shared_nameconv2d_transpose_3/kernel
П
-conv2d_transpose_3/kernel/Read/ReadVariableOpReadVariableOpconv2d_transpose_3/kernel*&
_output_shapes
: *
dtype0
§
&batch_normalization_97/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape: *7
shared_name(&batch_normalization_97/moving_variance
Э
:batch_normalization_97/moving_variance/Read/ReadVariableOpReadVariableOp&batch_normalization_97/moving_variance*
_output_shapes
: *
dtype0
Ь
"batch_normalization_97/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape: *3
shared_name$"batch_normalization_97/moving_mean
Х
6batch_normalization_97/moving_mean/Read/ReadVariableOpReadVariableOp"batch_normalization_97/moving_mean*
_output_shapes
: *
dtype0
О
batch_normalization_97/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape: *,
shared_namebatch_normalization_97/beta
З
/batch_normalization_97/beta/Read/ReadVariableOpReadVariableOpbatch_normalization_97/beta*
_output_shapes
: *
dtype0
Р
batch_normalization_97/gammaVarHandleOp*
_output_shapes
: *
dtype0*
shape: *-
shared_namebatch_normalization_97/gamma
Й
0batch_normalization_97/gamma/Read/ReadVariableOpReadVariableOpbatch_normalization_97/gamma*
_output_shapes
: *
dtype0
Ж
conv2d_transpose_2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: *(
shared_nameconv2d_transpose_2/bias

+conv2d_transpose_2/bias/Read/ReadVariableOpReadVariableOpconv2d_transpose_2/bias*
_output_shapes
: *
dtype0
Ц
conv2d_transpose_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape: @**
shared_nameconv2d_transpose_2/kernel
П
-conv2d_transpose_2/kernel/Read/ReadVariableOpReadVariableOpconv2d_transpose_2/kernel*&
_output_shapes
: @*
dtype0
§
&batch_normalization_96/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*7
shared_name(&batch_normalization_96/moving_variance
Э
:batch_normalization_96/moving_variance/Read/ReadVariableOpReadVariableOp&batch_normalization_96/moving_variance*
_output_shapes
:@*
dtype0
Ь
"batch_normalization_96/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*3
shared_name$"batch_normalization_96/moving_mean
Х
6batch_normalization_96/moving_mean/Read/ReadVariableOpReadVariableOp"batch_normalization_96/moving_mean*
_output_shapes
:@*
dtype0
О
batch_normalization_96/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*,
shared_namebatch_normalization_96/beta
З
/batch_normalization_96/beta/Read/ReadVariableOpReadVariableOpbatch_normalization_96/beta*
_output_shapes
:@*
dtype0
Р
batch_normalization_96/gammaVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*-
shared_namebatch_normalization_96/gamma
Й
0batch_normalization_96/gamma/Read/ReadVariableOpReadVariableOpbatch_normalization_96/gamma*
_output_shapes
:@*
dtype0
Ж
conv2d_transpose_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*(
shared_nameconv2d_transpose_1/bias

+conv2d_transpose_1/bias/Read/ReadVariableOpReadVariableOpconv2d_transpose_1/bias*
_output_shapes
:@*
dtype0
Ч
conv2d_transpose_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:@А**
shared_nameconv2d_transpose_1/kernel
Р
-conv2d_transpose_1/kernel/Read/ReadVariableOpReadVariableOpconv2d_transpose_1/kernel*'
_output_shapes
:@А*
dtype0
•
&batch_normalization_95/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:А*7
shared_name(&batch_normalization_95/moving_variance
Ю
:batch_normalization_95/moving_variance/Read/ReadVariableOpReadVariableOp&batch_normalization_95/moving_variance*
_output_shapes	
:А*
dtype0
Э
"batch_normalization_95/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:А*3
shared_name$"batch_normalization_95/moving_mean
Ц
6batch_normalization_95/moving_mean/Read/ReadVariableOpReadVariableOp"batch_normalization_95/moving_mean*
_output_shapes	
:А*
dtype0
П
batch_normalization_95/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:А*,
shared_namebatch_normalization_95/beta
И
/batch_normalization_95/beta/Read/ReadVariableOpReadVariableOpbatch_normalization_95/beta*
_output_shapes	
:А*
dtype0
С
batch_normalization_95/gammaVarHandleOp*
_output_shapes
: *
dtype0*
shape:А*-
shared_namebatch_normalization_95/gamma
К
0batch_normalization_95/gamma/Read/ReadVariableOpReadVariableOpbatch_normalization_95/gamma*
_output_shapes	
:А*
dtype0
Г
conv2d_transpose/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:А*&
shared_nameconv2d_transpose/bias
|
)conv2d_transpose/bias/Read/ReadVariableOpReadVariableOpconv2d_transpose/bias*
_output_shapes	
:А*
dtype0
Ф
conv2d_transpose/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:АА*(
shared_nameconv2d_transpose/kernel
Н
+conv2d_transpose/kernel/Read/ReadVariableOpReadVariableOpconv2d_transpose/kernel*(
_output_shapes
:АА*
dtype0
•
&batch_normalization_94/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:А*7
shared_name(&batch_normalization_94/moving_variance
Ю
:batch_normalization_94/moving_variance/Read/ReadVariableOpReadVariableOp&batch_normalization_94/moving_variance*
_output_shapes	
:А*
dtype0
Э
"batch_normalization_94/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:А*3
shared_name$"batch_normalization_94/moving_mean
Ц
6batch_normalization_94/moving_mean/Read/ReadVariableOpReadVariableOp"batch_normalization_94/moving_mean*
_output_shapes	
:А*
dtype0
П
batch_normalization_94/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:А*,
shared_namebatch_normalization_94/beta
И
/batch_normalization_94/beta/Read/ReadVariableOpReadVariableOpbatch_normalization_94/beta*
_output_shapes	
:А*
dtype0
С
batch_normalization_94/gammaVarHandleOp*
_output_shapes
: *
dtype0*
shape:А*-
shared_namebatch_normalization_94/gamma
К
0batch_normalization_94/gamma/Read/ReadVariableOpReadVariableOpbatch_normalization_94/gamma*
_output_shapes	
:А*
dtype0
m

dense/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:А1*
shared_name
dense/bias
f
dense/bias/Read/ReadVariableOpReadVariableOp
dense/bias*
_output_shapes	
:А1*
dtype0
u
dense/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	~А1*
shared_namedense/kernel
n
 dense/kernel/Read/ReadVariableOpReadVariableOpdense/kernel*
_output_shapes
:	~А1*
dtype0
z
serving_default_input_2Placeholder*'
_output_shapes
:€€€€€€€€€d*
dtype0*
shape:€€€€€€€€€d
z
serving_default_input_3Placeholder*'
_output_shapes
:€€€€€€€€€*
dtype0*
shape:€€€€€€€€€
Й	
StatefulPartitionedCallStatefulPartitionedCallserving_default_input_2serving_default_input_3dense/kernel
dense/biasbatch_normalization_94/gammabatch_normalization_94/beta"batch_normalization_94/moving_mean&batch_normalization_94/moving_varianceconv2d_transpose/kernelconv2d_transpose/biasbatch_normalization_95/gammabatch_normalization_95/beta"batch_normalization_95/moving_mean&batch_normalization_95/moving_varianceconv2d_transpose_1/kernelconv2d_transpose_1/biasbatch_normalization_96/gammabatch_normalization_96/beta"batch_normalization_96/moving_mean&batch_normalization_96/moving_varianceconv2d_transpose_2/kernelconv2d_transpose_2/biasbatch_normalization_97/gammabatch_normalization_97/beta"batch_normalization_97/moving_mean&batch_normalization_97/moving_varianceconv2d_transpose_3/kernelconv2d_transpose_3/bias*'
Tin 
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€*<
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8В *,
f'R%
#__inference_signature_wrapper_21015

NoOpNoOp
Иm
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*√l
valueєlBґl Bѓl
Щ
layer-0
layer-1
layer-2
layer_with_weights-0
layer-3
layer-4
layer_with_weights-1
layer-5
layer-6
layer_with_weights-2
layer-7
	layer_with_weights-3
	layer-8

layer-9
layer_with_weights-4
layer-10
layer_with_weights-5
layer-11
layer-12
layer_with_weights-6
layer-13
layer_with_weights-7
layer-14
layer-15
layer_with_weights-8
layer-16
layer-17
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
_default_save_signature

signatures*
* 
* 
О
	variables
trainable_variables
regularization_losses
	keras_api
__call__
* &call_and_return_all_conditional_losses* 
¶
!	variables
"trainable_variables
#regularization_losses
$	keras_api
%__call__
*&&call_and_return_all_conditional_losses

'kernel
(bias*
О
)	variables
*trainable_variables
+regularization_losses
,	keras_api
-__call__
*.&call_and_return_all_conditional_losses* 
’
/	variables
0trainable_variables
1regularization_losses
2	keras_api
3__call__
*4&call_and_return_all_conditional_losses
5axis
	6gamma
7beta
8moving_mean
9moving_variance*
О
:	variables
;trainable_variables
<regularization_losses
=	keras_api
>__call__
*?&call_and_return_all_conditional_losses* 
»
@	variables
Atrainable_variables
Bregularization_losses
C	keras_api
D__call__
*E&call_and_return_all_conditional_losses

Fkernel
Gbias
 H_jit_compiled_convolution_op*
’
I	variables
Jtrainable_variables
Kregularization_losses
L	keras_api
M__call__
*N&call_and_return_all_conditional_losses
Oaxis
	Pgamma
Qbeta
Rmoving_mean
Smoving_variance*
О
T	variables
Utrainable_variables
Vregularization_losses
W	keras_api
X__call__
*Y&call_and_return_all_conditional_losses* 
»
Z	variables
[trainable_variables
\regularization_losses
]	keras_api
^__call__
*_&call_and_return_all_conditional_losses

`kernel
abias
 b_jit_compiled_convolution_op*
’
c	variables
dtrainable_variables
eregularization_losses
f	keras_api
g__call__
*h&call_and_return_all_conditional_losses
iaxis
	jgamma
kbeta
lmoving_mean
mmoving_variance*
О
n	variables
otrainable_variables
pregularization_losses
q	keras_api
r__call__
*s&call_and_return_all_conditional_losses* 
»
t	variables
utrainable_variables
vregularization_losses
w	keras_api
x__call__
*y&call_and_return_all_conditional_losses

zkernel
{bias
 |_jit_compiled_convolution_op*
Ё
}	variables
~trainable_variables
regularization_losses
А	keras_api
Б__call__
+В&call_and_return_all_conditional_losses
	Гaxis

Дgamma
	Еbeta
Жmoving_mean
Зmoving_variance*
Ф
И	variables
Йtrainable_variables
Кregularization_losses
Л	keras_api
М__call__
+Н&call_and_return_all_conditional_losses* 
—
О	variables
Пtrainable_variables
Рregularization_losses
С	keras_api
Т__call__
+У&call_and_return_all_conditional_losses
Фkernel
	Хbias
!Ц_jit_compiled_convolution_op*
Ф
Ч	variables
Шtrainable_variables
Щregularization_losses
Ъ	keras_api
Ы__call__
+Ь&call_and_return_all_conditional_losses* 
–
'0
(1
62
73
84
95
F6
G7
P8
Q9
R10
S11
`12
a13
j14
k15
l16
m17
z18
{19
Д20
Е21
Ж22
З23
Ф24
Х25*
О
'0
(1
62
73
F4
G5
P6
Q7
`8
a9
j10
k11
z12
{13
Д14
Е15
Ф16
Х17*
* 
µ
Эnon_trainable_variables
Юlayers
Яmetrics
 †layer_regularization_losses
°layer_metrics
	variables
trainable_variables
regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*
:
Ґtrace_0
£trace_1
§trace_2
•trace_3* 
:
¶trace_0
Іtrace_1
®trace_2
©trace_3* 
* 

™serving_default* 
* 
* 
* 
Ц
Ђnon_trainable_variables
ђlayers
≠metrics
 Ѓlayer_regularization_losses
ѓlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
* &call_and_return_all_conditional_losses
& "call_and_return_conditional_losses* 

∞trace_0* 

±trace_0* 

'0
(1*

'0
(1*
* 
Ш
≤non_trainable_variables
≥layers
іmetrics
 µlayer_regularization_losses
ґlayer_metrics
!	variables
"trainable_variables
#regularization_losses
%__call__
*&&call_and_return_all_conditional_losses
&&"call_and_return_conditional_losses*

Јtrace_0* 

Єtrace_0* 
\V
VARIABLE_VALUEdense/kernel6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUE*
XR
VARIABLE_VALUE
dense/bias4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
Ц
єnon_trainable_variables
Їlayers
їmetrics
 Љlayer_regularization_losses
љlayer_metrics
)	variables
*trainable_variables
+regularization_losses
-__call__
*.&call_and_return_all_conditional_losses
&."call_and_return_conditional_losses* 

Њtrace_0* 

њtrace_0* 
 
60
71
82
93*

60
71*
* 
Ш
јnon_trainable_variables
Ѕlayers
¬metrics
 √layer_regularization_losses
ƒlayer_metrics
/	variables
0trainable_variables
1regularization_losses
3__call__
*4&call_and_return_all_conditional_losses
&4"call_and_return_conditional_losses*

≈trace_0
∆trace_1* 

«trace_0
»trace_1* 
* 
ke
VARIABLE_VALUEbatch_normalization_94/gamma5layer_with_weights-1/gamma/.ATTRIBUTES/VARIABLE_VALUE*
ic
VARIABLE_VALUEbatch_normalization_94/beta4layer_with_weights-1/beta/.ATTRIBUTES/VARIABLE_VALUE*
wq
VARIABLE_VALUE"batch_normalization_94/moving_mean;layer_with_weights-1/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*
y
VARIABLE_VALUE&batch_normalization_94/moving_variance?layer_with_weights-1/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
Ц
…non_trainable_variables
 layers
Ћmetrics
 ћlayer_regularization_losses
Ќlayer_metrics
:	variables
;trainable_variables
<regularization_losses
>__call__
*?&call_and_return_all_conditional_losses
&?"call_and_return_conditional_losses* 

ќtrace_0* 

ѕtrace_0* 

F0
G1*

F0
G1*
* 
Ш
–non_trainable_variables
—layers
“metrics
 ”layer_regularization_losses
‘layer_metrics
@	variables
Atrainable_variables
Bregularization_losses
D__call__
*E&call_and_return_all_conditional_losses
&E"call_and_return_conditional_losses*

’trace_0* 

÷trace_0* 
ga
VARIABLE_VALUEconv2d_transpose/kernel6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUE*
c]
VARIABLE_VALUEconv2d_transpose/bias4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 
 
P0
Q1
R2
S3*

P0
Q1*
* 
Ш
„non_trainable_variables
Ўlayers
ўmetrics
 Џlayer_regularization_losses
џlayer_metrics
I	variables
Jtrainable_variables
Kregularization_losses
M__call__
*N&call_and_return_all_conditional_losses
&N"call_and_return_conditional_losses*

№trace_0
Ёtrace_1* 

ёtrace_0
яtrace_1* 
* 
ke
VARIABLE_VALUEbatch_normalization_95/gamma5layer_with_weights-3/gamma/.ATTRIBUTES/VARIABLE_VALUE*
ic
VARIABLE_VALUEbatch_normalization_95/beta4layer_with_weights-3/beta/.ATTRIBUTES/VARIABLE_VALUE*
wq
VARIABLE_VALUE"batch_normalization_95/moving_mean;layer_with_weights-3/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*
y
VARIABLE_VALUE&batch_normalization_95/moving_variance?layer_with_weights-3/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
Ц
аnon_trainable_variables
бlayers
вmetrics
 гlayer_regularization_losses
дlayer_metrics
T	variables
Utrainable_variables
Vregularization_losses
X__call__
*Y&call_and_return_all_conditional_losses
&Y"call_and_return_conditional_losses* 

еtrace_0* 

жtrace_0* 

`0
a1*

`0
a1*
* 
Ш
зnon_trainable_variables
иlayers
йmetrics
 кlayer_regularization_losses
лlayer_metrics
Z	variables
[trainable_variables
\regularization_losses
^__call__
*_&call_and_return_all_conditional_losses
&_"call_and_return_conditional_losses*

мtrace_0* 

нtrace_0* 
ic
VARIABLE_VALUEconv2d_transpose_1/kernel6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUE*
e_
VARIABLE_VALUEconv2d_transpose_1/bias4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 
 
j0
k1
l2
m3*

j0
k1*
* 
Ш
оnon_trainable_variables
пlayers
рmetrics
 сlayer_regularization_losses
тlayer_metrics
c	variables
dtrainable_variables
eregularization_losses
g__call__
*h&call_and_return_all_conditional_losses
&h"call_and_return_conditional_losses*

уtrace_0
фtrace_1* 

хtrace_0
цtrace_1* 
* 
ke
VARIABLE_VALUEbatch_normalization_96/gamma5layer_with_weights-5/gamma/.ATTRIBUTES/VARIABLE_VALUE*
ic
VARIABLE_VALUEbatch_normalization_96/beta4layer_with_weights-5/beta/.ATTRIBUTES/VARIABLE_VALUE*
wq
VARIABLE_VALUE"batch_normalization_96/moving_mean;layer_with_weights-5/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*
y
VARIABLE_VALUE&batch_normalization_96/moving_variance?layer_with_weights-5/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
Ц
чnon_trainable_variables
шlayers
щmetrics
 ъlayer_regularization_losses
ыlayer_metrics
n	variables
otrainable_variables
pregularization_losses
r__call__
*s&call_and_return_all_conditional_losses
&s"call_and_return_conditional_losses* 

ьtrace_0* 

эtrace_0* 

z0
{1*

z0
{1*
* 
Ш
юnon_trainable_variables
€layers
Аmetrics
 Бlayer_regularization_losses
Вlayer_metrics
t	variables
utrainable_variables
vregularization_losses
x__call__
*y&call_and_return_all_conditional_losses
&y"call_and_return_conditional_losses*

Гtrace_0* 

Дtrace_0* 
ic
VARIABLE_VALUEconv2d_transpose_2/kernel6layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUE*
e_
VARIABLE_VALUEconv2d_transpose_2/bias4layer_with_weights-6/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 
$
Д0
Е1
Ж2
З3*

Д0
Е1*
* 
Ы
Еnon_trainable_variables
Жlayers
Зmetrics
 Иlayer_regularization_losses
Йlayer_metrics
}	variables
~trainable_variables
regularization_losses
Б__call__
+В&call_and_return_all_conditional_losses
'В"call_and_return_conditional_losses*

Кtrace_0
Лtrace_1* 

Мtrace_0
Нtrace_1* 
* 
ke
VARIABLE_VALUEbatch_normalization_97/gamma5layer_with_weights-7/gamma/.ATTRIBUTES/VARIABLE_VALUE*
ic
VARIABLE_VALUEbatch_normalization_97/beta4layer_with_weights-7/beta/.ATTRIBUTES/VARIABLE_VALUE*
wq
VARIABLE_VALUE"batch_normalization_97/moving_mean;layer_with_weights-7/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*
y
VARIABLE_VALUE&batch_normalization_97/moving_variance?layer_with_weights-7/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
Ь
Оnon_trainable_variables
Пlayers
Рmetrics
 Сlayer_regularization_losses
Тlayer_metrics
И	variables
Йtrainable_variables
Кregularization_losses
М__call__
+Н&call_and_return_all_conditional_losses
'Н"call_and_return_conditional_losses* 

Уtrace_0* 

Фtrace_0* 

Ф0
Х1*

Ф0
Х1*
* 
Ю
Хnon_trainable_variables
Цlayers
Чmetrics
 Шlayer_regularization_losses
Щlayer_metrics
О	variables
Пtrainable_variables
Рregularization_losses
Т__call__
+У&call_and_return_all_conditional_losses
'У"call_and_return_conditional_losses*

Ъtrace_0* 

Ыtrace_0* 
ic
VARIABLE_VALUEconv2d_transpose_3/kernel6layer_with_weights-8/kernel/.ATTRIBUTES/VARIABLE_VALUE*
e_
VARIABLE_VALUEconv2d_transpose_3/bias4layer_with_weights-8/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
* 
Ь
Ьnon_trainable_variables
Эlayers
Юmetrics
 Яlayer_regularization_losses
†layer_metrics
Ч	variables
Шtrainable_variables
Щregularization_losses
Ы__call__
+Ь&call_and_return_all_conditional_losses
'Ь"call_and_return_conditional_losses* 

°trace_0* 

Ґtrace_0* 
>
80
91
R2
S3
l4
m5
Ж6
З7*
К
0
1
2
3
4
5
6
7
	8

9
10
11
12
13
14
15
16
17*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 

80
91*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 

R0
S1*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 

l0
m1*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 

Ж0
З1*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
Њ
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename dense/kernel/Read/ReadVariableOpdense/bias/Read/ReadVariableOp0batch_normalization_94/gamma/Read/ReadVariableOp/batch_normalization_94/beta/Read/ReadVariableOp6batch_normalization_94/moving_mean/Read/ReadVariableOp:batch_normalization_94/moving_variance/Read/ReadVariableOp+conv2d_transpose/kernel/Read/ReadVariableOp)conv2d_transpose/bias/Read/ReadVariableOp0batch_normalization_95/gamma/Read/ReadVariableOp/batch_normalization_95/beta/Read/ReadVariableOp6batch_normalization_95/moving_mean/Read/ReadVariableOp:batch_normalization_95/moving_variance/Read/ReadVariableOp-conv2d_transpose_1/kernel/Read/ReadVariableOp+conv2d_transpose_1/bias/Read/ReadVariableOp0batch_normalization_96/gamma/Read/ReadVariableOp/batch_normalization_96/beta/Read/ReadVariableOp6batch_normalization_96/moving_mean/Read/ReadVariableOp:batch_normalization_96/moving_variance/Read/ReadVariableOp-conv2d_transpose_2/kernel/Read/ReadVariableOp+conv2d_transpose_2/bias/Read/ReadVariableOp0batch_normalization_97/gamma/Read/ReadVariableOp/batch_normalization_97/beta/Read/ReadVariableOp6batch_normalization_97/moving_mean/Read/ReadVariableOp:batch_normalization_97/moving_variance/Read/ReadVariableOp-conv2d_transpose_3/kernel/Read/ReadVariableOp+conv2d_transpose_3/bias/Read/ReadVariableOpConst*'
Tin 
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *'
f"R 
__inference__traced_save_22070
±
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenamedense/kernel
dense/biasbatch_normalization_94/gammabatch_normalization_94/beta"batch_normalization_94/moving_mean&batch_normalization_94/moving_varianceconv2d_transpose/kernelconv2d_transpose/biasbatch_normalization_95/gammabatch_normalization_95/beta"batch_normalization_95/moving_mean&batch_normalization_95/moving_varianceconv2d_transpose_1/kernelconv2d_transpose_1/biasbatch_normalization_96/gammabatch_normalization_96/beta"batch_normalization_96/moving_mean&batch_normalization_96/moving_varianceconv2d_transpose_2/kernelconv2d_transpose_2/biasbatch_normalization_97/gammabatch_normalization_97/beta"batch_normalization_97/moving_mean&batch_normalization_97/moving_varianceconv2d_transpose_3/kernelconv2d_transpose_3/bias*&
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В **
f%R#
!__inference__traced_restore_22158цс
р
d
H__inference_activation_95_layer_call_and_return_conditional_losses_20397

inputs
identityO
ReluReluinputs*
T0*0
_output_shapes
:€€€€€€€€€Аc
IdentityIdentityRelu:activations:0*
T0*0
_output_shapes
:€€€€€€€€€А"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:€€€€€€€€€А:X T
0
_output_shapes
:€€€€€€€€€А
 
_user_specified_nameinputs
е
…
)__inference_generator_layer_call_fn_20809
input_2
input_3
unknown:	~А1
	unknown_0:	А1
	unknown_1:	А
	unknown_2:	А
	unknown_3:	А
	unknown_4:	А%
	unknown_5:АА
	unknown_6:	А
	unknown_7:	А
	unknown_8:	А
	unknown_9:	А

unknown_10:	А%

unknown_11:@А

unknown_12:@

unknown_13:@

unknown_14:@

unknown_15:@

unknown_16:@$

unknown_17: @

unknown_18: 

unknown_19: 

unknown_20: 

unknown_21: 

unknown_22: $

unknown_23: 

unknown_24:
identityИҐStatefulPartitionedCallЂ
StatefulPartitionedCallStatefulPartitionedCallinput_2input_3unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20
unknown_21
unknown_22
unknown_23
unknown_24*'
Tin 
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€*4
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8В *M
fHRF
D__inference_generator_layer_call_and_return_conditional_losses_20696w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:€€€€€€€€€`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*m
_input_shapes\
Z:€€€€€€€€€d:€€€€€€€€€: : : : : : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
'
_output_shapes
:€€€€€€€€€d
!
_user_specified_name	input_2:PL
'
_output_shapes
:€€€€€€€€€
!
_user_specified_name	input_3
…
I
-__inference_activation_95_layer_call_fn_21683

inputs
identityЉ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_activation_95_layer_call_and_return_conditional_losses_20397i
IdentityIdentityPartitionedCall:output:0*
T0*0
_output_shapes
:€€€€€€€€€А"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:€€€€€€€€€А:X T
0
_output_shapes
:€€€€€€€€€А
 
_user_specified_nameinputs
П	
—
6__inference_batch_normalization_96_layer_call_fn_21756

inputs
unknown:@
	unknown_0:@
	unknown_1:@
	unknown_2:@
identityИҐStatefulPartitionedCallШ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *Z
fURS
Q__inference_batch_normalization_96_layer_call_and_return_conditional_losses_20149Й
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+€€€€€€€€€€€€€€€€€€€€€€€€€€€@: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€@
 
_user_specified_nameinputs
÷»
Ы
D__inference_generator_layer_call_and_return_conditional_losses_21291
inputs_0
inputs_17
$dense_matmul_readvariableop_resource:	~А14
%dense_biasadd_readvariableop_resource:	А1=
.batch_normalization_94_readvariableop_resource:	А?
0batch_normalization_94_readvariableop_1_resource:	АN
?batch_normalization_94_fusedbatchnormv3_readvariableop_resource:	АP
Abatch_normalization_94_fusedbatchnormv3_readvariableop_1_resource:	АU
9conv2d_transpose_conv2d_transpose_readvariableop_resource:АА?
0conv2d_transpose_biasadd_readvariableop_resource:	А=
.batch_normalization_95_readvariableop_resource:	А?
0batch_normalization_95_readvariableop_1_resource:	АN
?batch_normalization_95_fusedbatchnormv3_readvariableop_resource:	АP
Abatch_normalization_95_fusedbatchnormv3_readvariableop_1_resource:	АV
;conv2d_transpose_1_conv2d_transpose_readvariableop_resource:@А@
2conv2d_transpose_1_biasadd_readvariableop_resource:@<
.batch_normalization_96_readvariableop_resource:@>
0batch_normalization_96_readvariableop_1_resource:@M
?batch_normalization_96_fusedbatchnormv3_readvariableop_resource:@O
Abatch_normalization_96_fusedbatchnormv3_readvariableop_1_resource:@U
;conv2d_transpose_2_conv2d_transpose_readvariableop_resource: @@
2conv2d_transpose_2_biasadd_readvariableop_resource: <
.batch_normalization_97_readvariableop_resource: >
0batch_normalization_97_readvariableop_1_resource: M
?batch_normalization_97_fusedbatchnormv3_readvariableop_resource: O
Abatch_normalization_97_fusedbatchnormv3_readvariableop_1_resource: U
;conv2d_transpose_3_conv2d_transpose_readvariableop_resource: @
2conv2d_transpose_3_biasadd_readvariableop_resource:
identityИҐ6batch_normalization_94/FusedBatchNormV3/ReadVariableOpҐ8batch_normalization_94/FusedBatchNormV3/ReadVariableOp_1Ґ%batch_normalization_94/ReadVariableOpҐ'batch_normalization_94/ReadVariableOp_1Ґ6batch_normalization_95/FusedBatchNormV3/ReadVariableOpҐ8batch_normalization_95/FusedBatchNormV3/ReadVariableOp_1Ґ%batch_normalization_95/ReadVariableOpҐ'batch_normalization_95/ReadVariableOp_1Ґ6batch_normalization_96/FusedBatchNormV3/ReadVariableOpҐ8batch_normalization_96/FusedBatchNormV3/ReadVariableOp_1Ґ%batch_normalization_96/ReadVariableOpҐ'batch_normalization_96/ReadVariableOp_1Ґ6batch_normalization_97/FusedBatchNormV3/ReadVariableOpҐ8batch_normalization_97/FusedBatchNormV3/ReadVariableOp_1Ґ%batch_normalization_97/ReadVariableOpҐ'batch_normalization_97/ReadVariableOp_1Ґ'conv2d_transpose/BiasAdd/ReadVariableOpҐ0conv2d_transpose/conv2d_transpose/ReadVariableOpҐ)conv2d_transpose_1/BiasAdd/ReadVariableOpҐ2conv2d_transpose_1/conv2d_transpose/ReadVariableOpҐ)conv2d_transpose_2/BiasAdd/ReadVariableOpҐ2conv2d_transpose_2/conv2d_transpose/ReadVariableOpҐ)conv2d_transpose_3/BiasAdd/ReadVariableOpҐ2conv2d_transpose_3/conv2d_transpose/ReadVariableOpҐdense/BiasAdd/ReadVariableOpҐdense/MatMul/ReadVariableOp[
concatenate_2/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :У
concatenate_2/concatConcatV2inputs_0inputs_1"concatenate_2/concat/axis:output:0*
N*
T0*'
_output_shapes
:€€€€€€€€€~Б
dense/MatMul/ReadVariableOpReadVariableOp$dense_matmul_readvariableop_resource*
_output_shapes
:	~А1*
dtype0Н
dense/MatMulMatMulconcatenate_2/concat:output:0#dense/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:€€€€€€€€€А1
dense/BiasAdd/ReadVariableOpReadVariableOp%dense_biasadd_readvariableop_resource*
_output_shapes	
:А1*
dtype0Й
dense/BiasAddBiasAdddense/MatMul:product:0$dense/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:€€€€€€€€€А1S
reshape/ShapeShapedense/BiasAdd:output:0*
T0*
_output_shapes
:e
reshape/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: g
reshape/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:g
reshape/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:щ
reshape/strided_sliceStridedSlicereshape/Shape:output:0$reshape/strided_slice/stack:output:0&reshape/strided_slice/stack_1:output:0&reshape/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskY
reshape/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :Y
reshape/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :Z
reshape/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value
B :А—
reshape/Reshape/shapePackreshape/strided_slice:output:0 reshape/Reshape/shape/1:output:0 reshape/Reshape/shape/2:output:0 reshape/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:Н
reshape/ReshapeReshapedense/BiasAdd:output:0reshape/Reshape/shape:output:0*
T0*0
_output_shapes
:€€€€€€€€€АС
%batch_normalization_94/ReadVariableOpReadVariableOp.batch_normalization_94_readvariableop_resource*
_output_shapes	
:А*
dtype0Х
'batch_normalization_94/ReadVariableOp_1ReadVariableOp0batch_normalization_94_readvariableop_1_resource*
_output_shapes	
:А*
dtype0≥
6batch_normalization_94/FusedBatchNormV3/ReadVariableOpReadVariableOp?batch_normalization_94_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:А*
dtype0Ј
8batch_normalization_94/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpAbatch_normalization_94_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:А*
dtype0ј
'batch_normalization_94/FusedBatchNormV3FusedBatchNormV3reshape/Reshape:output:0-batch_normalization_94/ReadVariableOp:value:0/batch_normalization_94/ReadVariableOp_1:value:0>batch_normalization_94/FusedBatchNormV3/ReadVariableOp:value:0@batch_normalization_94/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:€€€€€€€€€А:А:А:А:А:*
epsilon%oГ:*
is_training( В
activation_94/ReluRelu+batch_normalization_94/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:€€€€€€€€€Аf
conv2d_transpose/ShapeShape activation_94/Relu:activations:0*
T0*
_output_shapes
:n
$conv2d_transpose/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: p
&conv2d_transpose/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:p
&conv2d_transpose/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:¶
conv2d_transpose/strided_sliceStridedSliceconv2d_transpose/Shape:output:0-conv2d_transpose/strided_slice/stack:output:0/conv2d_transpose/strided_slice/stack_1:output:0/conv2d_transpose/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskZ
conv2d_transpose/stack/1Const*
_output_shapes
: *
dtype0*
value	B :Z
conv2d_transpose/stack/2Const*
_output_shapes
: *
dtype0*
value	B :[
conv2d_transpose/stack/3Const*
_output_shapes
: *
dtype0*
value
B :Аё
conv2d_transpose/stackPack'conv2d_transpose/strided_slice:output:0!conv2d_transpose/stack/1:output:0!conv2d_transpose/stack/2:output:0!conv2d_transpose/stack/3:output:0*
N*
T0*
_output_shapes
:p
&conv2d_transpose/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: r
(conv2d_transpose/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:r
(conv2d_transpose/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ѓ
 conv2d_transpose/strided_slice_1StridedSliceconv2d_transpose/stack:output:0/conv2d_transpose/strided_slice_1/stack:output:01conv2d_transpose/strided_slice_1/stack_1:output:01conv2d_transpose/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskі
0conv2d_transpose/conv2d_transpose/ReadVariableOpReadVariableOp9conv2d_transpose_conv2d_transpose_readvariableop_resource*(
_output_shapes
:АА*
dtype0Ш
!conv2d_transpose/conv2d_transposeConv2DBackpropInputconv2d_transpose/stack:output:08conv2d_transpose/conv2d_transpose/ReadVariableOp:value:0 activation_94/Relu:activations:0*
T0*0
_output_shapes
:€€€€€€€€€А*
paddingSAME*
strides
Х
'conv2d_transpose/BiasAdd/ReadVariableOpReadVariableOp0conv2d_transpose_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0ї
conv2d_transpose/BiasAddBiasAdd*conv2d_transpose/conv2d_transpose:output:0/conv2d_transpose/BiasAdd/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€АС
%batch_normalization_95/ReadVariableOpReadVariableOp.batch_normalization_95_readvariableop_resource*
_output_shapes	
:А*
dtype0Х
'batch_normalization_95/ReadVariableOp_1ReadVariableOp0batch_normalization_95_readvariableop_1_resource*
_output_shapes	
:А*
dtype0≥
6batch_normalization_95/FusedBatchNormV3/ReadVariableOpReadVariableOp?batch_normalization_95_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:А*
dtype0Ј
8batch_normalization_95/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpAbatch_normalization_95_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:А*
dtype0…
'batch_normalization_95/FusedBatchNormV3FusedBatchNormV3!conv2d_transpose/BiasAdd:output:0-batch_normalization_95/ReadVariableOp:value:0/batch_normalization_95/ReadVariableOp_1:value:0>batch_normalization_95/FusedBatchNormV3/ReadVariableOp:value:0@batch_normalization_95/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:€€€€€€€€€А:А:А:А:А:*
epsilon%oГ:*
is_training( В
activation_95/ReluRelu+batch_normalization_95/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:€€€€€€€€€Аh
conv2d_transpose_1/ShapeShape activation_95/Relu:activations:0*
T0*
_output_shapes
:p
&conv2d_transpose_1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: r
(conv2d_transpose_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:r
(conv2d_transpose_1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:∞
 conv2d_transpose_1/strided_sliceStridedSlice!conv2d_transpose_1/Shape:output:0/conv2d_transpose_1/strided_slice/stack:output:01conv2d_transpose_1/strided_slice/stack_1:output:01conv2d_transpose_1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask\
conv2d_transpose_1/stack/1Const*
_output_shapes
: *
dtype0*
value	B :\
conv2d_transpose_1/stack/2Const*
_output_shapes
: *
dtype0*
value	B :\
conv2d_transpose_1/stack/3Const*
_output_shapes
: *
dtype0*
value	B :@и
conv2d_transpose_1/stackPack)conv2d_transpose_1/strided_slice:output:0#conv2d_transpose_1/stack/1:output:0#conv2d_transpose_1/stack/2:output:0#conv2d_transpose_1/stack/3:output:0*
N*
T0*
_output_shapes
:r
(conv2d_transpose_1/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: t
*conv2d_transpose_1/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:t
*conv2d_transpose_1/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Є
"conv2d_transpose_1/strided_slice_1StridedSlice!conv2d_transpose_1/stack:output:01conv2d_transpose_1/strided_slice_1/stack:output:03conv2d_transpose_1/strided_slice_1/stack_1:output:03conv2d_transpose_1/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskЈ
2conv2d_transpose_1/conv2d_transpose/ReadVariableOpReadVariableOp;conv2d_transpose_1_conv2d_transpose_readvariableop_resource*'
_output_shapes
:@А*
dtype0Э
#conv2d_transpose_1/conv2d_transposeConv2DBackpropInput!conv2d_transpose_1/stack:output:0:conv2d_transpose_1/conv2d_transpose/ReadVariableOp:value:0 activation_95/Relu:activations:0*
T0*/
_output_shapes
:€€€€€€€€€@*
paddingSAME*
strides
Ш
)conv2d_transpose_1/BiasAdd/ReadVariableOpReadVariableOp2conv2d_transpose_1_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0ј
conv2d_transpose_1/BiasAddBiasAdd,conv2d_transpose_1/conv2d_transpose:output:01conv2d_transpose_1/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@Р
%batch_normalization_96/ReadVariableOpReadVariableOp.batch_normalization_96_readvariableop_resource*
_output_shapes
:@*
dtype0Ф
'batch_normalization_96/ReadVariableOp_1ReadVariableOp0batch_normalization_96_readvariableop_1_resource*
_output_shapes
:@*
dtype0≤
6batch_normalization_96/FusedBatchNormV3/ReadVariableOpReadVariableOp?batch_normalization_96_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:@*
dtype0ґ
8batch_normalization_96/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpAbatch_normalization_96_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:@*
dtype0∆
'batch_normalization_96/FusedBatchNormV3FusedBatchNormV3#conv2d_transpose_1/BiasAdd:output:0-batch_normalization_96/ReadVariableOp:value:0/batch_normalization_96/ReadVariableOp_1:value:0>batch_normalization_96/FusedBatchNormV3/ReadVariableOp:value:0@batch_normalization_96/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:€€€€€€€€€@:@:@:@:@:*
epsilon%oГ:*
is_training( Б
activation_96/ReluRelu+batch_normalization_96/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:€€€€€€€€€@h
conv2d_transpose_2/ShapeShape activation_96/Relu:activations:0*
T0*
_output_shapes
:p
&conv2d_transpose_2/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: r
(conv2d_transpose_2/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:r
(conv2d_transpose_2/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:∞
 conv2d_transpose_2/strided_sliceStridedSlice!conv2d_transpose_2/Shape:output:0/conv2d_transpose_2/strided_slice/stack:output:01conv2d_transpose_2/strided_slice/stack_1:output:01conv2d_transpose_2/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask\
conv2d_transpose_2/stack/1Const*
_output_shapes
: *
dtype0*
value	B :\
conv2d_transpose_2/stack/2Const*
_output_shapes
: *
dtype0*
value	B :\
conv2d_transpose_2/stack/3Const*
_output_shapes
: *
dtype0*
value	B : и
conv2d_transpose_2/stackPack)conv2d_transpose_2/strided_slice:output:0#conv2d_transpose_2/stack/1:output:0#conv2d_transpose_2/stack/2:output:0#conv2d_transpose_2/stack/3:output:0*
N*
T0*
_output_shapes
:r
(conv2d_transpose_2/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: t
*conv2d_transpose_2/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:t
*conv2d_transpose_2/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Є
"conv2d_transpose_2/strided_slice_1StridedSlice!conv2d_transpose_2/stack:output:01conv2d_transpose_2/strided_slice_1/stack:output:03conv2d_transpose_2/strided_slice_1/stack_1:output:03conv2d_transpose_2/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskґ
2conv2d_transpose_2/conv2d_transpose/ReadVariableOpReadVariableOp;conv2d_transpose_2_conv2d_transpose_readvariableop_resource*&
_output_shapes
: @*
dtype0Э
#conv2d_transpose_2/conv2d_transposeConv2DBackpropInput!conv2d_transpose_2/stack:output:0:conv2d_transpose_2/conv2d_transpose/ReadVariableOp:value:0 activation_96/Relu:activations:0*
T0*/
_output_shapes
:€€€€€€€€€ *
paddingSAME*
strides
Ш
)conv2d_transpose_2/BiasAdd/ReadVariableOpReadVariableOp2conv2d_transpose_2_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0ј
conv2d_transpose_2/BiasAddBiasAdd,conv2d_transpose_2/conv2d_transpose:output:01conv2d_transpose_2/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€ Р
%batch_normalization_97/ReadVariableOpReadVariableOp.batch_normalization_97_readvariableop_resource*
_output_shapes
: *
dtype0Ф
'batch_normalization_97/ReadVariableOp_1ReadVariableOp0batch_normalization_97_readvariableop_1_resource*
_output_shapes
: *
dtype0≤
6batch_normalization_97/FusedBatchNormV3/ReadVariableOpReadVariableOp?batch_normalization_97_fusedbatchnormv3_readvariableop_resource*
_output_shapes
: *
dtype0ґ
8batch_normalization_97/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpAbatch_normalization_97_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
: *
dtype0∆
'batch_normalization_97/FusedBatchNormV3FusedBatchNormV3#conv2d_transpose_2/BiasAdd:output:0-batch_normalization_97/ReadVariableOp:value:0/batch_normalization_97/ReadVariableOp_1:value:0>batch_normalization_97/FusedBatchNormV3/ReadVariableOp:value:0@batch_normalization_97/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:€€€€€€€€€ : : : : :*
epsilon%oГ:*
is_training( Б
activation_97/ReluRelu+batch_normalization_97/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:€€€€€€€€€ h
conv2d_transpose_3/ShapeShape activation_97/Relu:activations:0*
T0*
_output_shapes
:p
&conv2d_transpose_3/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: r
(conv2d_transpose_3/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:r
(conv2d_transpose_3/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:∞
 conv2d_transpose_3/strided_sliceStridedSlice!conv2d_transpose_3/Shape:output:0/conv2d_transpose_3/strided_slice/stack:output:01conv2d_transpose_3/strided_slice/stack_1:output:01conv2d_transpose_3/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask\
conv2d_transpose_3/stack/1Const*
_output_shapes
: *
dtype0*
value	B :\
conv2d_transpose_3/stack/2Const*
_output_shapes
: *
dtype0*
value	B :\
conv2d_transpose_3/stack/3Const*
_output_shapes
: *
dtype0*
value	B :и
conv2d_transpose_3/stackPack)conv2d_transpose_3/strided_slice:output:0#conv2d_transpose_3/stack/1:output:0#conv2d_transpose_3/stack/2:output:0#conv2d_transpose_3/stack/3:output:0*
N*
T0*
_output_shapes
:r
(conv2d_transpose_3/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: t
*conv2d_transpose_3/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:t
*conv2d_transpose_3/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Є
"conv2d_transpose_3/strided_slice_1StridedSlice!conv2d_transpose_3/stack:output:01conv2d_transpose_3/strided_slice_1/stack:output:03conv2d_transpose_3/strided_slice_1/stack_1:output:03conv2d_transpose_3/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskґ
2conv2d_transpose_3/conv2d_transpose/ReadVariableOpReadVariableOp;conv2d_transpose_3_conv2d_transpose_readvariableop_resource*&
_output_shapes
: *
dtype0Э
#conv2d_transpose_3/conv2d_transposeConv2DBackpropInput!conv2d_transpose_3/stack:output:0:conv2d_transpose_3/conv2d_transpose/ReadVariableOp:value:0 activation_97/Relu:activations:0*
T0*/
_output_shapes
:€€€€€€€€€*
paddingSAME*
strides
Ш
)conv2d_transpose_3/BiasAdd/ReadVariableOpReadVariableOp2conv2d_transpose_3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0ј
conv2d_transpose_3/BiasAddBiasAdd,conv2d_transpose_3/conv2d_transpose:output:01conv2d_transpose_3/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€y
activation_98/TanhTanh#conv2d_transpose_3/BiasAdd:output:0*
T0*/
_output_shapes
:€€€€€€€€€m
IdentityIdentityactivation_98/Tanh:y:0^NoOp*
T0*/
_output_shapes
:€€€€€€€€€Ы

NoOpNoOp7^batch_normalization_94/FusedBatchNormV3/ReadVariableOp9^batch_normalization_94/FusedBatchNormV3/ReadVariableOp_1&^batch_normalization_94/ReadVariableOp(^batch_normalization_94/ReadVariableOp_17^batch_normalization_95/FusedBatchNormV3/ReadVariableOp9^batch_normalization_95/FusedBatchNormV3/ReadVariableOp_1&^batch_normalization_95/ReadVariableOp(^batch_normalization_95/ReadVariableOp_17^batch_normalization_96/FusedBatchNormV3/ReadVariableOp9^batch_normalization_96/FusedBatchNormV3/ReadVariableOp_1&^batch_normalization_96/ReadVariableOp(^batch_normalization_96/ReadVariableOp_17^batch_normalization_97/FusedBatchNormV3/ReadVariableOp9^batch_normalization_97/FusedBatchNormV3/ReadVariableOp_1&^batch_normalization_97/ReadVariableOp(^batch_normalization_97/ReadVariableOp_1(^conv2d_transpose/BiasAdd/ReadVariableOp1^conv2d_transpose/conv2d_transpose/ReadVariableOp*^conv2d_transpose_1/BiasAdd/ReadVariableOp3^conv2d_transpose_1/conv2d_transpose/ReadVariableOp*^conv2d_transpose_2/BiasAdd/ReadVariableOp3^conv2d_transpose_2/conv2d_transpose/ReadVariableOp*^conv2d_transpose_3/BiasAdd/ReadVariableOp3^conv2d_transpose_3/conv2d_transpose/ReadVariableOp^dense/BiasAdd/ReadVariableOp^dense/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*m
_input_shapes\
Z:€€€€€€€€€d:€€€€€€€€€: : : : : : : : : : : : : : : : : : : : : : : : : : 2p
6batch_normalization_94/FusedBatchNormV3/ReadVariableOp6batch_normalization_94/FusedBatchNormV3/ReadVariableOp2t
8batch_normalization_94/FusedBatchNormV3/ReadVariableOp_18batch_normalization_94/FusedBatchNormV3/ReadVariableOp_12N
%batch_normalization_94/ReadVariableOp%batch_normalization_94/ReadVariableOp2R
'batch_normalization_94/ReadVariableOp_1'batch_normalization_94/ReadVariableOp_12p
6batch_normalization_95/FusedBatchNormV3/ReadVariableOp6batch_normalization_95/FusedBatchNormV3/ReadVariableOp2t
8batch_normalization_95/FusedBatchNormV3/ReadVariableOp_18batch_normalization_95/FusedBatchNormV3/ReadVariableOp_12N
%batch_normalization_95/ReadVariableOp%batch_normalization_95/ReadVariableOp2R
'batch_normalization_95/ReadVariableOp_1'batch_normalization_95/ReadVariableOp_12p
6batch_normalization_96/FusedBatchNormV3/ReadVariableOp6batch_normalization_96/FusedBatchNormV3/ReadVariableOp2t
8batch_normalization_96/FusedBatchNormV3/ReadVariableOp_18batch_normalization_96/FusedBatchNormV3/ReadVariableOp_12N
%batch_normalization_96/ReadVariableOp%batch_normalization_96/ReadVariableOp2R
'batch_normalization_96/ReadVariableOp_1'batch_normalization_96/ReadVariableOp_12p
6batch_normalization_97/FusedBatchNormV3/ReadVariableOp6batch_normalization_97/FusedBatchNormV3/ReadVariableOp2t
8batch_normalization_97/FusedBatchNormV3/ReadVariableOp_18batch_normalization_97/FusedBatchNormV3/ReadVariableOp_12N
%batch_normalization_97/ReadVariableOp%batch_normalization_97/ReadVariableOp2R
'batch_normalization_97/ReadVariableOp_1'batch_normalization_97/ReadVariableOp_12R
'conv2d_transpose/BiasAdd/ReadVariableOp'conv2d_transpose/BiasAdd/ReadVariableOp2d
0conv2d_transpose/conv2d_transpose/ReadVariableOp0conv2d_transpose/conv2d_transpose/ReadVariableOp2V
)conv2d_transpose_1/BiasAdd/ReadVariableOp)conv2d_transpose_1/BiasAdd/ReadVariableOp2h
2conv2d_transpose_1/conv2d_transpose/ReadVariableOp2conv2d_transpose_1/conv2d_transpose/ReadVariableOp2V
)conv2d_transpose_2/BiasAdd/ReadVariableOp)conv2d_transpose_2/BiasAdd/ReadVariableOp2h
2conv2d_transpose_2/conv2d_transpose/ReadVariableOp2conv2d_transpose_2/conv2d_transpose/ReadVariableOp2V
)conv2d_transpose_3/BiasAdd/ReadVariableOp)conv2d_transpose_3/BiasAdd/ReadVariableOp2h
2conv2d_transpose_3/conv2d_transpose/ReadVariableOp2conv2d_transpose_3/conv2d_transpose/ReadVariableOp2<
dense/BiasAdd/ReadVariableOpdense/BiasAdd/ReadVariableOp2:
dense/MatMul/ReadVariableOpdense/MatMul/ReadVariableOp:Q M
'
_output_shapes
:€€€€€€€€€d
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:€€€€€€€€€
"
_user_specified_name
inputs/1
аP
ы
D__inference_generator_layer_call_and_return_conditional_losses_20454

inputs
inputs_1
dense_20341:	~А1
dense_20343:	А1+
batch_normalization_94_20362:	А+
batch_normalization_94_20364:	А+
batch_normalization_94_20366:	А+
batch_normalization_94_20368:	А2
conv2d_transpose_20378:АА%
conv2d_transpose_20380:	А+
batch_normalization_95_20383:	А+
batch_normalization_95_20385:	А+
batch_normalization_95_20387:	А+
batch_normalization_95_20389:	А3
conv2d_transpose_1_20399:@А&
conv2d_transpose_1_20401:@*
batch_normalization_96_20404:@*
batch_normalization_96_20406:@*
batch_normalization_96_20408:@*
batch_normalization_96_20410:@2
conv2d_transpose_2_20420: @&
conv2d_transpose_2_20422: *
batch_normalization_97_20425: *
batch_normalization_97_20427: *
batch_normalization_97_20429: *
batch_normalization_97_20431: 2
conv2d_transpose_3_20441: &
conv2d_transpose_3_20443:
identityИҐ.batch_normalization_94/StatefulPartitionedCallҐ.batch_normalization_95/StatefulPartitionedCallҐ.batch_normalization_96/StatefulPartitionedCallҐ.batch_normalization_97/StatefulPartitionedCallҐ(conv2d_transpose/StatefulPartitionedCallҐ*conv2d_transpose_1/StatefulPartitionedCallҐ*conv2d_transpose_2/StatefulPartitionedCallҐ*conv2d_transpose_3/StatefulPartitionedCallҐdense/StatefulPartitionedCallћ
concatenate_2/PartitionedCallPartitionedCallinputsinputs_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€~* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_concatenate_2_layer_call_and_return_conditional_losses_20328В
dense/StatefulPartitionedCallStatefulPartitionedCall&concatenate_2/PartitionedCall:output:0dense_20341dense_20343*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:€€€€€€€€€А1*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *I
fDRB
@__inference_dense_layer_call_and_return_conditional_losses_20340ё
reshape/PartitionedCallPartitionedCall&dense/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *K
fFRD
B__inference_reshape_layer_call_and_return_conditional_losses_20360И
.batch_normalization_94/StatefulPartitionedCallStatefulPartitionedCall reshape/PartitionedCall:output:0batch_normalization_94_20362batch_normalization_94_20364batch_normalization_94_20366batch_normalization_94_20368*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *Z
fURS
Q__inference_batch_normalization_94_layer_call_and_return_conditional_losses_19902ы
activation_94/PartitionedCallPartitionedCall7batch_normalization_94/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_activation_94_layer_call_and_return_conditional_losses_20376ґ
(conv2d_transpose/StatefulPartitionedCallStatefulPartitionedCall&activation_94/PartitionedCall:output:0conv2d_transpose_20378conv2d_transpose_20380*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *T
fORM
K__inference_conv2d_transpose_layer_call_and_return_conditional_losses_19981Щ
.batch_normalization_95/StatefulPartitionedCallStatefulPartitionedCall1conv2d_transpose/StatefulPartitionedCall:output:0batch_normalization_95_20383batch_normalization_95_20385batch_normalization_95_20387batch_normalization_95_20389*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *Z
fURS
Q__inference_batch_normalization_95_layer_call_and_return_conditional_losses_20010ы
activation_95/PartitionedCallPartitionedCall7batch_normalization_95/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_activation_95_layer_call_and_return_conditional_losses_20397љ
*conv2d_transpose_1/StatefulPartitionedCallStatefulPartitionedCall&activation_95/PartitionedCall:output:0conv2d_transpose_1_20399conv2d_transpose_1_20401*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *V
fQRO
M__inference_conv2d_transpose_1_layer_call_and_return_conditional_losses_20089Ъ
.batch_normalization_96/StatefulPartitionedCallStatefulPartitionedCall3conv2d_transpose_1/StatefulPartitionedCall:output:0batch_normalization_96_20404batch_normalization_96_20406batch_normalization_96_20408batch_normalization_96_20410*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€@*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *Z
fURS
Q__inference_batch_normalization_96_layer_call_and_return_conditional_losses_20118ъ
activation_96/PartitionedCallPartitionedCall7batch_normalization_96/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_activation_96_layer_call_and_return_conditional_losses_20418љ
*conv2d_transpose_2/StatefulPartitionedCallStatefulPartitionedCall&activation_96/PartitionedCall:output:0conv2d_transpose_2_20420conv2d_transpose_2_20422*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€ *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *V
fQRO
M__inference_conv2d_transpose_2_layer_call_and_return_conditional_losses_20197Ъ
.batch_normalization_97/StatefulPartitionedCallStatefulPartitionedCall3conv2d_transpose_2/StatefulPartitionedCall:output:0batch_normalization_97_20425batch_normalization_97_20427batch_normalization_97_20429batch_normalization_97_20431*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€ *&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *Z
fURS
Q__inference_batch_normalization_97_layer_call_and_return_conditional_losses_20226ъ
activation_97/PartitionedCallPartitionedCall7batch_normalization_97/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€ * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_activation_97_layer_call_and_return_conditional_losses_20439љ
*conv2d_transpose_3/StatefulPartitionedCallStatefulPartitionedCall&activation_97/PartitionedCall:output:0conv2d_transpose_3_20441conv2d_transpose_3_20443*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *V
fQRO
M__inference_conv2d_transpose_3_layer_call_and_return_conditional_losses_20305ц
activation_98/PartitionedCallPartitionedCall3conv2d_transpose_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_activation_98_layer_call_and_return_conditional_losses_20451}
IdentityIdentity&activation_98/PartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:€€€€€€€€€№
NoOpNoOp/^batch_normalization_94/StatefulPartitionedCall/^batch_normalization_95/StatefulPartitionedCall/^batch_normalization_96/StatefulPartitionedCall/^batch_normalization_97/StatefulPartitionedCall)^conv2d_transpose/StatefulPartitionedCall+^conv2d_transpose_1/StatefulPartitionedCall+^conv2d_transpose_2/StatefulPartitionedCall+^conv2d_transpose_3/StatefulPartitionedCall^dense/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*m
_input_shapes\
Z:€€€€€€€€€d:€€€€€€€€€: : : : : : : : : : : : : : : : : : : : : : : : : : 2`
.batch_normalization_94/StatefulPartitionedCall.batch_normalization_94/StatefulPartitionedCall2`
.batch_normalization_95/StatefulPartitionedCall.batch_normalization_95/StatefulPartitionedCall2`
.batch_normalization_96/StatefulPartitionedCall.batch_normalization_96/StatefulPartitionedCall2`
.batch_normalization_97/StatefulPartitionedCall.batch_normalization_97/StatefulPartitionedCall2T
(conv2d_transpose/StatefulPartitionedCall(conv2d_transpose/StatefulPartitionedCall2X
*conv2d_transpose_1/StatefulPartitionedCall*conv2d_transpose_1/StatefulPartitionedCall2X
*conv2d_transpose_2/StatefulPartitionedCall*conv2d_transpose_2/StatefulPartitionedCall2X
*conv2d_transpose_3/StatefulPartitionedCall*conv2d_transpose_3/StatefulPartitionedCall2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall:O K
'
_output_shapes
:€€€€€€€€€d
 
_user_specified_nameinputs:OK
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
≈
І
2__inference_conv2d_transpose_3_layer_call_fn_21925

inputs!
unknown: 
	unknown_0:
identityИҐStatefulPartitionedCallь
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *V
fQRO
M__inference_conv2d_transpose_3_layer_call_and_return_conditional_losses_20305Й
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+€€€€€€€€€€€€€€€€€€€€€€€€€€€ : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€ 
 
_user_specified_nameinputs
Ж
ј
Q__inference_batch_normalization_97_layer_call_and_return_conditional_losses_20257

inputs%
readvariableop_resource: '
readvariableop_1_resource: 6
(fusedbatchnormv3_readvariableop_resource: 8
*fusedbatchnormv3_readvariableop_1_resource: 
identityИҐAssignNewValueҐAssignNewValue_1ҐFusedBatchNormV3/ReadVariableOpҐ!FusedBatchNormV3/ReadVariableOp_1ҐReadVariableOpҐReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
: *
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
: *
dtype0Д
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
: *
dtype0И
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
: *
dtype0÷
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+€€€€€€€€€€€€€€€€€€€€€€€€€€€ : : : : :*
epsilon%oГ:*
exponential_avg_factor%
„#<∆
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0*
validate_shape(–
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0*
validate_shape(}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€ ‘
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+€€€€€€€€€€€€€€€€€€€€€€€€€€€ : : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€ 
 
_user_specified_nameinputs
Щ	
’
6__inference_batch_normalization_94_layer_call_fn_21515

inputs
unknown:	А
	unknown_0:	А
	unknown_1:	А
	unknown_2:	А
identityИҐStatefulPartitionedCallЫ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *B
_output_shapes0
.:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *Z
fURS
Q__inference_batch_normalization_94_layer_call_and_return_conditional_losses_19902К
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*B
_output_shapes0
.:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:j f
B
_output_shapes0
.:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А
 
_user_specified_nameinputs
Ж
ј
Q__inference_batch_normalization_97_layer_call_and_return_conditional_losses_21906

inputs%
readvariableop_resource: '
readvariableop_1_resource: 6
(fusedbatchnormv3_readvariableop_resource: 8
*fusedbatchnormv3_readvariableop_1_resource: 
identityИҐAssignNewValueҐAssignNewValue_1ҐFusedBatchNormV3/ReadVariableOpҐ!FusedBatchNormV3/ReadVariableOp_1ҐReadVariableOpҐReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
: *
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
: *
dtype0Д
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
: *
dtype0И
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
: *
dtype0÷
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+€€€€€€€€€€€€€€€€€€€€€€€€€€€ : : : : :*
epsilon%oГ:*
exponential_avg_factor%
„#<∆
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0*
validate_shape(–
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0*
validate_shape(}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€ ‘
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+€€€€€€€€€€€€€€€€€€€€€€€€€€€ : : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€ 
 
_user_specified_nameinputs
С	
—
6__inference_batch_normalization_97_layer_call_fn_21857

inputs
unknown: 
	unknown_0: 
	unknown_1: 
	unknown_2: 
identityИҐStatefulPartitionedCallЪ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€ *&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *Z
fURS
Q__inference_batch_normalization_97_layer_call_and_return_conditional_losses_20226Й
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€ `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+€€€€€€€€€€€€€€€€€€€€€€€€€€€ : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€ 
 
_user_specified_nameinputs
≈
I
-__inference_activation_97_layer_call_fn_21911

inputs
identityї
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€ * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_activation_97_layer_call_and_return_conditional_losses_20439h
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:€€€€€€€€€ "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:€€€€€€€€€ :W S
/
_output_shapes
:€€€€€€€€€ 
 
_user_specified_nameinputs
р
d
H__inference_activation_95_layer_call_and_return_conditional_losses_21688

inputs
identityO
ReluReluinputs*
T0*0
_output_shapes
:€€€€€€€€€Аc
IdentityIdentityRelu:activations:0*
T0*0
_output_shapes
:€€€€€€€€€А"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:€€€€€€€€€А:X T
0
_output_shapes
:€€€€€€€€€А
 
_user_specified_nameinputs
ќ
^
B__inference_reshape_layer_call_and_return_conditional_losses_21502

inputs
identity;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:—
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :Q
Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :R
Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value
B :А©
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0Reshape/shape/2:output:0Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:m
ReshapeReshapeinputsReshape/shape:output:0*
T0*0
_output_shapes
:€€€€€€€€€Аa
IdentityIdentityReshape:output:0*
T0*0
_output_shapes
:€€€€€€€€€А"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:€€€€€€€€€А1:P L
(
_output_shapes
:€€€€€€€€€А1
 
_user_specified_nameinputs
»
®
2__inference_conv2d_transpose_1_layer_call_fn_21697

inputs"
unknown:@А
	unknown_0:@
identityИҐStatefulPartitionedCallь
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *V
fQRO
M__inference_conv2d_transpose_1_layer_call_and_return_conditional_losses_20089Й
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*E
_input_shapes4
2:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А: : 22
StatefulPartitionedCallStatefulPartitionedCall:j f
B
_output_shapes0
.:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А
 
_user_specified_nameinputs
ћ
Ь
Q__inference_batch_normalization_97_layer_call_and_return_conditional_losses_20226

inputs%
readvariableop_resource: '
readvariableop_1_resource: 6
(fusedbatchnormv3_readvariableop_resource: 8
*fusedbatchnormv3_readvariableop_1_resource: 
identityИҐFusedBatchNormV3/ReadVariableOpҐ!FusedBatchNormV3/ReadVariableOp_1ҐReadVariableOpҐReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
: *
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
: *
dtype0Д
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
: *
dtype0И
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
: *
dtype0»
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+€€€€€€€€€€€€€€€€€€€€€€€€€€€ : : : : :*
epsilon%oГ:*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€ ∞
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+€€€€€€€€€€€€€€€€€€€€€€€€€€€ : : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€ 
 
_user_specified_nameinputs
Ц
ƒ
Q__inference_batch_normalization_95_layer_call_and_return_conditional_losses_20041

inputs&
readvariableop_resource:	А(
readvariableop_1_resource:	А7
(fusedbatchnormv3_readvariableop_resource:	А9
*fusedbatchnormv3_readvariableop_1_resource:	А
identityИҐAssignNewValueҐAssignNewValue_1ҐFusedBatchNormV3/ReadVariableOpҐ!FusedBatchNormV3/ReadVariableOp_1ҐReadVariableOpҐReadVariableOp_1c
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:А*
dtype0g
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes	
:А*
dtype0Е
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:А*
dtype0Й
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:А*
dtype0џ
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А:А:А:А:А:*
epsilon%oГ:*
exponential_avg_factor%
„#<∆
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0*
validate_shape(–
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0*
validate_shape(~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А‘
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:j f
B
_output_shapes0
.:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А
 
_user_specified_nameinputs
≈
I
-__inference_activation_96_layer_call_fn_21797

inputs
identityї
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_activation_96_layer_call_and_return_conditional_losses_20418h
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:€€€€€€€€€@"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:€€€€€€€€€@:W S
/
_output_shapes
:€€€€€€€€€@
 
_user_specified_nameinputs
м
d
H__inference_activation_97_layer_call_and_return_conditional_losses_21916

inputs
identityN
ReluReluinputs*
T0*/
_output_shapes
:€€€€€€€€€ b
IdentityIdentityRelu:activations:0*
T0*/
_output_shapes
:€€€€€€€€€ "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:€€€€€€€€€ :W S
/
_output_shapes
:€€€€€€€€€ 
 
_user_specified_nameinputs
є
r
H__inference_concatenate_2_layer_call_and_return_conditional_losses_20328

inputs
inputs_1
identityM
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :u
concatConcatV2inputsinputs_1concat/axis:output:0*
N*
T0*'
_output_shapes
:€€€€€€€€€~W
IdentityIdentityconcat:output:0*
T0*'
_output_shapes
:€€€€€€€€€~"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:€€€€€€€€€d:€€€€€€€€€:O K
'
_output_shapes
:€€€€€€€€€d
 
_user_specified_nameinputs:OK
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
л
Ћ
)__inference_generator_layer_call_fn_21131
inputs_0
inputs_1
unknown:	~А1
	unknown_0:	А1
	unknown_1:	А
	unknown_2:	А
	unknown_3:	А
	unknown_4:	А%
	unknown_5:АА
	unknown_6:	А
	unknown_7:	А
	unknown_8:	А
	unknown_9:	А

unknown_10:	А%

unknown_11:@А

unknown_12:@

unknown_13:@

unknown_14:@

unknown_15:@

unknown_16:@$

unknown_17: @

unknown_18: 

unknown_19: 

unknown_20: 

unknown_21: 

unknown_22: $

unknown_23: 

unknown_24:
identityИҐStatefulPartitionedCall≠
StatefulPartitionedCallStatefulPartitionedCallinputs_0inputs_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20
unknown_21
unknown_22
unknown_23
unknown_24*'
Tin 
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€*4
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8В *M
fHRF
D__inference_generator_layer_call_and_return_conditional_losses_20696w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:€€€€€€€€€`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*m
_input_shapes\
Z:€€€€€€€€€d:€€€€€€€€€: : : : : : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
'
_output_shapes
:€€€€€€€€€d
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:€€€€€€€€€
"
_user_specified_name
inputs/1
ЏP
ы
D__inference_generator_layer_call_and_return_conditional_losses_20955
input_2
input_3
dense_20887:	~А1
dense_20889:	А1+
batch_normalization_94_20893:	А+
batch_normalization_94_20895:	А+
batch_normalization_94_20897:	А+
batch_normalization_94_20899:	А2
conv2d_transpose_20903:АА%
conv2d_transpose_20905:	А+
batch_normalization_95_20908:	А+
batch_normalization_95_20910:	А+
batch_normalization_95_20912:	А+
batch_normalization_95_20914:	А3
conv2d_transpose_1_20918:@А&
conv2d_transpose_1_20920:@*
batch_normalization_96_20923:@*
batch_normalization_96_20925:@*
batch_normalization_96_20927:@*
batch_normalization_96_20929:@2
conv2d_transpose_2_20933: @&
conv2d_transpose_2_20935: *
batch_normalization_97_20938: *
batch_normalization_97_20940: *
batch_normalization_97_20942: *
batch_normalization_97_20944: 2
conv2d_transpose_3_20948: &
conv2d_transpose_3_20950:
identityИҐ.batch_normalization_94/StatefulPartitionedCallҐ.batch_normalization_95/StatefulPartitionedCallҐ.batch_normalization_96/StatefulPartitionedCallҐ.batch_normalization_97/StatefulPartitionedCallҐ(conv2d_transpose/StatefulPartitionedCallҐ*conv2d_transpose_1/StatefulPartitionedCallҐ*conv2d_transpose_2/StatefulPartitionedCallҐ*conv2d_transpose_3/StatefulPartitionedCallҐdense/StatefulPartitionedCallћ
concatenate_2/PartitionedCallPartitionedCallinput_2input_3*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€~* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_concatenate_2_layer_call_and_return_conditional_losses_20328В
dense/StatefulPartitionedCallStatefulPartitionedCall&concatenate_2/PartitionedCall:output:0dense_20887dense_20889*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:€€€€€€€€€А1*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *I
fDRB
@__inference_dense_layer_call_and_return_conditional_losses_20340ё
reshape/PartitionedCallPartitionedCall&dense/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *K
fFRD
B__inference_reshape_layer_call_and_return_conditional_losses_20360Ж
.batch_normalization_94/StatefulPartitionedCallStatefulPartitionedCall reshape/PartitionedCall:output:0batch_normalization_94_20893batch_normalization_94_20895batch_normalization_94_20897batch_normalization_94_20899*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *Z
fURS
Q__inference_batch_normalization_94_layer_call_and_return_conditional_losses_19933ы
activation_94/PartitionedCallPartitionedCall7batch_normalization_94/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_activation_94_layer_call_and_return_conditional_losses_20376ґ
(conv2d_transpose/StatefulPartitionedCallStatefulPartitionedCall&activation_94/PartitionedCall:output:0conv2d_transpose_20903conv2d_transpose_20905*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *T
fORM
K__inference_conv2d_transpose_layer_call_and_return_conditional_losses_19981Ч
.batch_normalization_95/StatefulPartitionedCallStatefulPartitionedCall1conv2d_transpose/StatefulPartitionedCall:output:0batch_normalization_95_20908batch_normalization_95_20910batch_normalization_95_20912batch_normalization_95_20914*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *Z
fURS
Q__inference_batch_normalization_95_layer_call_and_return_conditional_losses_20041ы
activation_95/PartitionedCallPartitionedCall7batch_normalization_95/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_activation_95_layer_call_and_return_conditional_losses_20397љ
*conv2d_transpose_1/StatefulPartitionedCallStatefulPartitionedCall&activation_95/PartitionedCall:output:0conv2d_transpose_1_20918conv2d_transpose_1_20920*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *V
fQRO
M__inference_conv2d_transpose_1_layer_call_and_return_conditional_losses_20089Ш
.batch_normalization_96/StatefulPartitionedCallStatefulPartitionedCall3conv2d_transpose_1/StatefulPartitionedCall:output:0batch_normalization_96_20923batch_normalization_96_20925batch_normalization_96_20927batch_normalization_96_20929*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *Z
fURS
Q__inference_batch_normalization_96_layer_call_and_return_conditional_losses_20149ъ
activation_96/PartitionedCallPartitionedCall7batch_normalization_96/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_activation_96_layer_call_and_return_conditional_losses_20418љ
*conv2d_transpose_2/StatefulPartitionedCallStatefulPartitionedCall&activation_96/PartitionedCall:output:0conv2d_transpose_2_20933conv2d_transpose_2_20935*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€ *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *V
fQRO
M__inference_conv2d_transpose_2_layer_call_and_return_conditional_losses_20197Ш
.batch_normalization_97/StatefulPartitionedCallStatefulPartitionedCall3conv2d_transpose_2/StatefulPartitionedCall:output:0batch_normalization_97_20938batch_normalization_97_20940batch_normalization_97_20942batch_normalization_97_20944*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€ *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *Z
fURS
Q__inference_batch_normalization_97_layer_call_and_return_conditional_losses_20257ъ
activation_97/PartitionedCallPartitionedCall7batch_normalization_97/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€ * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_activation_97_layer_call_and_return_conditional_losses_20439љ
*conv2d_transpose_3/StatefulPartitionedCallStatefulPartitionedCall&activation_97/PartitionedCall:output:0conv2d_transpose_3_20948conv2d_transpose_3_20950*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *V
fQRO
M__inference_conv2d_transpose_3_layer_call_and_return_conditional_losses_20305ц
activation_98/PartitionedCallPartitionedCall3conv2d_transpose_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_activation_98_layer_call_and_return_conditional_losses_20451}
IdentityIdentity&activation_98/PartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:€€€€€€€€€№
NoOpNoOp/^batch_normalization_94/StatefulPartitionedCall/^batch_normalization_95/StatefulPartitionedCall/^batch_normalization_96/StatefulPartitionedCall/^batch_normalization_97/StatefulPartitionedCall)^conv2d_transpose/StatefulPartitionedCall+^conv2d_transpose_1/StatefulPartitionedCall+^conv2d_transpose_2/StatefulPartitionedCall+^conv2d_transpose_3/StatefulPartitionedCall^dense/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*m
_input_shapes\
Z:€€€€€€€€€d:€€€€€€€€€: : : : : : : : : : : : : : : : : : : : : : : : : : 2`
.batch_normalization_94/StatefulPartitionedCall.batch_normalization_94/StatefulPartitionedCall2`
.batch_normalization_95/StatefulPartitionedCall.batch_normalization_95/StatefulPartitionedCall2`
.batch_normalization_96/StatefulPartitionedCall.batch_normalization_96/StatefulPartitionedCall2`
.batch_normalization_97/StatefulPartitionedCall.batch_normalization_97/StatefulPartitionedCall2T
(conv2d_transpose/StatefulPartitionedCall(conv2d_transpose/StatefulPartitionedCall2X
*conv2d_transpose_1/StatefulPartitionedCall*conv2d_transpose_1/StatefulPartitionedCall2X
*conv2d_transpose_2/StatefulPartitionedCall*conv2d_transpose_2/StatefulPartitionedCall2X
*conv2d_transpose_3/StatefulPartitionedCall*conv2d_transpose_3/StatefulPartitionedCall2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall:P L
'
_output_shapes
:€€€€€€€€€d
!
_user_specified_name	input_2:PL
'
_output_shapes
:€€€€€€€€€
!
_user_specified_name	input_3
ћ
Ь
Q__inference_batch_normalization_97_layer_call_and_return_conditional_losses_21888

inputs%
readvariableop_resource: '
readvariableop_1_resource: 6
(fusedbatchnormv3_readvariableop_resource: 8
*fusedbatchnormv3_readvariableop_1_resource: 
identityИҐFusedBatchNormV3/ReadVariableOpҐ!FusedBatchNormV3/ReadVariableOp_1ҐReadVariableOpҐReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
: *
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
: *
dtype0Д
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
: *
dtype0И
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
: *
dtype0»
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+€€€€€€€€€€€€€€€€€€€€€€€€€€€ : : : : :*
epsilon%oГ:*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€ ∞
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+€€€€€€€€€€€€€€€€€€€€€€€€€€€ : : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€ 
 
_user_specified_nameinputs
≈
І
2__inference_conv2d_transpose_2_layer_call_fn_21811

inputs!
unknown: @
	unknown_0: 
identityИҐStatefulPartitionedCallь
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€ *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *V
fQRO
M__inference_conv2d_transpose_2_layer_call_and_return_conditional_losses_20197Й
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€ `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+€€€€€€€€€€€€€€€€€€€€€€€€€€€@: : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€@
 
_user_specified_nameinputs
»
®
0__inference_conv2d_transpose_layer_call_fn_21583

inputs#
unknown:АА
	unknown_0:	А
identityИҐStatefulPartitionedCallы
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *B
_output_shapes0
.:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *T
fORM
K__inference_conv2d_transpose_layer_call_and_return_conditional_losses_19981К
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*B
_output_shapes0
.:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*E
_input_shapes4
2:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А: : 22
StatefulPartitionedCallStatefulPartitionedCall:j f
B
_output_shapes0
.:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А
 
_user_specified_nameinputs
у
Ћ
)__inference_generator_layer_call_fn_21073
inputs_0
inputs_1
unknown:	~А1
	unknown_0:	А1
	unknown_1:	А
	unknown_2:	А
	unknown_3:	А
	unknown_4:	А%
	unknown_5:АА
	unknown_6:	А
	unknown_7:	А
	unknown_8:	А
	unknown_9:	А

unknown_10:	А%

unknown_11:@А

unknown_12:@

unknown_13:@

unknown_14:@

unknown_15:@

unknown_16:@$

unknown_17: @

unknown_18: 

unknown_19: 

unknown_20: 

unknown_21: 

unknown_22: $

unknown_23: 

unknown_24:
identityИҐStatefulPartitionedCallµ
StatefulPartitionedCallStatefulPartitionedCallinputs_0inputs_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20
unknown_21
unknown_22
unknown_23
unknown_24*'
Tin 
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€*<
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8В *M
fHRF
D__inference_generator_layer_call_and_return_conditional_losses_20454w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:€€€€€€€€€`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*m
_input_shapes\
Z:€€€€€€€€€d:€€€€€€€€€: : : : : : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
'
_output_shapes
:€€€€€€€€€d
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:€€€€€€€€€
"
_user_specified_name
inputs/1
м
d
H__inference_activation_96_layer_call_and_return_conditional_losses_20418

inputs
identityN
ReluReluinputs*
T0*/
_output_shapes
:€€€€€€€€€@b
IdentityIdentityRelu:activations:0*
T0*/
_output_shapes
:€€€€€€€€€@"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:€€€€€€€€€@:W S
/
_output_shapes
:€€€€€€€€€@
 
_user_specified_nameinputs
Ч	
’
6__inference_batch_normalization_94_layer_call_fn_21528

inputs
unknown:	А
	unknown_0:	А
	unknown_1:	А
	unknown_2:	А
identityИҐStatefulPartitionedCallЩ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *B
_output_shapes0
.:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *Z
fURS
Q__inference_batch_normalization_94_layer_call_and_return_conditional_losses_19933К
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*B
_output_shapes0
.:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:j f
B
_output_shapes0
.:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А
 
_user_specified_nameinputs
≠
C
'__inference_reshape_layer_call_fn_21488

inputs
identityґ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *K
fFRD
B__inference_reshape_layer_call_and_return_conditional_losses_20360i
IdentityIdentityPartitionedCall:output:0*
T0*0
_output_shapes
:€€€€€€€€€А"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:€€€€€€€€€А1:P L
(
_output_shapes
:€€€€€€€€€А1
 
_user_specified_nameinputs
я 
Ы
K__inference_conv2d_transpose_layer_call_and_return_conditional_losses_19981

inputsD
(conv2d_transpose_readvariableop_resource:АА.
biasadd_readvariableop_resource:	А
identityИҐBiasAdd/ReadVariableOpҐconv2d_transpose/ReadVariableOp;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:—
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ў
strided_slice_1StridedSliceShape:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ў
strided_slice_2StridedSliceShape:output:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskG
mul/yConst*
_output_shapes
: *
dtype0*
value	B :U
mulMulstrided_slice_1:output:0mul/y:output:0*
T0*
_output_shapes
: I
mul_1/yConst*
_output_shapes
: *
dtype0*
value	B :Y
mul_1Mulstrided_slice_2:output:0mul_1/y:output:0*
T0*
_output_shapes
: J
stack/3Const*
_output_shapes
: *
dtype0*
value
B :Аy
stackPackstrided_slice:output:0mul:z:0	mul_1:z:0stack/3:output:0*
N*
T0*
_output_shapes
:_
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ў
strided_slice_3StridedSlicestack:output:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskТ
conv2d_transpose/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*(
_output_shapes
:АА*
dtype0Ё
conv2d_transposeConv2DBackpropInputstack:output:0'conv2d_transpose/ReadVariableOp:value:0inputs*
T0*B
_output_shapes0
.:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А*
paddingSAME*
strides
s
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0Ъ
BiasAddBiasAddconv2d_transpose:output:0BiasAdd/ReadVariableOp:value:0*
T0*B
_output_shapes0
.:,€€€€€€€€€€€€€€€€€€€€€€€€€€€Аz
IdentityIdentityBiasAdd:output:0^NoOp*
T0*B
_output_shapes0
.:,€€€€€€€€€€€€€€€€€€€€€€€€€€€АБ
NoOpNoOp^BiasAdd/ReadVariableOp ^conv2d_transpose/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*E
_input_shapes4
2:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2B
conv2d_transpose/ReadVariableOpconv2d_transpose/ReadVariableOp:j f
B
_output_shapes0
.:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А
 
_user_specified_nameinputs
№
†
Q__inference_batch_normalization_95_layer_call_and_return_conditional_losses_21660

inputs&
readvariableop_resource:	А(
readvariableop_1_resource:	А7
(fusedbatchnormv3_readvariableop_resource:	А9
*fusedbatchnormv3_readvariableop_1_resource:	А
identityИҐFusedBatchNormV3/ReadVariableOpҐ!FusedBatchNormV3/ReadVariableOp_1ҐReadVariableOpҐReadVariableOp_1c
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:А*
dtype0g
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes	
:А*
dtype0Е
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:А*
dtype0Й
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:А*
dtype0Ќ
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А:А:А:А:А:*
epsilon%oГ:*
is_training( ~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А∞
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:j f
B
_output_shapes0
.:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А
 
_user_specified_nameinputs
м
d
H__inference_activation_97_layer_call_and_return_conditional_losses_20439

inputs
identityN
ReluReluinputs*
T0*/
_output_shapes
:€€€€€€€€€ b
IdentityIdentityRelu:activations:0*
T0*/
_output_shapes
:€€€€€€€€€ "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:€€€€€€€€€ :W S
/
_output_shapes
:€€€€€€€€€ 
 
_user_specified_nameinputs
Щ	
’
6__inference_batch_normalization_95_layer_call_fn_21629

inputs
unknown:	А
	unknown_0:	А
	unknown_1:	А
	unknown_2:	А
identityИҐStatefulPartitionedCallЫ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *B
_output_shapes0
.:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *Z
fURS
Q__inference_batch_normalization_95_layer_call_and_return_conditional_losses_20010К
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*B
_output_shapes0
.:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:j f
B
_output_shapes0
.:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А
 
_user_specified_nameinputs
…
I
-__inference_activation_94_layer_call_fn_21569

inputs
identityЉ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_activation_94_layer_call_and_return_conditional_losses_20376i
IdentityIdentityPartitionedCall:output:0*
T0*0
_output_shapes
:€€€€€€€€€А"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:€€€€€€€€€А:X T
0
_output_shapes
:€€€€€€€€€А
 
_user_specified_nameinputs
√
√
#__inference_signature_wrapper_21015
input_2
input_3
unknown:	~А1
	unknown_0:	А1
	unknown_1:	А
	unknown_2:	А
	unknown_3:	А
	unknown_4:	А%
	unknown_5:АА
	unknown_6:	А
	unknown_7:	А
	unknown_8:	А
	unknown_9:	А

unknown_10:	А%

unknown_11:@А

unknown_12:@

unknown_13:@

unknown_14:@

unknown_15:@

unknown_16:@$

unknown_17: @

unknown_18: 

unknown_19: 

unknown_20: 

unknown_21: 

unknown_22: $

unknown_23: 

unknown_24:
identityИҐStatefulPartitionedCallП
StatefulPartitionedCallStatefulPartitionedCallinput_2input_3unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20
unknown_21
unknown_22
unknown_23
unknown_24*'
Tin 
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€*<
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8В *)
f$R"
 __inference__wrapped_model_19880w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:€€€€€€€€€`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*m
_input_shapes\
Z:€€€€€€€€€d:€€€€€€€€€: : : : : : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
'
_output_shapes
:€€€€€€€€€d
!
_user_specified_name	input_2:PL
'
_output_shapes
:€€€€€€€€€
!
_user_specified_name	input_3
 	
у
@__inference_dense_layer_call_and_return_conditional_losses_20340

inputs1
matmul_readvariableop_resource:	~А1.
biasadd_readvariableop_resource:	А1
identityИҐBiasAdd/ReadVariableOpҐMatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	~А1*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:€€€€€€€€€А1s
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:А1*
dtype0w
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:€€€€€€€€€А1`
IdentityIdentityBiasAdd:output:0^NoOp*
T0*(
_output_shapes
:€€€€€€€€€А1w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:€€€€€€€€€~: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:€€€€€€€€€~
 
_user_specified_nameinputs
р
d
H__inference_activation_94_layer_call_and_return_conditional_losses_20376

inputs
identityO
ReluReluinputs*
T0*0
_output_shapes
:€€€€€€€€€Аc
IdentityIdentityRelu:activations:0*
T0*0
_output_shapes
:€€€€€€€€€А"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:€€€€€€€€€А:X T
0
_output_shapes
:€€€€€€€€€А
 
_user_specified_nameinputs
’ 
Ъ
M__inference_conv2d_transpose_3_layer_call_and_return_conditional_losses_21958

inputsB
(conv2d_transpose_readvariableop_resource: -
biasadd_readvariableop_resource:
identityИҐBiasAdd/ReadVariableOpҐconv2d_transpose/ReadVariableOp;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:—
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ў
strided_slice_1StridedSliceShape:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ў
strided_slice_2StridedSliceShape:output:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskG
mul/yConst*
_output_shapes
: *
dtype0*
value	B :U
mulMulstrided_slice_1:output:0mul/y:output:0*
T0*
_output_shapes
: I
mul_1/yConst*
_output_shapes
: *
dtype0*
value	B :Y
mul_1Mulstrided_slice_2:output:0mul_1/y:output:0*
T0*
_output_shapes
: I
stack/3Const*
_output_shapes
: *
dtype0*
value	B :y
stackPackstrided_slice:output:0mul:z:0	mul_1:z:0stack/3:output:0*
N*
T0*
_output_shapes
:_
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ў
strided_slice_3StridedSlicestack:output:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskР
conv2d_transpose/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
: *
dtype0№
conv2d_transposeConv2DBackpropInputstack:output:0'conv2d_transpose/ReadVariableOp:value:0inputs*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0Щ
BiasAddBiasAddconv2d_transpose:output:0BiasAdd/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€y
IdentityIdentityBiasAdd:output:0^NoOp*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€Б
NoOpNoOp^BiasAdd/ReadVariableOp ^conv2d_transpose/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+€€€€€€€€€€€€€€€€€€€€€€€€€€€ : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2B
conv2d_transpose/ReadVariableOpconv2d_transpose/ReadVariableOp:i e
A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€ 
 
_user_specified_nameinputs
я 
Ы
K__inference_conv2d_transpose_layer_call_and_return_conditional_losses_21616

inputsD
(conv2d_transpose_readvariableop_resource:АА.
biasadd_readvariableop_resource:	А
identityИҐBiasAdd/ReadVariableOpҐconv2d_transpose/ReadVariableOp;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:—
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ў
strided_slice_1StridedSliceShape:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ў
strided_slice_2StridedSliceShape:output:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskG
mul/yConst*
_output_shapes
: *
dtype0*
value	B :U
mulMulstrided_slice_1:output:0mul/y:output:0*
T0*
_output_shapes
: I
mul_1/yConst*
_output_shapes
: *
dtype0*
value	B :Y
mul_1Mulstrided_slice_2:output:0mul_1/y:output:0*
T0*
_output_shapes
: J
stack/3Const*
_output_shapes
: *
dtype0*
value
B :Аy
stackPackstrided_slice:output:0mul:z:0	mul_1:z:0stack/3:output:0*
N*
T0*
_output_shapes
:_
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ў
strided_slice_3StridedSlicestack:output:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskТ
conv2d_transpose/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*(
_output_shapes
:АА*
dtype0Ё
conv2d_transposeConv2DBackpropInputstack:output:0'conv2d_transpose/ReadVariableOp:value:0inputs*
T0*B
_output_shapes0
.:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А*
paddingSAME*
strides
s
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0Ъ
BiasAddBiasAddconv2d_transpose:output:0BiasAdd/ReadVariableOp:value:0*
T0*B
_output_shapes0
.:,€€€€€€€€€€€€€€€€€€€€€€€€€€€Аz
IdentityIdentityBiasAdd:output:0^NoOp*
T0*B
_output_shapes0
.:,€€€€€€€€€€€€€€€€€€€€€€€€€€€АБ
NoOpNoOp^BiasAdd/ReadVariableOp ^conv2d_transpose/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*E
_input_shapes4
2:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2B
conv2d_transpose/ReadVariableOpconv2d_transpose/ReadVariableOp:j f
B
_output_shapes0
.:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А
 
_user_specified_nameinputs
ћ
Ь
Q__inference_batch_normalization_96_layer_call_and_return_conditional_losses_20118

inputs%
readvariableop_resource:@'
readvariableop_1_resource:@6
(fusedbatchnormv3_readvariableop_resource:@8
*fusedbatchnormv3_readvariableop_1_resource:@
identityИҐFusedBatchNormV3/ReadVariableOpҐ!FusedBatchNormV3/ReadVariableOp_1ҐReadVariableOpҐReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:@*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:@*
dtype0Д
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:@*
dtype0И
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:@*
dtype0»
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+€€€€€€€€€€€€€€€€€€€€€€€€€€€@:@:@:@:@:*
epsilon%oГ:*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€@∞
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+€€€€€€€€€€€€€€€€€€€€€€€€€€€@: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€@
 
_user_specified_nameinputs
№
†
Q__inference_batch_normalization_94_layer_call_and_return_conditional_losses_21546

inputs&
readvariableop_resource:	А(
readvariableop_1_resource:	А7
(fusedbatchnormv3_readvariableop_resource:	А9
*fusedbatchnormv3_readvariableop_1_resource:	А
identityИҐFusedBatchNormV3/ReadVariableOpҐ!FusedBatchNormV3/ReadVariableOp_1ҐReadVariableOpҐReadVariableOp_1c
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:А*
dtype0g
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes	
:А*
dtype0Е
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:А*
dtype0Й
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:А*
dtype0Ќ
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А:А:А:А:А:*
epsilon%oГ:*
is_training( ~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А∞
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:j f
B
_output_shapes0
.:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А
 
_user_specified_nameinputs
Дж
э
 __inference__wrapped_model_19880
input_2
input_3A
.generator_dense_matmul_readvariableop_resource:	~А1>
/generator_dense_biasadd_readvariableop_resource:	А1G
8generator_batch_normalization_94_readvariableop_resource:	АI
:generator_batch_normalization_94_readvariableop_1_resource:	АX
Igenerator_batch_normalization_94_fusedbatchnormv3_readvariableop_resource:	АZ
Kgenerator_batch_normalization_94_fusedbatchnormv3_readvariableop_1_resource:	А_
Cgenerator_conv2d_transpose_conv2d_transpose_readvariableop_resource:ААI
:generator_conv2d_transpose_biasadd_readvariableop_resource:	АG
8generator_batch_normalization_95_readvariableop_resource:	АI
:generator_batch_normalization_95_readvariableop_1_resource:	АX
Igenerator_batch_normalization_95_fusedbatchnormv3_readvariableop_resource:	АZ
Kgenerator_batch_normalization_95_fusedbatchnormv3_readvariableop_1_resource:	А`
Egenerator_conv2d_transpose_1_conv2d_transpose_readvariableop_resource:@АJ
<generator_conv2d_transpose_1_biasadd_readvariableop_resource:@F
8generator_batch_normalization_96_readvariableop_resource:@H
:generator_batch_normalization_96_readvariableop_1_resource:@W
Igenerator_batch_normalization_96_fusedbatchnormv3_readvariableop_resource:@Y
Kgenerator_batch_normalization_96_fusedbatchnormv3_readvariableop_1_resource:@_
Egenerator_conv2d_transpose_2_conv2d_transpose_readvariableop_resource: @J
<generator_conv2d_transpose_2_biasadd_readvariableop_resource: F
8generator_batch_normalization_97_readvariableop_resource: H
:generator_batch_normalization_97_readvariableop_1_resource: W
Igenerator_batch_normalization_97_fusedbatchnormv3_readvariableop_resource: Y
Kgenerator_batch_normalization_97_fusedbatchnormv3_readvariableop_1_resource: _
Egenerator_conv2d_transpose_3_conv2d_transpose_readvariableop_resource: J
<generator_conv2d_transpose_3_biasadd_readvariableop_resource:
identityИҐ@generator/batch_normalization_94/FusedBatchNormV3/ReadVariableOpҐBgenerator/batch_normalization_94/FusedBatchNormV3/ReadVariableOp_1Ґ/generator/batch_normalization_94/ReadVariableOpҐ1generator/batch_normalization_94/ReadVariableOp_1Ґ@generator/batch_normalization_95/FusedBatchNormV3/ReadVariableOpҐBgenerator/batch_normalization_95/FusedBatchNormV3/ReadVariableOp_1Ґ/generator/batch_normalization_95/ReadVariableOpҐ1generator/batch_normalization_95/ReadVariableOp_1Ґ@generator/batch_normalization_96/FusedBatchNormV3/ReadVariableOpҐBgenerator/batch_normalization_96/FusedBatchNormV3/ReadVariableOp_1Ґ/generator/batch_normalization_96/ReadVariableOpҐ1generator/batch_normalization_96/ReadVariableOp_1Ґ@generator/batch_normalization_97/FusedBatchNormV3/ReadVariableOpҐBgenerator/batch_normalization_97/FusedBatchNormV3/ReadVariableOp_1Ґ/generator/batch_normalization_97/ReadVariableOpҐ1generator/batch_normalization_97/ReadVariableOp_1Ґ1generator/conv2d_transpose/BiasAdd/ReadVariableOpҐ:generator/conv2d_transpose/conv2d_transpose/ReadVariableOpҐ3generator/conv2d_transpose_1/BiasAdd/ReadVariableOpҐ<generator/conv2d_transpose_1/conv2d_transpose/ReadVariableOpҐ3generator/conv2d_transpose_2/BiasAdd/ReadVariableOpҐ<generator/conv2d_transpose_2/conv2d_transpose/ReadVariableOpҐ3generator/conv2d_transpose_3/BiasAdd/ReadVariableOpҐ<generator/conv2d_transpose_3/conv2d_transpose/ReadVariableOpҐ&generator/dense/BiasAdd/ReadVariableOpҐ%generator/dense/MatMul/ReadVariableOpe
#generator/concatenate_2/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :•
generator/concatenate_2/concatConcatV2input_2input_3,generator/concatenate_2/concat/axis:output:0*
N*
T0*'
_output_shapes
:€€€€€€€€€~Х
%generator/dense/MatMul/ReadVariableOpReadVariableOp.generator_dense_matmul_readvariableop_resource*
_output_shapes
:	~А1*
dtype0Ђ
generator/dense/MatMulMatMul'generator/concatenate_2/concat:output:0-generator/dense/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:€€€€€€€€€А1У
&generator/dense/BiasAdd/ReadVariableOpReadVariableOp/generator_dense_biasadd_readvariableop_resource*
_output_shapes	
:А1*
dtype0І
generator/dense/BiasAddBiasAdd generator/dense/MatMul:product:0.generator/dense/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:€€€€€€€€€А1g
generator/reshape/ShapeShape generator/dense/BiasAdd:output:0*
T0*
_output_shapes
:o
%generator/reshape/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: q
'generator/reshape/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:q
'generator/reshape/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ђ
generator/reshape/strided_sliceStridedSlice generator/reshape/Shape:output:0.generator/reshape/strided_slice/stack:output:00generator/reshape/strided_slice/stack_1:output:00generator/reshape/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskc
!generator/reshape/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :c
!generator/reshape/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :d
!generator/reshape/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value
B :АГ
generator/reshape/Reshape/shapePack(generator/reshape/strided_slice:output:0*generator/reshape/Reshape/shape/1:output:0*generator/reshape/Reshape/shape/2:output:0*generator/reshape/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:Ђ
generator/reshape/ReshapeReshape generator/dense/BiasAdd:output:0(generator/reshape/Reshape/shape:output:0*
T0*0
_output_shapes
:€€€€€€€€€А•
/generator/batch_normalization_94/ReadVariableOpReadVariableOp8generator_batch_normalization_94_readvariableop_resource*
_output_shapes	
:А*
dtype0©
1generator/batch_normalization_94/ReadVariableOp_1ReadVariableOp:generator_batch_normalization_94_readvariableop_1_resource*
_output_shapes	
:А*
dtype0«
@generator/batch_normalization_94/FusedBatchNormV3/ReadVariableOpReadVariableOpIgenerator_batch_normalization_94_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:А*
dtype0Ћ
Bgenerator/batch_normalization_94/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpKgenerator_batch_normalization_94_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:А*
dtype0ь
1generator/batch_normalization_94/FusedBatchNormV3FusedBatchNormV3"generator/reshape/Reshape:output:07generator/batch_normalization_94/ReadVariableOp:value:09generator/batch_normalization_94/ReadVariableOp_1:value:0Hgenerator/batch_normalization_94/FusedBatchNormV3/ReadVariableOp:value:0Jgenerator/batch_normalization_94/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:€€€€€€€€€А:А:А:А:А:*
epsilon%oГ:*
is_training( Ц
generator/activation_94/ReluRelu5generator/batch_normalization_94/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:€€€€€€€€€Аz
 generator/conv2d_transpose/ShapeShape*generator/activation_94/Relu:activations:0*
T0*
_output_shapes
:x
.generator/conv2d_transpose/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: z
0generator/conv2d_transpose/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:z
0generator/conv2d_transpose/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ў
(generator/conv2d_transpose/strided_sliceStridedSlice)generator/conv2d_transpose/Shape:output:07generator/conv2d_transpose/strided_slice/stack:output:09generator/conv2d_transpose/strided_slice/stack_1:output:09generator/conv2d_transpose/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskd
"generator/conv2d_transpose/stack/1Const*
_output_shapes
: *
dtype0*
value	B :d
"generator/conv2d_transpose/stack/2Const*
_output_shapes
: *
dtype0*
value	B :e
"generator/conv2d_transpose/stack/3Const*
_output_shapes
: *
dtype0*
value
B :АР
 generator/conv2d_transpose/stackPack1generator/conv2d_transpose/strided_slice:output:0+generator/conv2d_transpose/stack/1:output:0+generator/conv2d_transpose/stack/2:output:0+generator/conv2d_transpose/stack/3:output:0*
N*
T0*
_output_shapes
:z
0generator/conv2d_transpose/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: |
2generator/conv2d_transpose/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:|
2generator/conv2d_transpose/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:а
*generator/conv2d_transpose/strided_slice_1StridedSlice)generator/conv2d_transpose/stack:output:09generator/conv2d_transpose/strided_slice_1/stack:output:0;generator/conv2d_transpose/strided_slice_1/stack_1:output:0;generator/conv2d_transpose/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask»
:generator/conv2d_transpose/conv2d_transpose/ReadVariableOpReadVariableOpCgenerator_conv2d_transpose_conv2d_transpose_readvariableop_resource*(
_output_shapes
:АА*
dtype0ј
+generator/conv2d_transpose/conv2d_transposeConv2DBackpropInput)generator/conv2d_transpose/stack:output:0Bgenerator/conv2d_transpose/conv2d_transpose/ReadVariableOp:value:0*generator/activation_94/Relu:activations:0*
T0*0
_output_shapes
:€€€€€€€€€А*
paddingSAME*
strides
©
1generator/conv2d_transpose/BiasAdd/ReadVariableOpReadVariableOp:generator_conv2d_transpose_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0ў
"generator/conv2d_transpose/BiasAddBiasAdd4generator/conv2d_transpose/conv2d_transpose:output:09generator/conv2d_transpose/BiasAdd/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€А•
/generator/batch_normalization_95/ReadVariableOpReadVariableOp8generator_batch_normalization_95_readvariableop_resource*
_output_shapes	
:А*
dtype0©
1generator/batch_normalization_95/ReadVariableOp_1ReadVariableOp:generator_batch_normalization_95_readvariableop_1_resource*
_output_shapes	
:А*
dtype0«
@generator/batch_normalization_95/FusedBatchNormV3/ReadVariableOpReadVariableOpIgenerator_batch_normalization_95_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:А*
dtype0Ћ
Bgenerator/batch_normalization_95/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpKgenerator_batch_normalization_95_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:А*
dtype0Е
1generator/batch_normalization_95/FusedBatchNormV3FusedBatchNormV3+generator/conv2d_transpose/BiasAdd:output:07generator/batch_normalization_95/ReadVariableOp:value:09generator/batch_normalization_95/ReadVariableOp_1:value:0Hgenerator/batch_normalization_95/FusedBatchNormV3/ReadVariableOp:value:0Jgenerator/batch_normalization_95/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:€€€€€€€€€А:А:А:А:А:*
epsilon%oГ:*
is_training( Ц
generator/activation_95/ReluRelu5generator/batch_normalization_95/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:€€€€€€€€€А|
"generator/conv2d_transpose_1/ShapeShape*generator/activation_95/Relu:activations:0*
T0*
_output_shapes
:z
0generator/conv2d_transpose_1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: |
2generator/conv2d_transpose_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:|
2generator/conv2d_transpose_1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:в
*generator/conv2d_transpose_1/strided_sliceStridedSlice+generator/conv2d_transpose_1/Shape:output:09generator/conv2d_transpose_1/strided_slice/stack:output:0;generator/conv2d_transpose_1/strided_slice/stack_1:output:0;generator/conv2d_transpose_1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
$generator/conv2d_transpose_1/stack/1Const*
_output_shapes
: *
dtype0*
value	B :f
$generator/conv2d_transpose_1/stack/2Const*
_output_shapes
: *
dtype0*
value	B :f
$generator/conv2d_transpose_1/stack/3Const*
_output_shapes
: *
dtype0*
value	B :@Ъ
"generator/conv2d_transpose_1/stackPack3generator/conv2d_transpose_1/strided_slice:output:0-generator/conv2d_transpose_1/stack/1:output:0-generator/conv2d_transpose_1/stack/2:output:0-generator/conv2d_transpose_1/stack/3:output:0*
N*
T0*
_output_shapes
:|
2generator/conv2d_transpose_1/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: ~
4generator/conv2d_transpose_1/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:~
4generator/conv2d_transpose_1/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:к
,generator/conv2d_transpose_1/strided_slice_1StridedSlice+generator/conv2d_transpose_1/stack:output:0;generator/conv2d_transpose_1/strided_slice_1/stack:output:0=generator/conv2d_transpose_1/strided_slice_1/stack_1:output:0=generator/conv2d_transpose_1/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskЋ
<generator/conv2d_transpose_1/conv2d_transpose/ReadVariableOpReadVariableOpEgenerator_conv2d_transpose_1_conv2d_transpose_readvariableop_resource*'
_output_shapes
:@А*
dtype0≈
-generator/conv2d_transpose_1/conv2d_transposeConv2DBackpropInput+generator/conv2d_transpose_1/stack:output:0Dgenerator/conv2d_transpose_1/conv2d_transpose/ReadVariableOp:value:0*generator/activation_95/Relu:activations:0*
T0*/
_output_shapes
:€€€€€€€€€@*
paddingSAME*
strides
ђ
3generator/conv2d_transpose_1/BiasAdd/ReadVariableOpReadVariableOp<generator_conv2d_transpose_1_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0ё
$generator/conv2d_transpose_1/BiasAddBiasAdd6generator/conv2d_transpose_1/conv2d_transpose:output:0;generator/conv2d_transpose_1/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@§
/generator/batch_normalization_96/ReadVariableOpReadVariableOp8generator_batch_normalization_96_readvariableop_resource*
_output_shapes
:@*
dtype0®
1generator/batch_normalization_96/ReadVariableOp_1ReadVariableOp:generator_batch_normalization_96_readvariableop_1_resource*
_output_shapes
:@*
dtype0∆
@generator/batch_normalization_96/FusedBatchNormV3/ReadVariableOpReadVariableOpIgenerator_batch_normalization_96_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:@*
dtype0 
Bgenerator/batch_normalization_96/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpKgenerator_batch_normalization_96_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:@*
dtype0В
1generator/batch_normalization_96/FusedBatchNormV3FusedBatchNormV3-generator/conv2d_transpose_1/BiasAdd:output:07generator/batch_normalization_96/ReadVariableOp:value:09generator/batch_normalization_96/ReadVariableOp_1:value:0Hgenerator/batch_normalization_96/FusedBatchNormV3/ReadVariableOp:value:0Jgenerator/batch_normalization_96/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:€€€€€€€€€@:@:@:@:@:*
epsilon%oГ:*
is_training( Х
generator/activation_96/ReluRelu5generator/batch_normalization_96/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:€€€€€€€€€@|
"generator/conv2d_transpose_2/ShapeShape*generator/activation_96/Relu:activations:0*
T0*
_output_shapes
:z
0generator/conv2d_transpose_2/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: |
2generator/conv2d_transpose_2/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:|
2generator/conv2d_transpose_2/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:в
*generator/conv2d_transpose_2/strided_sliceStridedSlice+generator/conv2d_transpose_2/Shape:output:09generator/conv2d_transpose_2/strided_slice/stack:output:0;generator/conv2d_transpose_2/strided_slice/stack_1:output:0;generator/conv2d_transpose_2/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
$generator/conv2d_transpose_2/stack/1Const*
_output_shapes
: *
dtype0*
value	B :f
$generator/conv2d_transpose_2/stack/2Const*
_output_shapes
: *
dtype0*
value	B :f
$generator/conv2d_transpose_2/stack/3Const*
_output_shapes
: *
dtype0*
value	B : Ъ
"generator/conv2d_transpose_2/stackPack3generator/conv2d_transpose_2/strided_slice:output:0-generator/conv2d_transpose_2/stack/1:output:0-generator/conv2d_transpose_2/stack/2:output:0-generator/conv2d_transpose_2/stack/3:output:0*
N*
T0*
_output_shapes
:|
2generator/conv2d_transpose_2/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: ~
4generator/conv2d_transpose_2/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:~
4generator/conv2d_transpose_2/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:к
,generator/conv2d_transpose_2/strided_slice_1StridedSlice+generator/conv2d_transpose_2/stack:output:0;generator/conv2d_transpose_2/strided_slice_1/stack:output:0=generator/conv2d_transpose_2/strided_slice_1/stack_1:output:0=generator/conv2d_transpose_2/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask 
<generator/conv2d_transpose_2/conv2d_transpose/ReadVariableOpReadVariableOpEgenerator_conv2d_transpose_2_conv2d_transpose_readvariableop_resource*&
_output_shapes
: @*
dtype0≈
-generator/conv2d_transpose_2/conv2d_transposeConv2DBackpropInput+generator/conv2d_transpose_2/stack:output:0Dgenerator/conv2d_transpose_2/conv2d_transpose/ReadVariableOp:value:0*generator/activation_96/Relu:activations:0*
T0*/
_output_shapes
:€€€€€€€€€ *
paddingSAME*
strides
ђ
3generator/conv2d_transpose_2/BiasAdd/ReadVariableOpReadVariableOp<generator_conv2d_transpose_2_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0ё
$generator/conv2d_transpose_2/BiasAddBiasAdd6generator/conv2d_transpose_2/conv2d_transpose:output:0;generator/conv2d_transpose_2/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€ §
/generator/batch_normalization_97/ReadVariableOpReadVariableOp8generator_batch_normalization_97_readvariableop_resource*
_output_shapes
: *
dtype0®
1generator/batch_normalization_97/ReadVariableOp_1ReadVariableOp:generator_batch_normalization_97_readvariableop_1_resource*
_output_shapes
: *
dtype0∆
@generator/batch_normalization_97/FusedBatchNormV3/ReadVariableOpReadVariableOpIgenerator_batch_normalization_97_fusedbatchnormv3_readvariableop_resource*
_output_shapes
: *
dtype0 
Bgenerator/batch_normalization_97/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpKgenerator_batch_normalization_97_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
: *
dtype0В
1generator/batch_normalization_97/FusedBatchNormV3FusedBatchNormV3-generator/conv2d_transpose_2/BiasAdd:output:07generator/batch_normalization_97/ReadVariableOp:value:09generator/batch_normalization_97/ReadVariableOp_1:value:0Hgenerator/batch_normalization_97/FusedBatchNormV3/ReadVariableOp:value:0Jgenerator/batch_normalization_97/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:€€€€€€€€€ : : : : :*
epsilon%oГ:*
is_training( Х
generator/activation_97/ReluRelu5generator/batch_normalization_97/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:€€€€€€€€€ |
"generator/conv2d_transpose_3/ShapeShape*generator/activation_97/Relu:activations:0*
T0*
_output_shapes
:z
0generator/conv2d_transpose_3/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: |
2generator/conv2d_transpose_3/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:|
2generator/conv2d_transpose_3/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:в
*generator/conv2d_transpose_3/strided_sliceStridedSlice+generator/conv2d_transpose_3/Shape:output:09generator/conv2d_transpose_3/strided_slice/stack:output:0;generator/conv2d_transpose_3/strided_slice/stack_1:output:0;generator/conv2d_transpose_3/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
$generator/conv2d_transpose_3/stack/1Const*
_output_shapes
: *
dtype0*
value	B :f
$generator/conv2d_transpose_3/stack/2Const*
_output_shapes
: *
dtype0*
value	B :f
$generator/conv2d_transpose_3/stack/3Const*
_output_shapes
: *
dtype0*
value	B :Ъ
"generator/conv2d_transpose_3/stackPack3generator/conv2d_transpose_3/strided_slice:output:0-generator/conv2d_transpose_3/stack/1:output:0-generator/conv2d_transpose_3/stack/2:output:0-generator/conv2d_transpose_3/stack/3:output:0*
N*
T0*
_output_shapes
:|
2generator/conv2d_transpose_3/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: ~
4generator/conv2d_transpose_3/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:~
4generator/conv2d_transpose_3/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:к
,generator/conv2d_transpose_3/strided_slice_1StridedSlice+generator/conv2d_transpose_3/stack:output:0;generator/conv2d_transpose_3/strided_slice_1/stack:output:0=generator/conv2d_transpose_3/strided_slice_1/stack_1:output:0=generator/conv2d_transpose_3/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask 
<generator/conv2d_transpose_3/conv2d_transpose/ReadVariableOpReadVariableOpEgenerator_conv2d_transpose_3_conv2d_transpose_readvariableop_resource*&
_output_shapes
: *
dtype0≈
-generator/conv2d_transpose_3/conv2d_transposeConv2DBackpropInput+generator/conv2d_transpose_3/stack:output:0Dgenerator/conv2d_transpose_3/conv2d_transpose/ReadVariableOp:value:0*generator/activation_97/Relu:activations:0*
T0*/
_output_shapes
:€€€€€€€€€*
paddingSAME*
strides
ђ
3generator/conv2d_transpose_3/BiasAdd/ReadVariableOpReadVariableOp<generator_conv2d_transpose_3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0ё
$generator/conv2d_transpose_3/BiasAddBiasAdd6generator/conv2d_transpose_3/conv2d_transpose:output:0;generator/conv2d_transpose_3/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€Н
generator/activation_98/TanhTanh-generator/conv2d_transpose_3/BiasAdd:output:0*
T0*/
_output_shapes
:€€€€€€€€€w
IdentityIdentity generator/activation_98/Tanh:y:0^NoOp*
T0*/
_output_shapes
:€€€€€€€€€Я
NoOpNoOpA^generator/batch_normalization_94/FusedBatchNormV3/ReadVariableOpC^generator/batch_normalization_94/FusedBatchNormV3/ReadVariableOp_10^generator/batch_normalization_94/ReadVariableOp2^generator/batch_normalization_94/ReadVariableOp_1A^generator/batch_normalization_95/FusedBatchNormV3/ReadVariableOpC^generator/batch_normalization_95/FusedBatchNormV3/ReadVariableOp_10^generator/batch_normalization_95/ReadVariableOp2^generator/batch_normalization_95/ReadVariableOp_1A^generator/batch_normalization_96/FusedBatchNormV3/ReadVariableOpC^generator/batch_normalization_96/FusedBatchNormV3/ReadVariableOp_10^generator/batch_normalization_96/ReadVariableOp2^generator/batch_normalization_96/ReadVariableOp_1A^generator/batch_normalization_97/FusedBatchNormV3/ReadVariableOpC^generator/batch_normalization_97/FusedBatchNormV3/ReadVariableOp_10^generator/batch_normalization_97/ReadVariableOp2^generator/batch_normalization_97/ReadVariableOp_12^generator/conv2d_transpose/BiasAdd/ReadVariableOp;^generator/conv2d_transpose/conv2d_transpose/ReadVariableOp4^generator/conv2d_transpose_1/BiasAdd/ReadVariableOp=^generator/conv2d_transpose_1/conv2d_transpose/ReadVariableOp4^generator/conv2d_transpose_2/BiasAdd/ReadVariableOp=^generator/conv2d_transpose_2/conv2d_transpose/ReadVariableOp4^generator/conv2d_transpose_3/BiasAdd/ReadVariableOp=^generator/conv2d_transpose_3/conv2d_transpose/ReadVariableOp'^generator/dense/BiasAdd/ReadVariableOp&^generator/dense/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*m
_input_shapes\
Z:€€€€€€€€€d:€€€€€€€€€: : : : : : : : : : : : : : : : : : : : : : : : : : 2Д
@generator/batch_normalization_94/FusedBatchNormV3/ReadVariableOp@generator/batch_normalization_94/FusedBatchNormV3/ReadVariableOp2И
Bgenerator/batch_normalization_94/FusedBatchNormV3/ReadVariableOp_1Bgenerator/batch_normalization_94/FusedBatchNormV3/ReadVariableOp_12b
/generator/batch_normalization_94/ReadVariableOp/generator/batch_normalization_94/ReadVariableOp2f
1generator/batch_normalization_94/ReadVariableOp_11generator/batch_normalization_94/ReadVariableOp_12Д
@generator/batch_normalization_95/FusedBatchNormV3/ReadVariableOp@generator/batch_normalization_95/FusedBatchNormV3/ReadVariableOp2И
Bgenerator/batch_normalization_95/FusedBatchNormV3/ReadVariableOp_1Bgenerator/batch_normalization_95/FusedBatchNormV3/ReadVariableOp_12b
/generator/batch_normalization_95/ReadVariableOp/generator/batch_normalization_95/ReadVariableOp2f
1generator/batch_normalization_95/ReadVariableOp_11generator/batch_normalization_95/ReadVariableOp_12Д
@generator/batch_normalization_96/FusedBatchNormV3/ReadVariableOp@generator/batch_normalization_96/FusedBatchNormV3/ReadVariableOp2И
Bgenerator/batch_normalization_96/FusedBatchNormV3/ReadVariableOp_1Bgenerator/batch_normalization_96/FusedBatchNormV3/ReadVariableOp_12b
/generator/batch_normalization_96/ReadVariableOp/generator/batch_normalization_96/ReadVariableOp2f
1generator/batch_normalization_96/ReadVariableOp_11generator/batch_normalization_96/ReadVariableOp_12Д
@generator/batch_normalization_97/FusedBatchNormV3/ReadVariableOp@generator/batch_normalization_97/FusedBatchNormV3/ReadVariableOp2И
Bgenerator/batch_normalization_97/FusedBatchNormV3/ReadVariableOp_1Bgenerator/batch_normalization_97/FusedBatchNormV3/ReadVariableOp_12b
/generator/batch_normalization_97/ReadVariableOp/generator/batch_normalization_97/ReadVariableOp2f
1generator/batch_normalization_97/ReadVariableOp_11generator/batch_normalization_97/ReadVariableOp_12f
1generator/conv2d_transpose/BiasAdd/ReadVariableOp1generator/conv2d_transpose/BiasAdd/ReadVariableOp2x
:generator/conv2d_transpose/conv2d_transpose/ReadVariableOp:generator/conv2d_transpose/conv2d_transpose/ReadVariableOp2j
3generator/conv2d_transpose_1/BiasAdd/ReadVariableOp3generator/conv2d_transpose_1/BiasAdd/ReadVariableOp2|
<generator/conv2d_transpose_1/conv2d_transpose/ReadVariableOp<generator/conv2d_transpose_1/conv2d_transpose/ReadVariableOp2j
3generator/conv2d_transpose_2/BiasAdd/ReadVariableOp3generator/conv2d_transpose_2/BiasAdd/ReadVariableOp2|
<generator/conv2d_transpose_2/conv2d_transpose/ReadVariableOp<generator/conv2d_transpose_2/conv2d_transpose/ReadVariableOp2j
3generator/conv2d_transpose_3/BiasAdd/ReadVariableOp3generator/conv2d_transpose_3/BiasAdd/ReadVariableOp2|
<generator/conv2d_transpose_3/conv2d_transpose/ReadVariableOp<generator/conv2d_transpose_3/conv2d_transpose/ReadVariableOp2P
&generator/dense/BiasAdd/ReadVariableOp&generator/dense/BiasAdd/ReadVariableOp2N
%generator/dense/MatMul/ReadVariableOp%generator/dense/MatMul/ReadVariableOp:P L
'
_output_shapes
:€€€€€€€€€d
!
_user_specified_name	input_2:PL
'
_output_shapes
:€€€€€€€€€
!
_user_specified_name	input_3
Ж
ј
Q__inference_batch_normalization_96_layer_call_and_return_conditional_losses_20149

inputs%
readvariableop_resource:@'
readvariableop_1_resource:@6
(fusedbatchnormv3_readvariableop_resource:@8
*fusedbatchnormv3_readvariableop_1_resource:@
identityИҐAssignNewValueҐAssignNewValue_1ҐFusedBatchNormV3/ReadVariableOpҐ!FusedBatchNormV3/ReadVariableOp_1ҐReadVariableOpҐReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:@*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:@*
dtype0Д
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:@*
dtype0И
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:@*
dtype0÷
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+€€€€€€€€€€€€€€€€€€€€€€€€€€€@:@:@:@:@:*
epsilon%oГ:*
exponential_avg_factor%
„#<∆
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0*
validate_shape(–
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0*
validate_shape(}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€@‘
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+€€€€€€€€€€€€€€€€€€€€€€€€€€€@: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€@
 
_user_specified_nameinputs
Ѕ
t
H__inference_concatenate_2_layer_call_and_return_conditional_losses_21464
inputs_0
inputs_1
identityM
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :w
concatConcatV2inputs_0inputs_1concat/axis:output:0*
N*
T0*'
_output_shapes
:€€€€€€€€€~W
IdentityIdentityconcat:output:0*
T0*'
_output_shapes
:€€€€€€€€€~"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:€€€€€€€€€d:€€€€€€€€€:Q M
'
_output_shapes
:€€€€€€€€€d
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:€€€€€€€€€
"
_user_specified_name
inputs/1
±>
У
__inference__traced_save_22070
file_prefix+
'savev2_dense_kernel_read_readvariableop)
%savev2_dense_bias_read_readvariableop;
7savev2_batch_normalization_94_gamma_read_readvariableop:
6savev2_batch_normalization_94_beta_read_readvariableopA
=savev2_batch_normalization_94_moving_mean_read_readvariableopE
Asavev2_batch_normalization_94_moving_variance_read_readvariableop6
2savev2_conv2d_transpose_kernel_read_readvariableop4
0savev2_conv2d_transpose_bias_read_readvariableop;
7savev2_batch_normalization_95_gamma_read_readvariableop:
6savev2_batch_normalization_95_beta_read_readvariableopA
=savev2_batch_normalization_95_moving_mean_read_readvariableopE
Asavev2_batch_normalization_95_moving_variance_read_readvariableop8
4savev2_conv2d_transpose_1_kernel_read_readvariableop6
2savev2_conv2d_transpose_1_bias_read_readvariableop;
7savev2_batch_normalization_96_gamma_read_readvariableop:
6savev2_batch_normalization_96_beta_read_readvariableopA
=savev2_batch_normalization_96_moving_mean_read_readvariableopE
Asavev2_batch_normalization_96_moving_variance_read_readvariableop8
4savev2_conv2d_transpose_2_kernel_read_readvariableop6
2savev2_conv2d_transpose_2_bias_read_readvariableop;
7savev2_batch_normalization_97_gamma_read_readvariableop:
6savev2_batch_normalization_97_beta_read_readvariableopA
=savev2_batch_normalization_97_moving_mean_read_readvariableopE
Asavev2_batch_normalization_97_moving_variance_read_readvariableop8
4savev2_conv2d_transpose_3_kernel_read_readvariableop6
2savev2_conv2d_transpose_3_bias_read_readvariableop
savev2_const

identity_1ИҐMergeV2Checkpointsw
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*Z
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.parta
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/partБ
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: f

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: L

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :f
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : У
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: №
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*Е
valueыBшB6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-1/gamma/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-1/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-1/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-3/gamma/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-3/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-3/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-5/gamma/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-5/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-5/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-5/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-6/bias/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-7/gamma/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-7/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-7/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-7/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-8/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-8/bias/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH£
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*I
value@B>B B B B B B B B B B B B B B B B B B B B B B B B B B B К
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0'savev2_dense_kernel_read_readvariableop%savev2_dense_bias_read_readvariableop7savev2_batch_normalization_94_gamma_read_readvariableop6savev2_batch_normalization_94_beta_read_readvariableop=savev2_batch_normalization_94_moving_mean_read_readvariableopAsavev2_batch_normalization_94_moving_variance_read_readvariableop2savev2_conv2d_transpose_kernel_read_readvariableop0savev2_conv2d_transpose_bias_read_readvariableop7savev2_batch_normalization_95_gamma_read_readvariableop6savev2_batch_normalization_95_beta_read_readvariableop=savev2_batch_normalization_95_moving_mean_read_readvariableopAsavev2_batch_normalization_95_moving_variance_read_readvariableop4savev2_conv2d_transpose_1_kernel_read_readvariableop2savev2_conv2d_transpose_1_bias_read_readvariableop7savev2_batch_normalization_96_gamma_read_readvariableop6savev2_batch_normalization_96_beta_read_readvariableop=savev2_batch_normalization_96_moving_mean_read_readvariableopAsavev2_batch_normalization_96_moving_variance_read_readvariableop4savev2_conv2d_transpose_2_kernel_read_readvariableop2savev2_conv2d_transpose_2_bias_read_readvariableop7savev2_batch_normalization_97_gamma_read_readvariableop6savev2_batch_normalization_97_beta_read_readvariableop=savev2_batch_normalization_97_moving_mean_read_readvariableopAsavev2_batch_normalization_97_moving_variance_read_readvariableop4savev2_conv2d_transpose_3_kernel_read_readvariableop2savev2_conv2d_transpose_3_bias_read_readvariableopsavev2_const"/device:CPU:0*
_output_shapes
 *)
dtypes
2Р
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:Л
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*
_output_shapes
 f
IdentityIdentityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: Q

Identity_1IdentityIdentity:output:0^NoOp*
T0*
_output_shapes
: [
NoOpNoOp^MergeV2Checkpoints*"
_acd_function_control_output(*
_output_shapes
 "!

identity_1Identity_1:output:0*ч
_input_shapesе
в: :	~А1:А1:А:А:А:А:АА:А:А:А:А:А:@А:@:@:@:@:@: @: : : : : : :: 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:%!

_output_shapes
:	~А1:!

_output_shapes	
:А1:!

_output_shapes	
:А:!

_output_shapes	
:А:!

_output_shapes	
:А:!

_output_shapes	
:А:.*
(
_output_shapes
:АА:!

_output_shapes	
:А:!	

_output_shapes	
:А:!


_output_shapes	
:А:!

_output_shapes	
:А:!

_output_shapes	
:А:-)
'
_output_shapes
:@А: 

_output_shapes
:@: 

_output_shapes
:@: 

_output_shapes
:@: 

_output_shapes
:@: 

_output_shapes
:@:,(
&
_output_shapes
: @: 

_output_shapes
: : 

_output_shapes
: : 

_output_shapes
: : 

_output_shapes
: : 

_output_shapes
: :,(
&
_output_shapes
: : 

_output_shapes
::

_output_shapes
: 
Њ
Ф
%__inference_dense_layer_call_fn_21473

inputs
unknown:	~А1
	unknown_0:	А1
identityИҐStatefulPartitionedCall÷
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:€€€€€€€€€А1*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *I
fDRB
@__inference_dense_layer_call_and_return_conditional_losses_20340p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:€€€€€€€€€А1`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:€€€€€€€€€~: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:€€€€€€€€€~
 
_user_specified_nameinputs
Ч	
’
6__inference_batch_normalization_95_layer_call_fn_21642

inputs
unknown:	А
	unknown_0:	А
	unknown_1:	А
	unknown_2:	А
identityИҐStatefulPartitionedCallЩ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *B
_output_shapes0
.:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *Z
fURS
Q__inference_batch_normalization_95_layer_call_and_return_conditional_losses_20041К
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*B
_output_shapes0
.:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:j f
B
_output_shapes0
.:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А
 
_user_specified_nameinputs
№
†
Q__inference_batch_normalization_94_layer_call_and_return_conditional_losses_19902

inputs&
readvariableop_resource:	А(
readvariableop_1_resource:	А7
(fusedbatchnormv3_readvariableop_resource:	А9
*fusedbatchnormv3_readvariableop_1_resource:	А
identityИҐFusedBatchNormV3/ReadVariableOpҐ!FusedBatchNormV3/ReadVariableOp_1ҐReadVariableOpҐReadVariableOp_1c
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:А*
dtype0g
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes	
:А*
dtype0Е
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:А*
dtype0Й
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:А*
dtype0Ќ
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А:А:А:А:А:*
epsilon%oГ:*
is_training( ~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А∞
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:j f
B
_output_shapes0
.:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А
 
_user_specified_nameinputs
С	
—
6__inference_batch_normalization_96_layer_call_fn_21743

inputs
unknown:@
	unknown_0:@
	unknown_1:@
	unknown_2:@
identityИҐStatefulPartitionedCallЪ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€@*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *Z
fURS
Q__inference_batch_normalization_96_layer_call_and_return_conditional_losses_20118Й
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+€€€€€€€€€€€€€€€€€€€€€€€€€€€@: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€@
 
_user_specified_nameinputs
П	
—
6__inference_batch_normalization_97_layer_call_fn_21870

inputs
unknown: 
	unknown_0: 
	unknown_1: 
	unknown_2: 
identityИҐStatefulPartitionedCallШ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€ *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *Z
fURS
Q__inference_batch_normalization_97_layer_call_and_return_conditional_losses_20257Й
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€ `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+€€€€€€€€€€€€€€€€€€€€€€€€€€€ : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€ 
 
_user_specified_nameinputs
м
d
H__inference_activation_96_layer_call_and_return_conditional_losses_21802

inputs
identityN
ReluReluinputs*
T0*/
_output_shapes
:€€€€€€€€€@b
IdentityIdentityRelu:activations:0*
T0*/
_output_shapes
:€€€€€€€€€@"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:€€€€€€€€€@:W S
/
_output_shapes
:€€€€€€€€€@
 
_user_specified_nameinputs
в
d
H__inference_activation_98_layer_call_and_return_conditional_losses_21968

inputs
identityN
TanhTanhinputs*
T0*/
_output_shapes
:€€€€€€€€€X
IdentityIdentityTanh:y:0*
T0*/
_output_shapes
:€€€€€€€€€"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:€€€€€€€€€:W S
/
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
Ц
ƒ
Q__inference_batch_normalization_95_layer_call_and_return_conditional_losses_21678

inputs&
readvariableop_resource:	А(
readvariableop_1_resource:	А7
(fusedbatchnormv3_readvariableop_resource:	А9
*fusedbatchnormv3_readvariableop_1_resource:	А
identityИҐAssignNewValueҐAssignNewValue_1ҐFusedBatchNormV3/ReadVariableOpҐ!FusedBatchNormV3/ReadVariableOp_1ҐReadVariableOpҐReadVariableOp_1c
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:А*
dtype0g
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes	
:А*
dtype0Е
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:А*
dtype0Й
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:А*
dtype0џ
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А:А:А:А:А:*
epsilon%oГ:*
exponential_avg_factor%
„#<∆
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0*
validate_shape(–
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0*
validate_shape(~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А‘
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:j f
B
_output_shapes0
.:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А
 
_user_specified_nameinputs
ќ
^
B__inference_reshape_layer_call_and_return_conditional_losses_20360

inputs
identity;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:—
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :Q
Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :R
Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value
B :А©
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0Reshape/shape/2:output:0Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:m
ReshapeReshapeinputsReshape/shape:output:0*
T0*0
_output_shapes
:€€€€€€€€€Аa
IdentityIdentityReshape:output:0*
T0*0
_output_shapes
:€€€€€€€€€А"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:€€€€€€€€€А1:P L
(
_output_shapes
:€€€€€€€€€А1
 
_user_specified_nameinputs
юе
г
D__inference_generator_layer_call_and_return_conditional_losses_21451
inputs_0
inputs_17
$dense_matmul_readvariableop_resource:	~А14
%dense_biasadd_readvariableop_resource:	А1=
.batch_normalization_94_readvariableop_resource:	А?
0batch_normalization_94_readvariableop_1_resource:	АN
?batch_normalization_94_fusedbatchnormv3_readvariableop_resource:	АP
Abatch_normalization_94_fusedbatchnormv3_readvariableop_1_resource:	АU
9conv2d_transpose_conv2d_transpose_readvariableop_resource:АА?
0conv2d_transpose_biasadd_readvariableop_resource:	А=
.batch_normalization_95_readvariableop_resource:	А?
0batch_normalization_95_readvariableop_1_resource:	АN
?batch_normalization_95_fusedbatchnormv3_readvariableop_resource:	АP
Abatch_normalization_95_fusedbatchnormv3_readvariableop_1_resource:	АV
;conv2d_transpose_1_conv2d_transpose_readvariableop_resource:@А@
2conv2d_transpose_1_biasadd_readvariableop_resource:@<
.batch_normalization_96_readvariableop_resource:@>
0batch_normalization_96_readvariableop_1_resource:@M
?batch_normalization_96_fusedbatchnormv3_readvariableop_resource:@O
Abatch_normalization_96_fusedbatchnormv3_readvariableop_1_resource:@U
;conv2d_transpose_2_conv2d_transpose_readvariableop_resource: @@
2conv2d_transpose_2_biasadd_readvariableop_resource: <
.batch_normalization_97_readvariableop_resource: >
0batch_normalization_97_readvariableop_1_resource: M
?batch_normalization_97_fusedbatchnormv3_readvariableop_resource: O
Abatch_normalization_97_fusedbatchnormv3_readvariableop_1_resource: U
;conv2d_transpose_3_conv2d_transpose_readvariableop_resource: @
2conv2d_transpose_3_biasadd_readvariableop_resource:
identityИҐ%batch_normalization_94/AssignNewValueҐ'batch_normalization_94/AssignNewValue_1Ґ6batch_normalization_94/FusedBatchNormV3/ReadVariableOpҐ8batch_normalization_94/FusedBatchNormV3/ReadVariableOp_1Ґ%batch_normalization_94/ReadVariableOpҐ'batch_normalization_94/ReadVariableOp_1Ґ%batch_normalization_95/AssignNewValueҐ'batch_normalization_95/AssignNewValue_1Ґ6batch_normalization_95/FusedBatchNormV3/ReadVariableOpҐ8batch_normalization_95/FusedBatchNormV3/ReadVariableOp_1Ґ%batch_normalization_95/ReadVariableOpҐ'batch_normalization_95/ReadVariableOp_1Ґ%batch_normalization_96/AssignNewValueҐ'batch_normalization_96/AssignNewValue_1Ґ6batch_normalization_96/FusedBatchNormV3/ReadVariableOpҐ8batch_normalization_96/FusedBatchNormV3/ReadVariableOp_1Ґ%batch_normalization_96/ReadVariableOpҐ'batch_normalization_96/ReadVariableOp_1Ґ%batch_normalization_97/AssignNewValueҐ'batch_normalization_97/AssignNewValue_1Ґ6batch_normalization_97/FusedBatchNormV3/ReadVariableOpҐ8batch_normalization_97/FusedBatchNormV3/ReadVariableOp_1Ґ%batch_normalization_97/ReadVariableOpҐ'batch_normalization_97/ReadVariableOp_1Ґ'conv2d_transpose/BiasAdd/ReadVariableOpҐ0conv2d_transpose/conv2d_transpose/ReadVariableOpҐ)conv2d_transpose_1/BiasAdd/ReadVariableOpҐ2conv2d_transpose_1/conv2d_transpose/ReadVariableOpҐ)conv2d_transpose_2/BiasAdd/ReadVariableOpҐ2conv2d_transpose_2/conv2d_transpose/ReadVariableOpҐ)conv2d_transpose_3/BiasAdd/ReadVariableOpҐ2conv2d_transpose_3/conv2d_transpose/ReadVariableOpҐdense/BiasAdd/ReadVariableOpҐdense/MatMul/ReadVariableOp[
concatenate_2/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :У
concatenate_2/concatConcatV2inputs_0inputs_1"concatenate_2/concat/axis:output:0*
N*
T0*'
_output_shapes
:€€€€€€€€€~Б
dense/MatMul/ReadVariableOpReadVariableOp$dense_matmul_readvariableop_resource*
_output_shapes
:	~А1*
dtype0Н
dense/MatMulMatMulconcatenate_2/concat:output:0#dense/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:€€€€€€€€€А1
dense/BiasAdd/ReadVariableOpReadVariableOp%dense_biasadd_readvariableop_resource*
_output_shapes	
:А1*
dtype0Й
dense/BiasAddBiasAdddense/MatMul:product:0$dense/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:€€€€€€€€€А1S
reshape/ShapeShapedense/BiasAdd:output:0*
T0*
_output_shapes
:e
reshape/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: g
reshape/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:g
reshape/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:щ
reshape/strided_sliceStridedSlicereshape/Shape:output:0$reshape/strided_slice/stack:output:0&reshape/strided_slice/stack_1:output:0&reshape/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskY
reshape/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :Y
reshape/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :Z
reshape/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value
B :А—
reshape/Reshape/shapePackreshape/strided_slice:output:0 reshape/Reshape/shape/1:output:0 reshape/Reshape/shape/2:output:0 reshape/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:Н
reshape/ReshapeReshapedense/BiasAdd:output:0reshape/Reshape/shape:output:0*
T0*0
_output_shapes
:€€€€€€€€€АС
%batch_normalization_94/ReadVariableOpReadVariableOp.batch_normalization_94_readvariableop_resource*
_output_shapes	
:А*
dtype0Х
'batch_normalization_94/ReadVariableOp_1ReadVariableOp0batch_normalization_94_readvariableop_1_resource*
_output_shapes	
:А*
dtype0≥
6batch_normalization_94/FusedBatchNormV3/ReadVariableOpReadVariableOp?batch_normalization_94_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:А*
dtype0Ј
8batch_normalization_94/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpAbatch_normalization_94_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:А*
dtype0ќ
'batch_normalization_94/FusedBatchNormV3FusedBatchNormV3reshape/Reshape:output:0-batch_normalization_94/ReadVariableOp:value:0/batch_normalization_94/ReadVariableOp_1:value:0>batch_normalization_94/FusedBatchNormV3/ReadVariableOp:value:0@batch_normalization_94/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:€€€€€€€€€А:А:А:А:А:*
epsilon%oГ:*
exponential_avg_factor%
„#<Ґ
%batch_normalization_94/AssignNewValueAssignVariableOp?batch_normalization_94_fusedbatchnormv3_readvariableop_resource4batch_normalization_94/FusedBatchNormV3:batch_mean:07^batch_normalization_94/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0*
validate_shape(ђ
'batch_normalization_94/AssignNewValue_1AssignVariableOpAbatch_normalization_94_fusedbatchnormv3_readvariableop_1_resource8batch_normalization_94/FusedBatchNormV3:batch_variance:09^batch_normalization_94/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0*
validate_shape(В
activation_94/ReluRelu+batch_normalization_94/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:€€€€€€€€€Аf
conv2d_transpose/ShapeShape activation_94/Relu:activations:0*
T0*
_output_shapes
:n
$conv2d_transpose/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: p
&conv2d_transpose/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:p
&conv2d_transpose/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:¶
conv2d_transpose/strided_sliceStridedSliceconv2d_transpose/Shape:output:0-conv2d_transpose/strided_slice/stack:output:0/conv2d_transpose/strided_slice/stack_1:output:0/conv2d_transpose/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskZ
conv2d_transpose/stack/1Const*
_output_shapes
: *
dtype0*
value	B :Z
conv2d_transpose/stack/2Const*
_output_shapes
: *
dtype0*
value	B :[
conv2d_transpose/stack/3Const*
_output_shapes
: *
dtype0*
value
B :Аё
conv2d_transpose/stackPack'conv2d_transpose/strided_slice:output:0!conv2d_transpose/stack/1:output:0!conv2d_transpose/stack/2:output:0!conv2d_transpose/stack/3:output:0*
N*
T0*
_output_shapes
:p
&conv2d_transpose/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: r
(conv2d_transpose/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:r
(conv2d_transpose/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ѓ
 conv2d_transpose/strided_slice_1StridedSliceconv2d_transpose/stack:output:0/conv2d_transpose/strided_slice_1/stack:output:01conv2d_transpose/strided_slice_1/stack_1:output:01conv2d_transpose/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskі
0conv2d_transpose/conv2d_transpose/ReadVariableOpReadVariableOp9conv2d_transpose_conv2d_transpose_readvariableop_resource*(
_output_shapes
:АА*
dtype0Ш
!conv2d_transpose/conv2d_transposeConv2DBackpropInputconv2d_transpose/stack:output:08conv2d_transpose/conv2d_transpose/ReadVariableOp:value:0 activation_94/Relu:activations:0*
T0*0
_output_shapes
:€€€€€€€€€А*
paddingSAME*
strides
Х
'conv2d_transpose/BiasAdd/ReadVariableOpReadVariableOp0conv2d_transpose_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0ї
conv2d_transpose/BiasAddBiasAdd*conv2d_transpose/conv2d_transpose:output:0/conv2d_transpose/BiasAdd/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€АС
%batch_normalization_95/ReadVariableOpReadVariableOp.batch_normalization_95_readvariableop_resource*
_output_shapes	
:А*
dtype0Х
'batch_normalization_95/ReadVariableOp_1ReadVariableOp0batch_normalization_95_readvariableop_1_resource*
_output_shapes	
:А*
dtype0≥
6batch_normalization_95/FusedBatchNormV3/ReadVariableOpReadVariableOp?batch_normalization_95_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:А*
dtype0Ј
8batch_normalization_95/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpAbatch_normalization_95_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:А*
dtype0„
'batch_normalization_95/FusedBatchNormV3FusedBatchNormV3!conv2d_transpose/BiasAdd:output:0-batch_normalization_95/ReadVariableOp:value:0/batch_normalization_95/ReadVariableOp_1:value:0>batch_normalization_95/FusedBatchNormV3/ReadVariableOp:value:0@batch_normalization_95/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:€€€€€€€€€А:А:А:А:А:*
epsilon%oГ:*
exponential_avg_factor%
„#<Ґ
%batch_normalization_95/AssignNewValueAssignVariableOp?batch_normalization_95_fusedbatchnormv3_readvariableop_resource4batch_normalization_95/FusedBatchNormV3:batch_mean:07^batch_normalization_95/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0*
validate_shape(ђ
'batch_normalization_95/AssignNewValue_1AssignVariableOpAbatch_normalization_95_fusedbatchnormv3_readvariableop_1_resource8batch_normalization_95/FusedBatchNormV3:batch_variance:09^batch_normalization_95/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0*
validate_shape(В
activation_95/ReluRelu+batch_normalization_95/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:€€€€€€€€€Аh
conv2d_transpose_1/ShapeShape activation_95/Relu:activations:0*
T0*
_output_shapes
:p
&conv2d_transpose_1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: r
(conv2d_transpose_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:r
(conv2d_transpose_1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:∞
 conv2d_transpose_1/strided_sliceStridedSlice!conv2d_transpose_1/Shape:output:0/conv2d_transpose_1/strided_slice/stack:output:01conv2d_transpose_1/strided_slice/stack_1:output:01conv2d_transpose_1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask\
conv2d_transpose_1/stack/1Const*
_output_shapes
: *
dtype0*
value	B :\
conv2d_transpose_1/stack/2Const*
_output_shapes
: *
dtype0*
value	B :\
conv2d_transpose_1/stack/3Const*
_output_shapes
: *
dtype0*
value	B :@и
conv2d_transpose_1/stackPack)conv2d_transpose_1/strided_slice:output:0#conv2d_transpose_1/stack/1:output:0#conv2d_transpose_1/stack/2:output:0#conv2d_transpose_1/stack/3:output:0*
N*
T0*
_output_shapes
:r
(conv2d_transpose_1/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: t
*conv2d_transpose_1/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:t
*conv2d_transpose_1/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Є
"conv2d_transpose_1/strided_slice_1StridedSlice!conv2d_transpose_1/stack:output:01conv2d_transpose_1/strided_slice_1/stack:output:03conv2d_transpose_1/strided_slice_1/stack_1:output:03conv2d_transpose_1/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskЈ
2conv2d_transpose_1/conv2d_transpose/ReadVariableOpReadVariableOp;conv2d_transpose_1_conv2d_transpose_readvariableop_resource*'
_output_shapes
:@А*
dtype0Э
#conv2d_transpose_1/conv2d_transposeConv2DBackpropInput!conv2d_transpose_1/stack:output:0:conv2d_transpose_1/conv2d_transpose/ReadVariableOp:value:0 activation_95/Relu:activations:0*
T0*/
_output_shapes
:€€€€€€€€€@*
paddingSAME*
strides
Ш
)conv2d_transpose_1/BiasAdd/ReadVariableOpReadVariableOp2conv2d_transpose_1_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0ј
conv2d_transpose_1/BiasAddBiasAdd,conv2d_transpose_1/conv2d_transpose:output:01conv2d_transpose_1/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@Р
%batch_normalization_96/ReadVariableOpReadVariableOp.batch_normalization_96_readvariableop_resource*
_output_shapes
:@*
dtype0Ф
'batch_normalization_96/ReadVariableOp_1ReadVariableOp0batch_normalization_96_readvariableop_1_resource*
_output_shapes
:@*
dtype0≤
6batch_normalization_96/FusedBatchNormV3/ReadVariableOpReadVariableOp?batch_normalization_96_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:@*
dtype0ґ
8batch_normalization_96/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpAbatch_normalization_96_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:@*
dtype0‘
'batch_normalization_96/FusedBatchNormV3FusedBatchNormV3#conv2d_transpose_1/BiasAdd:output:0-batch_normalization_96/ReadVariableOp:value:0/batch_normalization_96/ReadVariableOp_1:value:0>batch_normalization_96/FusedBatchNormV3/ReadVariableOp:value:0@batch_normalization_96/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:€€€€€€€€€@:@:@:@:@:*
epsilon%oГ:*
exponential_avg_factor%
„#<Ґ
%batch_normalization_96/AssignNewValueAssignVariableOp?batch_normalization_96_fusedbatchnormv3_readvariableop_resource4batch_normalization_96/FusedBatchNormV3:batch_mean:07^batch_normalization_96/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0*
validate_shape(ђ
'batch_normalization_96/AssignNewValue_1AssignVariableOpAbatch_normalization_96_fusedbatchnormv3_readvariableop_1_resource8batch_normalization_96/FusedBatchNormV3:batch_variance:09^batch_normalization_96/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0*
validate_shape(Б
activation_96/ReluRelu+batch_normalization_96/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:€€€€€€€€€@h
conv2d_transpose_2/ShapeShape activation_96/Relu:activations:0*
T0*
_output_shapes
:p
&conv2d_transpose_2/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: r
(conv2d_transpose_2/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:r
(conv2d_transpose_2/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:∞
 conv2d_transpose_2/strided_sliceStridedSlice!conv2d_transpose_2/Shape:output:0/conv2d_transpose_2/strided_slice/stack:output:01conv2d_transpose_2/strided_slice/stack_1:output:01conv2d_transpose_2/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask\
conv2d_transpose_2/stack/1Const*
_output_shapes
: *
dtype0*
value	B :\
conv2d_transpose_2/stack/2Const*
_output_shapes
: *
dtype0*
value	B :\
conv2d_transpose_2/stack/3Const*
_output_shapes
: *
dtype0*
value	B : и
conv2d_transpose_2/stackPack)conv2d_transpose_2/strided_slice:output:0#conv2d_transpose_2/stack/1:output:0#conv2d_transpose_2/stack/2:output:0#conv2d_transpose_2/stack/3:output:0*
N*
T0*
_output_shapes
:r
(conv2d_transpose_2/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: t
*conv2d_transpose_2/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:t
*conv2d_transpose_2/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Є
"conv2d_transpose_2/strided_slice_1StridedSlice!conv2d_transpose_2/stack:output:01conv2d_transpose_2/strided_slice_1/stack:output:03conv2d_transpose_2/strided_slice_1/stack_1:output:03conv2d_transpose_2/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskґ
2conv2d_transpose_2/conv2d_transpose/ReadVariableOpReadVariableOp;conv2d_transpose_2_conv2d_transpose_readvariableop_resource*&
_output_shapes
: @*
dtype0Э
#conv2d_transpose_2/conv2d_transposeConv2DBackpropInput!conv2d_transpose_2/stack:output:0:conv2d_transpose_2/conv2d_transpose/ReadVariableOp:value:0 activation_96/Relu:activations:0*
T0*/
_output_shapes
:€€€€€€€€€ *
paddingSAME*
strides
Ш
)conv2d_transpose_2/BiasAdd/ReadVariableOpReadVariableOp2conv2d_transpose_2_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0ј
conv2d_transpose_2/BiasAddBiasAdd,conv2d_transpose_2/conv2d_transpose:output:01conv2d_transpose_2/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€ Р
%batch_normalization_97/ReadVariableOpReadVariableOp.batch_normalization_97_readvariableop_resource*
_output_shapes
: *
dtype0Ф
'batch_normalization_97/ReadVariableOp_1ReadVariableOp0batch_normalization_97_readvariableop_1_resource*
_output_shapes
: *
dtype0≤
6batch_normalization_97/FusedBatchNormV3/ReadVariableOpReadVariableOp?batch_normalization_97_fusedbatchnormv3_readvariableop_resource*
_output_shapes
: *
dtype0ґ
8batch_normalization_97/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpAbatch_normalization_97_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
: *
dtype0‘
'batch_normalization_97/FusedBatchNormV3FusedBatchNormV3#conv2d_transpose_2/BiasAdd:output:0-batch_normalization_97/ReadVariableOp:value:0/batch_normalization_97/ReadVariableOp_1:value:0>batch_normalization_97/FusedBatchNormV3/ReadVariableOp:value:0@batch_normalization_97/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:€€€€€€€€€ : : : : :*
epsilon%oГ:*
exponential_avg_factor%
„#<Ґ
%batch_normalization_97/AssignNewValueAssignVariableOp?batch_normalization_97_fusedbatchnormv3_readvariableop_resource4batch_normalization_97/FusedBatchNormV3:batch_mean:07^batch_normalization_97/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0*
validate_shape(ђ
'batch_normalization_97/AssignNewValue_1AssignVariableOpAbatch_normalization_97_fusedbatchnormv3_readvariableop_1_resource8batch_normalization_97/FusedBatchNormV3:batch_variance:09^batch_normalization_97/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0*
validate_shape(Б
activation_97/ReluRelu+batch_normalization_97/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:€€€€€€€€€ h
conv2d_transpose_3/ShapeShape activation_97/Relu:activations:0*
T0*
_output_shapes
:p
&conv2d_transpose_3/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: r
(conv2d_transpose_3/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:r
(conv2d_transpose_3/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:∞
 conv2d_transpose_3/strided_sliceStridedSlice!conv2d_transpose_3/Shape:output:0/conv2d_transpose_3/strided_slice/stack:output:01conv2d_transpose_3/strided_slice/stack_1:output:01conv2d_transpose_3/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask\
conv2d_transpose_3/stack/1Const*
_output_shapes
: *
dtype0*
value	B :\
conv2d_transpose_3/stack/2Const*
_output_shapes
: *
dtype0*
value	B :\
conv2d_transpose_3/stack/3Const*
_output_shapes
: *
dtype0*
value	B :и
conv2d_transpose_3/stackPack)conv2d_transpose_3/strided_slice:output:0#conv2d_transpose_3/stack/1:output:0#conv2d_transpose_3/stack/2:output:0#conv2d_transpose_3/stack/3:output:0*
N*
T0*
_output_shapes
:r
(conv2d_transpose_3/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: t
*conv2d_transpose_3/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:t
*conv2d_transpose_3/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Є
"conv2d_transpose_3/strided_slice_1StridedSlice!conv2d_transpose_3/stack:output:01conv2d_transpose_3/strided_slice_1/stack:output:03conv2d_transpose_3/strided_slice_1/stack_1:output:03conv2d_transpose_3/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskґ
2conv2d_transpose_3/conv2d_transpose/ReadVariableOpReadVariableOp;conv2d_transpose_3_conv2d_transpose_readvariableop_resource*&
_output_shapes
: *
dtype0Э
#conv2d_transpose_3/conv2d_transposeConv2DBackpropInput!conv2d_transpose_3/stack:output:0:conv2d_transpose_3/conv2d_transpose/ReadVariableOp:value:0 activation_97/Relu:activations:0*
T0*/
_output_shapes
:€€€€€€€€€*
paddingSAME*
strides
Ш
)conv2d_transpose_3/BiasAdd/ReadVariableOpReadVariableOp2conv2d_transpose_3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0ј
conv2d_transpose_3/BiasAddBiasAdd,conv2d_transpose_3/conv2d_transpose:output:01conv2d_transpose_3/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€y
activation_98/TanhTanh#conv2d_transpose_3/BiasAdd:output:0*
T0*/
_output_shapes
:€€€€€€€€€m
IdentityIdentityactivation_98/Tanh:y:0^NoOp*
T0*/
_output_shapes
:€€€€€€€€€г
NoOpNoOp&^batch_normalization_94/AssignNewValue(^batch_normalization_94/AssignNewValue_17^batch_normalization_94/FusedBatchNormV3/ReadVariableOp9^batch_normalization_94/FusedBatchNormV3/ReadVariableOp_1&^batch_normalization_94/ReadVariableOp(^batch_normalization_94/ReadVariableOp_1&^batch_normalization_95/AssignNewValue(^batch_normalization_95/AssignNewValue_17^batch_normalization_95/FusedBatchNormV3/ReadVariableOp9^batch_normalization_95/FusedBatchNormV3/ReadVariableOp_1&^batch_normalization_95/ReadVariableOp(^batch_normalization_95/ReadVariableOp_1&^batch_normalization_96/AssignNewValue(^batch_normalization_96/AssignNewValue_17^batch_normalization_96/FusedBatchNormV3/ReadVariableOp9^batch_normalization_96/FusedBatchNormV3/ReadVariableOp_1&^batch_normalization_96/ReadVariableOp(^batch_normalization_96/ReadVariableOp_1&^batch_normalization_97/AssignNewValue(^batch_normalization_97/AssignNewValue_17^batch_normalization_97/FusedBatchNormV3/ReadVariableOp9^batch_normalization_97/FusedBatchNormV3/ReadVariableOp_1&^batch_normalization_97/ReadVariableOp(^batch_normalization_97/ReadVariableOp_1(^conv2d_transpose/BiasAdd/ReadVariableOp1^conv2d_transpose/conv2d_transpose/ReadVariableOp*^conv2d_transpose_1/BiasAdd/ReadVariableOp3^conv2d_transpose_1/conv2d_transpose/ReadVariableOp*^conv2d_transpose_2/BiasAdd/ReadVariableOp3^conv2d_transpose_2/conv2d_transpose/ReadVariableOp*^conv2d_transpose_3/BiasAdd/ReadVariableOp3^conv2d_transpose_3/conv2d_transpose/ReadVariableOp^dense/BiasAdd/ReadVariableOp^dense/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*m
_input_shapes\
Z:€€€€€€€€€d:€€€€€€€€€: : : : : : : : : : : : : : : : : : : : : : : : : : 2N
%batch_normalization_94/AssignNewValue%batch_normalization_94/AssignNewValue2R
'batch_normalization_94/AssignNewValue_1'batch_normalization_94/AssignNewValue_12p
6batch_normalization_94/FusedBatchNormV3/ReadVariableOp6batch_normalization_94/FusedBatchNormV3/ReadVariableOp2t
8batch_normalization_94/FusedBatchNormV3/ReadVariableOp_18batch_normalization_94/FusedBatchNormV3/ReadVariableOp_12N
%batch_normalization_94/ReadVariableOp%batch_normalization_94/ReadVariableOp2R
'batch_normalization_94/ReadVariableOp_1'batch_normalization_94/ReadVariableOp_12N
%batch_normalization_95/AssignNewValue%batch_normalization_95/AssignNewValue2R
'batch_normalization_95/AssignNewValue_1'batch_normalization_95/AssignNewValue_12p
6batch_normalization_95/FusedBatchNormV3/ReadVariableOp6batch_normalization_95/FusedBatchNormV3/ReadVariableOp2t
8batch_normalization_95/FusedBatchNormV3/ReadVariableOp_18batch_normalization_95/FusedBatchNormV3/ReadVariableOp_12N
%batch_normalization_95/ReadVariableOp%batch_normalization_95/ReadVariableOp2R
'batch_normalization_95/ReadVariableOp_1'batch_normalization_95/ReadVariableOp_12N
%batch_normalization_96/AssignNewValue%batch_normalization_96/AssignNewValue2R
'batch_normalization_96/AssignNewValue_1'batch_normalization_96/AssignNewValue_12p
6batch_normalization_96/FusedBatchNormV3/ReadVariableOp6batch_normalization_96/FusedBatchNormV3/ReadVariableOp2t
8batch_normalization_96/FusedBatchNormV3/ReadVariableOp_18batch_normalization_96/FusedBatchNormV3/ReadVariableOp_12N
%batch_normalization_96/ReadVariableOp%batch_normalization_96/ReadVariableOp2R
'batch_normalization_96/ReadVariableOp_1'batch_normalization_96/ReadVariableOp_12N
%batch_normalization_97/AssignNewValue%batch_normalization_97/AssignNewValue2R
'batch_normalization_97/AssignNewValue_1'batch_normalization_97/AssignNewValue_12p
6batch_normalization_97/FusedBatchNormV3/ReadVariableOp6batch_normalization_97/FusedBatchNormV3/ReadVariableOp2t
8batch_normalization_97/FusedBatchNormV3/ReadVariableOp_18batch_normalization_97/FusedBatchNormV3/ReadVariableOp_12N
%batch_normalization_97/ReadVariableOp%batch_normalization_97/ReadVariableOp2R
'batch_normalization_97/ReadVariableOp_1'batch_normalization_97/ReadVariableOp_12R
'conv2d_transpose/BiasAdd/ReadVariableOp'conv2d_transpose/BiasAdd/ReadVariableOp2d
0conv2d_transpose/conv2d_transpose/ReadVariableOp0conv2d_transpose/conv2d_transpose/ReadVariableOp2V
)conv2d_transpose_1/BiasAdd/ReadVariableOp)conv2d_transpose_1/BiasAdd/ReadVariableOp2h
2conv2d_transpose_1/conv2d_transpose/ReadVariableOp2conv2d_transpose_1/conv2d_transpose/ReadVariableOp2V
)conv2d_transpose_2/BiasAdd/ReadVariableOp)conv2d_transpose_2/BiasAdd/ReadVariableOp2h
2conv2d_transpose_2/conv2d_transpose/ReadVariableOp2conv2d_transpose_2/conv2d_transpose/ReadVariableOp2V
)conv2d_transpose_3/BiasAdd/ReadVariableOp)conv2d_transpose_3/BiasAdd/ReadVariableOp2h
2conv2d_transpose_3/conv2d_transpose/ReadVariableOp2conv2d_transpose_3/conv2d_transpose/ReadVariableOp2<
dense/BiasAdd/ReadVariableOpdense/BiasAdd/ReadVariableOp2:
dense/MatMul/ReadVariableOpdense/MatMul/ReadVariableOp:Q M
'
_output_shapes
:€€€€€€€€€d
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:€€€€€€€€€
"
_user_specified_name
inputs/1
√l
§
!__inference__traced_restore_22158
file_prefix0
assignvariableop_dense_kernel:	~А1,
assignvariableop_1_dense_bias:	А1>
/assignvariableop_2_batch_normalization_94_gamma:	А=
.assignvariableop_3_batch_normalization_94_beta:	АD
5assignvariableop_4_batch_normalization_94_moving_mean:	АH
9assignvariableop_5_batch_normalization_94_moving_variance:	АF
*assignvariableop_6_conv2d_transpose_kernel:АА7
(assignvariableop_7_conv2d_transpose_bias:	А>
/assignvariableop_8_batch_normalization_95_gamma:	А=
.assignvariableop_9_batch_normalization_95_beta:	АE
6assignvariableop_10_batch_normalization_95_moving_mean:	АI
:assignvariableop_11_batch_normalization_95_moving_variance:	АH
-assignvariableop_12_conv2d_transpose_1_kernel:@А9
+assignvariableop_13_conv2d_transpose_1_bias:@>
0assignvariableop_14_batch_normalization_96_gamma:@=
/assignvariableop_15_batch_normalization_96_beta:@D
6assignvariableop_16_batch_normalization_96_moving_mean:@H
:assignvariableop_17_batch_normalization_96_moving_variance:@G
-assignvariableop_18_conv2d_transpose_2_kernel: @9
+assignvariableop_19_conv2d_transpose_2_bias: >
0assignvariableop_20_batch_normalization_97_gamma: =
/assignvariableop_21_batch_normalization_97_beta: D
6assignvariableop_22_batch_normalization_97_moving_mean: H
:assignvariableop_23_batch_normalization_97_moving_variance: G
-assignvariableop_24_conv2d_transpose_3_kernel: 9
+assignvariableop_25_conv2d_transpose_3_bias:
identity_27ИҐAssignVariableOpҐAssignVariableOp_1ҐAssignVariableOp_10ҐAssignVariableOp_11ҐAssignVariableOp_12ҐAssignVariableOp_13ҐAssignVariableOp_14ҐAssignVariableOp_15ҐAssignVariableOp_16ҐAssignVariableOp_17ҐAssignVariableOp_18ҐAssignVariableOp_19ҐAssignVariableOp_2ҐAssignVariableOp_20ҐAssignVariableOp_21ҐAssignVariableOp_22ҐAssignVariableOp_23ҐAssignVariableOp_24ҐAssignVariableOp_25ҐAssignVariableOp_3ҐAssignVariableOp_4ҐAssignVariableOp_5ҐAssignVariableOp_6ҐAssignVariableOp_7ҐAssignVariableOp_8ҐAssignVariableOp_9я
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*Е
valueыBшB6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-1/gamma/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-1/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-1/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-3/gamma/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-3/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-3/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-5/gamma/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-5/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-5/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-5/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-6/bias/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-7/gamma/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-7/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-7/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-7/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-8/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-8/bias/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH¶
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*I
value@B>B B B B B B B B B B B B B B B B B B B B B B B B B B B ¶
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*А
_output_shapesn
l:::::::::::::::::::::::::::*)
dtypes
2[
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:И
AssignVariableOpAssignVariableOpassignvariableop_dense_kernelIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:М
AssignVariableOp_1AssignVariableOpassignvariableop_1_dense_biasIdentity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:Ю
AssignVariableOp_2AssignVariableOp/assignvariableop_2_batch_normalization_94_gammaIdentity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:Э
AssignVariableOp_3AssignVariableOp.assignvariableop_3_batch_normalization_94_betaIdentity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:§
AssignVariableOp_4AssignVariableOp5assignvariableop_4_batch_normalization_94_moving_meanIdentity_4:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:®
AssignVariableOp_5AssignVariableOp9assignvariableop_5_batch_normalization_94_moving_varianceIdentity_5:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:Щ
AssignVariableOp_6AssignVariableOp*assignvariableop_6_conv2d_transpose_kernelIdentity_6:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:Ч
AssignVariableOp_7AssignVariableOp(assignvariableop_7_conv2d_transpose_biasIdentity_7:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:Ю
AssignVariableOp_8AssignVariableOp/assignvariableop_8_batch_normalization_95_gammaIdentity_8:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:Э
AssignVariableOp_9AssignVariableOp.assignvariableop_9_batch_normalization_95_betaIdentity_9:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:І
AssignVariableOp_10AssignVariableOp6assignvariableop_10_batch_normalization_95_moving_meanIdentity_10:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:Ђ
AssignVariableOp_11AssignVariableOp:assignvariableop_11_batch_normalization_95_moving_varianceIdentity_11:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
:Ю
AssignVariableOp_12AssignVariableOp-assignvariableop_12_conv2d_transpose_1_kernelIdentity_12:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:Ь
AssignVariableOp_13AssignVariableOp+assignvariableop_13_conv2d_transpose_1_biasIdentity_13:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0*
_output_shapes
:°
AssignVariableOp_14AssignVariableOp0assignvariableop_14_batch_normalization_96_gammaIdentity_14:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:†
AssignVariableOp_15AssignVariableOp/assignvariableop_15_batch_normalization_96_betaIdentity_15:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_16IdentityRestoreV2:tensors:16"/device:CPU:0*
T0*
_output_shapes
:І
AssignVariableOp_16AssignVariableOp6assignvariableop_16_batch_normalization_96_moving_meanIdentity_16:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_17IdentityRestoreV2:tensors:17"/device:CPU:0*
T0*
_output_shapes
:Ђ
AssignVariableOp_17AssignVariableOp:assignvariableop_17_batch_normalization_96_moving_varianceIdentity_17:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_18IdentityRestoreV2:tensors:18"/device:CPU:0*
T0*
_output_shapes
:Ю
AssignVariableOp_18AssignVariableOp-assignvariableop_18_conv2d_transpose_2_kernelIdentity_18:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_19IdentityRestoreV2:tensors:19"/device:CPU:0*
T0*
_output_shapes
:Ь
AssignVariableOp_19AssignVariableOp+assignvariableop_19_conv2d_transpose_2_biasIdentity_19:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_20IdentityRestoreV2:tensors:20"/device:CPU:0*
T0*
_output_shapes
:°
AssignVariableOp_20AssignVariableOp0assignvariableop_20_batch_normalization_97_gammaIdentity_20:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_21IdentityRestoreV2:tensors:21"/device:CPU:0*
T0*
_output_shapes
:†
AssignVariableOp_21AssignVariableOp/assignvariableop_21_batch_normalization_97_betaIdentity_21:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_22IdentityRestoreV2:tensors:22"/device:CPU:0*
T0*
_output_shapes
:І
AssignVariableOp_22AssignVariableOp6assignvariableop_22_batch_normalization_97_moving_meanIdentity_22:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_23IdentityRestoreV2:tensors:23"/device:CPU:0*
T0*
_output_shapes
:Ђ
AssignVariableOp_23AssignVariableOp:assignvariableop_23_batch_normalization_97_moving_varianceIdentity_23:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_24IdentityRestoreV2:tensors:24"/device:CPU:0*
T0*
_output_shapes
:Ю
AssignVariableOp_24AssignVariableOp-assignvariableop_24_conv2d_transpose_3_kernelIdentity_24:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_25IdentityRestoreV2:tensors:25"/device:CPU:0*
T0*
_output_shapes
:Ь
AssignVariableOp_25AssignVariableOp+assignvariableop_25_conv2d_transpose_3_biasIdentity_25:output:0"/device:CPU:0*
_output_shapes
 *
dtype01
NoOpNoOp"/device:CPU:0*
_output_shapes
 Л
Identity_26Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: W
Identity_27IdentityIdentity_26:output:0^NoOp_1*
T0*
_output_shapes
: ш
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*"
_acd_function_control_output(*
_output_shapes
 "#
identity_27Identity_27:output:0*I
_input_shapes8
6: : : : : : : : : : : : : : : : : : : : : : : : : : : 2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12*
AssignVariableOp_10AssignVariableOp_102*
AssignVariableOp_11AssignVariableOp_112*
AssignVariableOp_12AssignVariableOp_122*
AssignVariableOp_13AssignVariableOp_132*
AssignVariableOp_14AssignVariableOp_142*
AssignVariableOp_15AssignVariableOp_152*
AssignVariableOp_16AssignVariableOp_162*
AssignVariableOp_17AssignVariableOp_172*
AssignVariableOp_18AssignVariableOp_182*
AssignVariableOp_19AssignVariableOp_192(
AssignVariableOp_2AssignVariableOp_22*
AssignVariableOp_20AssignVariableOp_202*
AssignVariableOp_21AssignVariableOp_212*
AssignVariableOp_22AssignVariableOp_222*
AssignVariableOp_23AssignVariableOp_232*
AssignVariableOp_24AssignVariableOp_242*
AssignVariableOp_25AssignVariableOp_252(
AssignVariableOp_3AssignVariableOp_32(
AssignVariableOp_4AssignVariableOp_42(
AssignVariableOp_5AssignVariableOp_52(
AssignVariableOp_6AssignVariableOp_62(
AssignVariableOp_7AssignVariableOp_72(
AssignVariableOp_8AssignVariableOp_82(
AssignVariableOp_9AssignVariableOp_9:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
 	
у
@__inference_dense_layer_call_and_return_conditional_losses_21483

inputs1
matmul_readvariableop_resource:	~А1.
biasadd_readvariableop_resource:	А1
identityИҐBiasAdd/ReadVariableOpҐMatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	~А1*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:€€€€€€€€€А1s
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:А1*
dtype0w
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:€€€€€€€€€А1`
IdentityIdentityBiasAdd:output:0^NoOp*
T0*(
_output_shapes
:€€€€€€€€€А1w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:€€€€€€€€€~: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:€€€€€€€€€~
 
_user_specified_nameinputs
ў 
Ы
M__inference_conv2d_transpose_1_layer_call_and_return_conditional_losses_21730

inputsC
(conv2d_transpose_readvariableop_resource:@А-
biasadd_readvariableop_resource:@
identityИҐBiasAdd/ReadVariableOpҐconv2d_transpose/ReadVariableOp;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:—
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ў
strided_slice_1StridedSliceShape:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ў
strided_slice_2StridedSliceShape:output:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskG
mul/yConst*
_output_shapes
: *
dtype0*
value	B :U
mulMulstrided_slice_1:output:0mul/y:output:0*
T0*
_output_shapes
: I
mul_1/yConst*
_output_shapes
: *
dtype0*
value	B :Y
mul_1Mulstrided_slice_2:output:0mul_1/y:output:0*
T0*
_output_shapes
: I
stack/3Const*
_output_shapes
: *
dtype0*
value	B :@y
stackPackstrided_slice:output:0mul:z:0	mul_1:z:0stack/3:output:0*
N*
T0*
_output_shapes
:_
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ў
strided_slice_3StridedSlicestack:output:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskС
conv2d_transpose/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*'
_output_shapes
:@А*
dtype0№
conv2d_transposeConv2DBackpropInputstack:output:0'conv2d_transpose/ReadVariableOp:value:0inputs*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€@*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0Щ
BiasAddBiasAddconv2d_transpose:output:0BiasAdd/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€@y
IdentityIdentityBiasAdd:output:0^NoOp*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€@Б
NoOpNoOp^BiasAdd/ReadVariableOp ^conv2d_transpose/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*E
_input_shapes4
2:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2B
conv2d_transpose/ReadVariableOpconv2d_transpose/ReadVariableOp:j f
B
_output_shapes0
.:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А
 
_user_specified_nameinputs
н
…
)__inference_generator_layer_call_fn_20509
input_2
input_3
unknown:	~А1
	unknown_0:	А1
	unknown_1:	А
	unknown_2:	А
	unknown_3:	А
	unknown_4:	А%
	unknown_5:АА
	unknown_6:	А
	unknown_7:	А
	unknown_8:	А
	unknown_9:	А

unknown_10:	А%

unknown_11:@А

unknown_12:@

unknown_13:@

unknown_14:@

unknown_15:@

unknown_16:@$

unknown_17: @

unknown_18: 

unknown_19: 

unknown_20: 

unknown_21: 

unknown_22: $

unknown_23: 

unknown_24:
identityИҐStatefulPartitionedCall≥
StatefulPartitionedCallStatefulPartitionedCallinput_2input_3unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20
unknown_21
unknown_22
unknown_23
unknown_24*'
Tin 
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€*<
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8В *M
fHRF
D__inference_generator_layer_call_and_return_conditional_losses_20454w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:€€€€€€€€€`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*m
_input_shapes\
Z:€€€€€€€€€d:€€€€€€€€€: : : : : : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
'
_output_shapes
:€€€€€€€€€d
!
_user_specified_name	input_2:PL
'
_output_shapes
:€€€€€€€€€
!
_user_specified_name	input_3
’ 
Ъ
M__inference_conv2d_transpose_2_layer_call_and_return_conditional_losses_20197

inputsB
(conv2d_transpose_readvariableop_resource: @-
biasadd_readvariableop_resource: 
identityИҐBiasAdd/ReadVariableOpҐconv2d_transpose/ReadVariableOp;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:—
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ў
strided_slice_1StridedSliceShape:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ў
strided_slice_2StridedSliceShape:output:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskG
mul/yConst*
_output_shapes
: *
dtype0*
value	B :U
mulMulstrided_slice_1:output:0mul/y:output:0*
T0*
_output_shapes
: I
mul_1/yConst*
_output_shapes
: *
dtype0*
value	B :Y
mul_1Mulstrided_slice_2:output:0mul_1/y:output:0*
T0*
_output_shapes
: I
stack/3Const*
_output_shapes
: *
dtype0*
value	B : y
stackPackstrided_slice:output:0mul:z:0	mul_1:z:0stack/3:output:0*
N*
T0*
_output_shapes
:_
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ў
strided_slice_3StridedSlicestack:output:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskР
conv2d_transpose/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
: @*
dtype0№
conv2d_transposeConv2DBackpropInputstack:output:0'conv2d_transpose/ReadVariableOp:value:0inputs*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€ *
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype0Щ
BiasAddBiasAddconv2d_transpose:output:0BiasAdd/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€ y
IdentityIdentityBiasAdd:output:0^NoOp*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€ Б
NoOpNoOp^BiasAdd/ReadVariableOp ^conv2d_transpose/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+€€€€€€€€€€€€€€€€€€€€€€€€€€€@: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2B
conv2d_transpose/ReadVariableOpconv2d_transpose/ReadVariableOp:i e
A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€@
 
_user_specified_nameinputs
ЎP
ы
D__inference_generator_layer_call_and_return_conditional_losses_20696

inputs
inputs_1
dense_20628:	~А1
dense_20630:	А1+
batch_normalization_94_20634:	А+
batch_normalization_94_20636:	А+
batch_normalization_94_20638:	А+
batch_normalization_94_20640:	А2
conv2d_transpose_20644:АА%
conv2d_transpose_20646:	А+
batch_normalization_95_20649:	А+
batch_normalization_95_20651:	А+
batch_normalization_95_20653:	А+
batch_normalization_95_20655:	А3
conv2d_transpose_1_20659:@А&
conv2d_transpose_1_20661:@*
batch_normalization_96_20664:@*
batch_normalization_96_20666:@*
batch_normalization_96_20668:@*
batch_normalization_96_20670:@2
conv2d_transpose_2_20674: @&
conv2d_transpose_2_20676: *
batch_normalization_97_20679: *
batch_normalization_97_20681: *
batch_normalization_97_20683: *
batch_normalization_97_20685: 2
conv2d_transpose_3_20689: &
conv2d_transpose_3_20691:
identityИҐ.batch_normalization_94/StatefulPartitionedCallҐ.batch_normalization_95/StatefulPartitionedCallҐ.batch_normalization_96/StatefulPartitionedCallҐ.batch_normalization_97/StatefulPartitionedCallҐ(conv2d_transpose/StatefulPartitionedCallҐ*conv2d_transpose_1/StatefulPartitionedCallҐ*conv2d_transpose_2/StatefulPartitionedCallҐ*conv2d_transpose_3/StatefulPartitionedCallҐdense/StatefulPartitionedCallћ
concatenate_2/PartitionedCallPartitionedCallinputsinputs_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€~* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_concatenate_2_layer_call_and_return_conditional_losses_20328В
dense/StatefulPartitionedCallStatefulPartitionedCall&concatenate_2/PartitionedCall:output:0dense_20628dense_20630*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:€€€€€€€€€А1*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *I
fDRB
@__inference_dense_layer_call_and_return_conditional_losses_20340ё
reshape/PartitionedCallPartitionedCall&dense/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *K
fFRD
B__inference_reshape_layer_call_and_return_conditional_losses_20360Ж
.batch_normalization_94/StatefulPartitionedCallStatefulPartitionedCall reshape/PartitionedCall:output:0batch_normalization_94_20634batch_normalization_94_20636batch_normalization_94_20638batch_normalization_94_20640*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *Z
fURS
Q__inference_batch_normalization_94_layer_call_and_return_conditional_losses_19933ы
activation_94/PartitionedCallPartitionedCall7batch_normalization_94/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_activation_94_layer_call_and_return_conditional_losses_20376ґ
(conv2d_transpose/StatefulPartitionedCallStatefulPartitionedCall&activation_94/PartitionedCall:output:0conv2d_transpose_20644conv2d_transpose_20646*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *T
fORM
K__inference_conv2d_transpose_layer_call_and_return_conditional_losses_19981Ч
.batch_normalization_95/StatefulPartitionedCallStatefulPartitionedCall1conv2d_transpose/StatefulPartitionedCall:output:0batch_normalization_95_20649batch_normalization_95_20651batch_normalization_95_20653batch_normalization_95_20655*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *Z
fURS
Q__inference_batch_normalization_95_layer_call_and_return_conditional_losses_20041ы
activation_95/PartitionedCallPartitionedCall7batch_normalization_95/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_activation_95_layer_call_and_return_conditional_losses_20397љ
*conv2d_transpose_1/StatefulPartitionedCallStatefulPartitionedCall&activation_95/PartitionedCall:output:0conv2d_transpose_1_20659conv2d_transpose_1_20661*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *V
fQRO
M__inference_conv2d_transpose_1_layer_call_and_return_conditional_losses_20089Ш
.batch_normalization_96/StatefulPartitionedCallStatefulPartitionedCall3conv2d_transpose_1/StatefulPartitionedCall:output:0batch_normalization_96_20664batch_normalization_96_20666batch_normalization_96_20668batch_normalization_96_20670*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *Z
fURS
Q__inference_batch_normalization_96_layer_call_and_return_conditional_losses_20149ъ
activation_96/PartitionedCallPartitionedCall7batch_normalization_96/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_activation_96_layer_call_and_return_conditional_losses_20418љ
*conv2d_transpose_2/StatefulPartitionedCallStatefulPartitionedCall&activation_96/PartitionedCall:output:0conv2d_transpose_2_20674conv2d_transpose_2_20676*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€ *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *V
fQRO
M__inference_conv2d_transpose_2_layer_call_and_return_conditional_losses_20197Ш
.batch_normalization_97/StatefulPartitionedCallStatefulPartitionedCall3conv2d_transpose_2/StatefulPartitionedCall:output:0batch_normalization_97_20679batch_normalization_97_20681batch_normalization_97_20683batch_normalization_97_20685*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€ *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *Z
fURS
Q__inference_batch_normalization_97_layer_call_and_return_conditional_losses_20257ъ
activation_97/PartitionedCallPartitionedCall7batch_normalization_97/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€ * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_activation_97_layer_call_and_return_conditional_losses_20439љ
*conv2d_transpose_3/StatefulPartitionedCallStatefulPartitionedCall&activation_97/PartitionedCall:output:0conv2d_transpose_3_20689conv2d_transpose_3_20691*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *V
fQRO
M__inference_conv2d_transpose_3_layer_call_and_return_conditional_losses_20305ц
activation_98/PartitionedCallPartitionedCall3conv2d_transpose_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_activation_98_layer_call_and_return_conditional_losses_20451}
IdentityIdentity&activation_98/PartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:€€€€€€€€€№
NoOpNoOp/^batch_normalization_94/StatefulPartitionedCall/^batch_normalization_95/StatefulPartitionedCall/^batch_normalization_96/StatefulPartitionedCall/^batch_normalization_97/StatefulPartitionedCall)^conv2d_transpose/StatefulPartitionedCall+^conv2d_transpose_1/StatefulPartitionedCall+^conv2d_transpose_2/StatefulPartitionedCall+^conv2d_transpose_3/StatefulPartitionedCall^dense/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*m
_input_shapes\
Z:€€€€€€€€€d:€€€€€€€€€: : : : : : : : : : : : : : : : : : : : : : : : : : 2`
.batch_normalization_94/StatefulPartitionedCall.batch_normalization_94/StatefulPartitionedCall2`
.batch_normalization_95/StatefulPartitionedCall.batch_normalization_95/StatefulPartitionedCall2`
.batch_normalization_96/StatefulPartitionedCall.batch_normalization_96/StatefulPartitionedCall2`
.batch_normalization_97/StatefulPartitionedCall.batch_normalization_97/StatefulPartitionedCall2T
(conv2d_transpose/StatefulPartitionedCall(conv2d_transpose/StatefulPartitionedCall2X
*conv2d_transpose_1/StatefulPartitionedCall*conv2d_transpose_1/StatefulPartitionedCall2X
*conv2d_transpose_2/StatefulPartitionedCall*conv2d_transpose_2/StatefulPartitionedCall2X
*conv2d_transpose_3/StatefulPartitionedCall*conv2d_transpose_3/StatefulPartitionedCall2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall:O K
'
_output_shapes
:€€€€€€€€€d
 
_user_specified_nameinputs:OK
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
’ 
Ъ
M__inference_conv2d_transpose_2_layer_call_and_return_conditional_losses_21844

inputsB
(conv2d_transpose_readvariableop_resource: @-
biasadd_readvariableop_resource: 
identityИҐBiasAdd/ReadVariableOpҐconv2d_transpose/ReadVariableOp;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:—
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ў
strided_slice_1StridedSliceShape:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ў
strided_slice_2StridedSliceShape:output:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskG
mul/yConst*
_output_shapes
: *
dtype0*
value	B :U
mulMulstrided_slice_1:output:0mul/y:output:0*
T0*
_output_shapes
: I
mul_1/yConst*
_output_shapes
: *
dtype0*
value	B :Y
mul_1Mulstrided_slice_2:output:0mul_1/y:output:0*
T0*
_output_shapes
: I
stack/3Const*
_output_shapes
: *
dtype0*
value	B : y
stackPackstrided_slice:output:0mul:z:0	mul_1:z:0stack/3:output:0*
N*
T0*
_output_shapes
:_
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ў
strided_slice_3StridedSlicestack:output:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskР
conv2d_transpose/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
: @*
dtype0№
conv2d_transposeConv2DBackpropInputstack:output:0'conv2d_transpose/ReadVariableOp:value:0inputs*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€ *
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype0Щ
BiasAddBiasAddconv2d_transpose:output:0BiasAdd/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€ y
IdentityIdentityBiasAdd:output:0^NoOp*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€ Б
NoOpNoOp^BiasAdd/ReadVariableOp ^conv2d_transpose/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+€€€€€€€€€€€€€€€€€€€€€€€€€€€@: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2B
conv2d_transpose/ReadVariableOpconv2d_transpose/ReadVariableOp:i e
A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€@
 
_user_specified_nameinputs
≈
I
-__inference_activation_98_layer_call_fn_21963

inputs
identityї
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_activation_98_layer_call_and_return_conditional_losses_20451h
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:€€€€€€€€€"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:€€€€€€€€€:W S
/
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
вP
ы
D__inference_generator_layer_call_and_return_conditional_losses_20882
input_2
input_3
dense_20814:	~А1
dense_20816:	А1+
batch_normalization_94_20820:	А+
batch_normalization_94_20822:	А+
batch_normalization_94_20824:	А+
batch_normalization_94_20826:	А2
conv2d_transpose_20830:АА%
conv2d_transpose_20832:	А+
batch_normalization_95_20835:	А+
batch_normalization_95_20837:	А+
batch_normalization_95_20839:	А+
batch_normalization_95_20841:	А3
conv2d_transpose_1_20845:@А&
conv2d_transpose_1_20847:@*
batch_normalization_96_20850:@*
batch_normalization_96_20852:@*
batch_normalization_96_20854:@*
batch_normalization_96_20856:@2
conv2d_transpose_2_20860: @&
conv2d_transpose_2_20862: *
batch_normalization_97_20865: *
batch_normalization_97_20867: *
batch_normalization_97_20869: *
batch_normalization_97_20871: 2
conv2d_transpose_3_20875: &
conv2d_transpose_3_20877:
identityИҐ.batch_normalization_94/StatefulPartitionedCallҐ.batch_normalization_95/StatefulPartitionedCallҐ.batch_normalization_96/StatefulPartitionedCallҐ.batch_normalization_97/StatefulPartitionedCallҐ(conv2d_transpose/StatefulPartitionedCallҐ*conv2d_transpose_1/StatefulPartitionedCallҐ*conv2d_transpose_2/StatefulPartitionedCallҐ*conv2d_transpose_3/StatefulPartitionedCallҐdense/StatefulPartitionedCallћ
concatenate_2/PartitionedCallPartitionedCallinput_2input_3*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€~* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_concatenate_2_layer_call_and_return_conditional_losses_20328В
dense/StatefulPartitionedCallStatefulPartitionedCall&concatenate_2/PartitionedCall:output:0dense_20814dense_20816*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:€€€€€€€€€А1*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *I
fDRB
@__inference_dense_layer_call_and_return_conditional_losses_20340ё
reshape/PartitionedCallPartitionedCall&dense/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *K
fFRD
B__inference_reshape_layer_call_and_return_conditional_losses_20360И
.batch_normalization_94/StatefulPartitionedCallStatefulPartitionedCall reshape/PartitionedCall:output:0batch_normalization_94_20820batch_normalization_94_20822batch_normalization_94_20824batch_normalization_94_20826*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *Z
fURS
Q__inference_batch_normalization_94_layer_call_and_return_conditional_losses_19902ы
activation_94/PartitionedCallPartitionedCall7batch_normalization_94/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_activation_94_layer_call_and_return_conditional_losses_20376ґ
(conv2d_transpose/StatefulPartitionedCallStatefulPartitionedCall&activation_94/PartitionedCall:output:0conv2d_transpose_20830conv2d_transpose_20832*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *T
fORM
K__inference_conv2d_transpose_layer_call_and_return_conditional_losses_19981Щ
.batch_normalization_95/StatefulPartitionedCallStatefulPartitionedCall1conv2d_transpose/StatefulPartitionedCall:output:0batch_normalization_95_20835batch_normalization_95_20837batch_normalization_95_20839batch_normalization_95_20841*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *Z
fURS
Q__inference_batch_normalization_95_layer_call_and_return_conditional_losses_20010ы
activation_95/PartitionedCallPartitionedCall7batch_normalization_95/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_activation_95_layer_call_and_return_conditional_losses_20397љ
*conv2d_transpose_1/StatefulPartitionedCallStatefulPartitionedCall&activation_95/PartitionedCall:output:0conv2d_transpose_1_20845conv2d_transpose_1_20847*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *V
fQRO
M__inference_conv2d_transpose_1_layer_call_and_return_conditional_losses_20089Ъ
.batch_normalization_96/StatefulPartitionedCallStatefulPartitionedCall3conv2d_transpose_1/StatefulPartitionedCall:output:0batch_normalization_96_20850batch_normalization_96_20852batch_normalization_96_20854batch_normalization_96_20856*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€@*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *Z
fURS
Q__inference_batch_normalization_96_layer_call_and_return_conditional_losses_20118ъ
activation_96/PartitionedCallPartitionedCall7batch_normalization_96/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_activation_96_layer_call_and_return_conditional_losses_20418љ
*conv2d_transpose_2/StatefulPartitionedCallStatefulPartitionedCall&activation_96/PartitionedCall:output:0conv2d_transpose_2_20860conv2d_transpose_2_20862*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€ *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *V
fQRO
M__inference_conv2d_transpose_2_layer_call_and_return_conditional_losses_20197Ъ
.batch_normalization_97/StatefulPartitionedCallStatefulPartitionedCall3conv2d_transpose_2/StatefulPartitionedCall:output:0batch_normalization_97_20865batch_normalization_97_20867batch_normalization_97_20869batch_normalization_97_20871*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€ *&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *Z
fURS
Q__inference_batch_normalization_97_layer_call_and_return_conditional_losses_20226ъ
activation_97/PartitionedCallPartitionedCall7batch_normalization_97/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€ * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_activation_97_layer_call_and_return_conditional_losses_20439љ
*conv2d_transpose_3/StatefulPartitionedCallStatefulPartitionedCall&activation_97/PartitionedCall:output:0conv2d_transpose_3_20875conv2d_transpose_3_20877*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *V
fQRO
M__inference_conv2d_transpose_3_layer_call_and_return_conditional_losses_20305ц
activation_98/PartitionedCallPartitionedCall3conv2d_transpose_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_activation_98_layer_call_and_return_conditional_losses_20451}
IdentityIdentity&activation_98/PartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:€€€€€€€€€№
NoOpNoOp/^batch_normalization_94/StatefulPartitionedCall/^batch_normalization_95/StatefulPartitionedCall/^batch_normalization_96/StatefulPartitionedCall/^batch_normalization_97/StatefulPartitionedCall)^conv2d_transpose/StatefulPartitionedCall+^conv2d_transpose_1/StatefulPartitionedCall+^conv2d_transpose_2/StatefulPartitionedCall+^conv2d_transpose_3/StatefulPartitionedCall^dense/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*m
_input_shapes\
Z:€€€€€€€€€d:€€€€€€€€€: : : : : : : : : : : : : : : : : : : : : : : : : : 2`
.batch_normalization_94/StatefulPartitionedCall.batch_normalization_94/StatefulPartitionedCall2`
.batch_normalization_95/StatefulPartitionedCall.batch_normalization_95/StatefulPartitionedCall2`
.batch_normalization_96/StatefulPartitionedCall.batch_normalization_96/StatefulPartitionedCall2`
.batch_normalization_97/StatefulPartitionedCall.batch_normalization_97/StatefulPartitionedCall2T
(conv2d_transpose/StatefulPartitionedCall(conv2d_transpose/StatefulPartitionedCall2X
*conv2d_transpose_1/StatefulPartitionedCall*conv2d_transpose_1/StatefulPartitionedCall2X
*conv2d_transpose_2/StatefulPartitionedCall*conv2d_transpose_2/StatefulPartitionedCall2X
*conv2d_transpose_3/StatefulPartitionedCall*conv2d_transpose_3/StatefulPartitionedCall2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall:P L
'
_output_shapes
:€€€€€€€€€d
!
_user_specified_name	input_2:PL
'
_output_shapes
:€€€€€€€€€
!
_user_specified_name	input_3
ў 
Ы
M__inference_conv2d_transpose_1_layer_call_and_return_conditional_losses_20089

inputsC
(conv2d_transpose_readvariableop_resource:@А-
biasadd_readvariableop_resource:@
identityИҐBiasAdd/ReadVariableOpҐconv2d_transpose/ReadVariableOp;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:—
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ў
strided_slice_1StridedSliceShape:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ў
strided_slice_2StridedSliceShape:output:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskG
mul/yConst*
_output_shapes
: *
dtype0*
value	B :U
mulMulstrided_slice_1:output:0mul/y:output:0*
T0*
_output_shapes
: I
mul_1/yConst*
_output_shapes
: *
dtype0*
value	B :Y
mul_1Mulstrided_slice_2:output:0mul_1/y:output:0*
T0*
_output_shapes
: I
stack/3Const*
_output_shapes
: *
dtype0*
value	B :@y
stackPackstrided_slice:output:0mul:z:0	mul_1:z:0stack/3:output:0*
N*
T0*
_output_shapes
:_
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ў
strided_slice_3StridedSlicestack:output:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskС
conv2d_transpose/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*'
_output_shapes
:@А*
dtype0№
conv2d_transposeConv2DBackpropInputstack:output:0'conv2d_transpose/ReadVariableOp:value:0inputs*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€@*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0Щ
BiasAddBiasAddconv2d_transpose:output:0BiasAdd/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€@y
IdentityIdentityBiasAdd:output:0^NoOp*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€@Б
NoOpNoOp^BiasAdd/ReadVariableOp ^conv2d_transpose/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*E
_input_shapes4
2:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2B
conv2d_transpose/ReadVariableOpconv2d_transpose/ReadVariableOp:j f
B
_output_shapes0
.:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А
 
_user_specified_nameinputs
Ц
ƒ
Q__inference_batch_normalization_94_layer_call_and_return_conditional_losses_21564

inputs&
readvariableop_resource:	А(
readvariableop_1_resource:	А7
(fusedbatchnormv3_readvariableop_resource:	А9
*fusedbatchnormv3_readvariableop_1_resource:	А
identityИҐAssignNewValueҐAssignNewValue_1ҐFusedBatchNormV3/ReadVariableOpҐ!FusedBatchNormV3/ReadVariableOp_1ҐReadVariableOpҐReadVariableOp_1c
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:А*
dtype0g
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes	
:А*
dtype0Е
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:А*
dtype0Й
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:А*
dtype0џ
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А:А:А:А:А:*
epsilon%oГ:*
exponential_avg_factor%
„#<∆
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0*
validate_shape(–
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0*
validate_shape(~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А‘
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:j f
B
_output_shapes0
.:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А
 
_user_specified_nameinputs
Ж
ј
Q__inference_batch_normalization_96_layer_call_and_return_conditional_losses_21792

inputs%
readvariableop_resource:@'
readvariableop_1_resource:@6
(fusedbatchnormv3_readvariableop_resource:@8
*fusedbatchnormv3_readvariableop_1_resource:@
identityИҐAssignNewValueҐAssignNewValue_1ҐFusedBatchNormV3/ReadVariableOpҐ!FusedBatchNormV3/ReadVariableOp_1ҐReadVariableOpҐReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:@*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:@*
dtype0Д
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:@*
dtype0И
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:@*
dtype0÷
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+€€€€€€€€€€€€€€€€€€€€€€€€€€€@:@:@:@:@:*
epsilon%oГ:*
exponential_avg_factor%
„#<∆
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0*
validate_shape(–
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0*
validate_shape(}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€@‘
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+€€€€€€€€€€€€€€€€€€€€€€€€€€€@: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€@
 
_user_specified_nameinputs
ћ
Ь
Q__inference_batch_normalization_96_layer_call_and_return_conditional_losses_21774

inputs%
readvariableop_resource:@'
readvariableop_1_resource:@6
(fusedbatchnormv3_readvariableop_resource:@8
*fusedbatchnormv3_readvariableop_1_resource:@
identityИҐFusedBatchNormV3/ReadVariableOpҐ!FusedBatchNormV3/ReadVariableOp_1ҐReadVariableOpҐReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:@*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:@*
dtype0Д
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:@*
dtype0И
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:@*
dtype0»
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+€€€€€€€€€€€€€€€€€€€€€€€€€€€@:@:@:@:@:*
epsilon%oГ:*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€@∞
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+€€€€€€€€€€€€€€€€€€€€€€€€€€€@: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€@
 
_user_specified_nameinputs
р
d
H__inference_activation_94_layer_call_and_return_conditional_losses_21574

inputs
identityO
ReluReluinputs*
T0*0
_output_shapes
:€€€€€€€€€Аc
IdentityIdentityRelu:activations:0*
T0*0
_output_shapes
:€€€€€€€€€А"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:€€€€€€€€€А:X T
0
_output_shapes
:€€€€€€€€€А
 
_user_specified_nameinputs
Ц
ƒ
Q__inference_batch_normalization_94_layer_call_and_return_conditional_losses_19933

inputs&
readvariableop_resource:	А(
readvariableop_1_resource:	А7
(fusedbatchnormv3_readvariableop_resource:	А9
*fusedbatchnormv3_readvariableop_1_resource:	А
identityИҐAssignNewValueҐAssignNewValue_1ҐFusedBatchNormV3/ReadVariableOpҐ!FusedBatchNormV3/ReadVariableOp_1ҐReadVariableOpҐReadVariableOp_1c
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:А*
dtype0g
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes	
:А*
dtype0Е
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:А*
dtype0Й
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:А*
dtype0џ
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А:А:А:А:А:*
epsilon%oГ:*
exponential_avg_factor%
„#<∆
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0*
validate_shape(–
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0*
validate_shape(~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А‘
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:j f
B
_output_shapes0
.:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А
 
_user_specified_nameinputs
№
†
Q__inference_batch_normalization_95_layer_call_and_return_conditional_losses_20010

inputs&
readvariableop_resource:	А(
readvariableop_1_resource:	А7
(fusedbatchnormv3_readvariableop_resource:	А9
*fusedbatchnormv3_readvariableop_1_resource:	А
identityИҐFusedBatchNormV3/ReadVariableOpҐ!FusedBatchNormV3/ReadVariableOp_1ҐReadVariableOpҐReadVariableOp_1c
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:А*
dtype0g
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes	
:А*
dtype0Е
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:А*
dtype0Й
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:А*
dtype0Ќ
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А:А:А:А:А:*
epsilon%oГ:*
is_training( ~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А∞
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:j f
B
_output_shapes0
.:,€€€€€€€€€€€€€€€€€€€€€€€€€€€А
 
_user_specified_nameinputs
’ 
Ъ
M__inference_conv2d_transpose_3_layer_call_and_return_conditional_losses_20305

inputsB
(conv2d_transpose_readvariableop_resource: -
biasadd_readvariableop_resource:
identityИҐBiasAdd/ReadVariableOpҐconv2d_transpose/ReadVariableOp;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:—
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ў
strided_slice_1StridedSliceShape:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ў
strided_slice_2StridedSliceShape:output:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskG
mul/yConst*
_output_shapes
: *
dtype0*
value	B :U
mulMulstrided_slice_1:output:0mul/y:output:0*
T0*
_output_shapes
: I
mul_1/yConst*
_output_shapes
: *
dtype0*
value	B :Y
mul_1Mulstrided_slice_2:output:0mul_1/y:output:0*
T0*
_output_shapes
: I
stack/3Const*
_output_shapes
: *
dtype0*
value	B :y
stackPackstrided_slice:output:0mul:z:0	mul_1:z:0stack/3:output:0*
N*
T0*
_output_shapes
:_
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ў
strided_slice_3StridedSlicestack:output:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskР
conv2d_transpose/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
: *
dtype0№
conv2d_transposeConv2DBackpropInputstack:output:0'conv2d_transpose/ReadVariableOp:value:0inputs*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0Щ
BiasAddBiasAddconv2d_transpose:output:0BiasAdd/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€y
IdentityIdentityBiasAdd:output:0^NoOp*
T0*A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€Б
NoOpNoOp^BiasAdd/ReadVariableOp ^conv2d_transpose/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+€€€€€€€€€€€€€€€€€€€€€€€€€€€ : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2B
conv2d_transpose/ReadVariableOpconv2d_transpose/ReadVariableOp:i e
A
_output_shapes/
-:+€€€€€€€€€€€€€€€€€€€€€€€€€€€ 
 
_user_specified_nameinputs
в
d
H__inference_activation_98_layer_call_and_return_conditional_losses_20451

inputs
identityN
TanhTanhinputs*
T0*/
_output_shapes
:€€€€€€€€€X
IdentityIdentityTanh:y:0*
T0*/
_output_shapes
:€€€€€€€€€"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:€€€€€€€€€:W S
/
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
™
Y
-__inference_concatenate_2_layer_call_fn_21457
inputs_0
inputs_1
identityј
PartitionedCallPartitionedCallinputs_0inputs_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€~* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_concatenate_2_layer_call_and_return_conditional_losses_20328`
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:€€€€€€€€€~"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:€€€€€€€€€d:€€€€€€€€€:Q M
'
_output_shapes
:€€€€€€€€€d
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:€€€€€€€€€
"
_user_specified_name
inputs/1"µ	L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*х
serving_defaultб
;
input_20
serving_default_input_2:0€€€€€€€€€d
;
input_30
serving_default_input_3:0€€€€€€€€€I
activation_988
StatefulPartitionedCall:0€€€€€€€€€tensorflow/serving/predict:ъИ
∞
layer-0
layer-1
layer-2
layer_with_weights-0
layer-3
layer-4
layer_with_weights-1
layer-5
layer-6
layer_with_weights-2
layer-7
	layer_with_weights-3
	layer-8

layer-9
layer_with_weights-4
layer-10
layer_with_weights-5
layer-11
layer-12
layer_with_weights-6
layer-13
layer_with_weights-7
layer-14
layer-15
layer_with_weights-8
layer-16
layer-17
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
_default_save_signature

signatures"
_tf_keras_network
"
_tf_keras_input_layer
"
_tf_keras_input_layer
•
	variables
trainable_variables
regularization_losses
	keras_api
__call__
* &call_and_return_all_conditional_losses"
_tf_keras_layer
ї
!	variables
"trainable_variables
#regularization_losses
$	keras_api
%__call__
*&&call_and_return_all_conditional_losses

'kernel
(bias"
_tf_keras_layer
•
)	variables
*trainable_variables
+regularization_losses
,	keras_api
-__call__
*.&call_and_return_all_conditional_losses"
_tf_keras_layer
к
/	variables
0trainable_variables
1regularization_losses
2	keras_api
3__call__
*4&call_and_return_all_conditional_losses
5axis
	6gamma
7beta
8moving_mean
9moving_variance"
_tf_keras_layer
•
:	variables
;trainable_variables
<regularization_losses
=	keras_api
>__call__
*?&call_and_return_all_conditional_losses"
_tf_keras_layer
Ё
@	variables
Atrainable_variables
Bregularization_losses
C	keras_api
D__call__
*E&call_and_return_all_conditional_losses

Fkernel
Gbias
 H_jit_compiled_convolution_op"
_tf_keras_layer
к
I	variables
Jtrainable_variables
Kregularization_losses
L	keras_api
M__call__
*N&call_and_return_all_conditional_losses
Oaxis
	Pgamma
Qbeta
Rmoving_mean
Smoving_variance"
_tf_keras_layer
•
T	variables
Utrainable_variables
Vregularization_losses
W	keras_api
X__call__
*Y&call_and_return_all_conditional_losses"
_tf_keras_layer
Ё
Z	variables
[trainable_variables
\regularization_losses
]	keras_api
^__call__
*_&call_and_return_all_conditional_losses

`kernel
abias
 b_jit_compiled_convolution_op"
_tf_keras_layer
к
c	variables
dtrainable_variables
eregularization_losses
f	keras_api
g__call__
*h&call_and_return_all_conditional_losses
iaxis
	jgamma
kbeta
lmoving_mean
mmoving_variance"
_tf_keras_layer
•
n	variables
otrainable_variables
pregularization_losses
q	keras_api
r__call__
*s&call_and_return_all_conditional_losses"
_tf_keras_layer
Ё
t	variables
utrainable_variables
vregularization_losses
w	keras_api
x__call__
*y&call_and_return_all_conditional_losses

zkernel
{bias
 |_jit_compiled_convolution_op"
_tf_keras_layer
т
}	variables
~trainable_variables
regularization_losses
А	keras_api
Б__call__
+В&call_and_return_all_conditional_losses
	Гaxis

Дgamma
	Еbeta
Жmoving_mean
Зmoving_variance"
_tf_keras_layer
Ђ
И	variables
Йtrainable_variables
Кregularization_losses
Л	keras_api
М__call__
+Н&call_and_return_all_conditional_losses"
_tf_keras_layer
ж
О	variables
Пtrainable_variables
Рregularization_losses
С	keras_api
Т__call__
+У&call_and_return_all_conditional_losses
Фkernel
	Хbias
!Ц_jit_compiled_convolution_op"
_tf_keras_layer
Ђ
Ч	variables
Шtrainable_variables
Щregularization_losses
Ъ	keras_api
Ы__call__
+Ь&call_and_return_all_conditional_losses"
_tf_keras_layer
м
'0
(1
62
73
84
95
F6
G7
P8
Q9
R10
S11
`12
a13
j14
k15
l16
m17
z18
{19
Д20
Е21
Ж22
З23
Ф24
Х25"
trackable_list_wrapper
™
'0
(1
62
73
F4
G5
P6
Q7
`8
a9
j10
k11
z12
{13
Д14
Е15
Ф16
Х17"
trackable_list_wrapper
 "
trackable_list_wrapper
ѕ
Эnon_trainable_variables
Юlayers
Яmetrics
 †layer_regularization_losses
°layer_metrics
	variables
trainable_variables
regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
б
Ґtrace_0
£trace_1
§trace_2
•trace_32о
)__inference_generator_layer_call_fn_20509
)__inference_generator_layer_call_fn_21073
)__inference_generator_layer_call_fn_21131
)__inference_generator_layer_call_fn_20809њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zҐtrace_0z£trace_1z§trace_2z•trace_3
Ќ
¶trace_0
Іtrace_1
®trace_2
©trace_32Џ
D__inference_generator_layer_call_and_return_conditional_losses_21291
D__inference_generator_layer_call_and_return_conditional_losses_21451
D__inference_generator_layer_call_and_return_conditional_losses_20882
D__inference_generator_layer_call_and_return_conditional_losses_20955њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 z¶trace_0zІtrace_1z®trace_2z©trace_3
‘B—
 __inference__wrapped_model_19880input_2input_3"Ш
С≤Н
FullArgSpec
argsЪ 
varargsjargs
varkwjkwargs
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
-
™serving_default"
signature_map
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
≤
Ђnon_trainable_variables
ђlayers
≠metrics
 Ѓlayer_regularization_losses
ѓlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
* &call_and_return_all_conditional_losses
& "call_and_return_conditional_losses"
_generic_user_object
у
∞trace_02‘
-__inference_concatenate_2_layer_call_fn_21457Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 z∞trace_0
О
±trace_02п
H__inference_concatenate_2_layer_call_and_return_conditional_losses_21464Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 z±trace_0
.
'0
(1"
trackable_list_wrapper
.
'0
(1"
trackable_list_wrapper
 "
trackable_list_wrapper
≤
≤non_trainable_variables
≥layers
іmetrics
 µlayer_regularization_losses
ґlayer_metrics
!	variables
"trainable_variables
#regularization_losses
%__call__
*&&call_and_return_all_conditional_losses
&&"call_and_return_conditional_losses"
_generic_user_object
л
Јtrace_02ћ
%__inference_dense_layer_call_fn_21473Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zЈtrace_0
Ж
Єtrace_02з
@__inference_dense_layer_call_and_return_conditional_losses_21483Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zЄtrace_0
:	~А12dense/kernel
:А12
dense/bias
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
≤
єnon_trainable_variables
Їlayers
їmetrics
 Љlayer_regularization_losses
љlayer_metrics
)	variables
*trainable_variables
+regularization_losses
-__call__
*.&call_and_return_all_conditional_losses
&."call_and_return_conditional_losses"
_generic_user_object
н
Њtrace_02ќ
'__inference_reshape_layer_call_fn_21488Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zЊtrace_0
И
њtrace_02й
B__inference_reshape_layer_call_and_return_conditional_losses_21502Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zњtrace_0
<
60
71
82
93"
trackable_list_wrapper
.
60
71"
trackable_list_wrapper
 "
trackable_list_wrapper
≤
јnon_trainable_variables
Ѕlayers
¬metrics
 √layer_regularization_losses
ƒlayer_metrics
/	variables
0trainable_variables
1regularization_losses
3__call__
*4&call_and_return_all_conditional_losses
&4"call_and_return_conditional_losses"
_generic_user_object
б
≈trace_0
∆trace_12¶
6__inference_batch_normalization_94_layer_call_fn_21515
6__inference_batch_normalization_94_layer_call_fn_21528≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 z≈trace_0z∆trace_1
Ч
«trace_0
»trace_12№
Q__inference_batch_normalization_94_layer_call_and_return_conditional_losses_21546
Q__inference_batch_normalization_94_layer_call_and_return_conditional_losses_21564≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 z«trace_0z»trace_1
 "
trackable_list_wrapper
+:)А2batch_normalization_94/gamma
*:(А2batch_normalization_94/beta
3:1А (2"batch_normalization_94/moving_mean
7:5А (2&batch_normalization_94/moving_variance
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
≤
…non_trainable_variables
 layers
Ћmetrics
 ћlayer_regularization_losses
Ќlayer_metrics
:	variables
;trainable_variables
<regularization_losses
>__call__
*?&call_and_return_all_conditional_losses
&?"call_and_return_conditional_losses"
_generic_user_object
у
ќtrace_02‘
-__inference_activation_94_layer_call_fn_21569Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zќtrace_0
О
ѕtrace_02п
H__inference_activation_94_layer_call_and_return_conditional_losses_21574Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zѕtrace_0
.
F0
G1"
trackable_list_wrapper
.
F0
G1"
trackable_list_wrapper
 "
trackable_list_wrapper
≤
–non_trainable_variables
—layers
“metrics
 ”layer_regularization_losses
‘layer_metrics
@	variables
Atrainable_variables
Bregularization_losses
D__call__
*E&call_and_return_all_conditional_losses
&E"call_and_return_conditional_losses"
_generic_user_object
ц
’trace_02„
0__inference_conv2d_transpose_layer_call_fn_21583Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 z’trace_0
С
÷trace_02т
K__inference_conv2d_transpose_layer_call_and_return_conditional_losses_21616Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 z÷trace_0
3:1АА2conv2d_transpose/kernel
$:"А2conv2d_transpose/bias
і2±Ѓ
£≤Я
FullArgSpec'
argsЪ
jself
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 0
<
P0
Q1
R2
S3"
trackable_list_wrapper
.
P0
Q1"
trackable_list_wrapper
 "
trackable_list_wrapper
≤
„non_trainable_variables
Ўlayers
ўmetrics
 Џlayer_regularization_losses
џlayer_metrics
I	variables
Jtrainable_variables
Kregularization_losses
M__call__
*N&call_and_return_all_conditional_losses
&N"call_and_return_conditional_losses"
_generic_user_object
б
№trace_0
Ёtrace_12¶
6__inference_batch_normalization_95_layer_call_fn_21629
6__inference_batch_normalization_95_layer_call_fn_21642≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 z№trace_0zЁtrace_1
Ч
ёtrace_0
яtrace_12№
Q__inference_batch_normalization_95_layer_call_and_return_conditional_losses_21660
Q__inference_batch_normalization_95_layer_call_and_return_conditional_losses_21678≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zёtrace_0zяtrace_1
 "
trackable_list_wrapper
+:)А2batch_normalization_95/gamma
*:(А2batch_normalization_95/beta
3:1А (2"batch_normalization_95/moving_mean
7:5А (2&batch_normalization_95/moving_variance
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
≤
аnon_trainable_variables
бlayers
вmetrics
 гlayer_regularization_losses
дlayer_metrics
T	variables
Utrainable_variables
Vregularization_losses
X__call__
*Y&call_and_return_all_conditional_losses
&Y"call_and_return_conditional_losses"
_generic_user_object
у
еtrace_02‘
-__inference_activation_95_layer_call_fn_21683Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zеtrace_0
О
жtrace_02п
H__inference_activation_95_layer_call_and_return_conditional_losses_21688Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zжtrace_0
.
`0
a1"
trackable_list_wrapper
.
`0
a1"
trackable_list_wrapper
 "
trackable_list_wrapper
≤
зnon_trainable_variables
иlayers
йmetrics
 кlayer_regularization_losses
лlayer_metrics
Z	variables
[trainable_variables
\regularization_losses
^__call__
*_&call_and_return_all_conditional_losses
&_"call_and_return_conditional_losses"
_generic_user_object
ш
мtrace_02ў
2__inference_conv2d_transpose_1_layer_call_fn_21697Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zмtrace_0
У
нtrace_02ф
M__inference_conv2d_transpose_1_layer_call_and_return_conditional_losses_21730Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zнtrace_0
4:2@А2conv2d_transpose_1/kernel
%:#@2conv2d_transpose_1/bias
і2±Ѓ
£≤Я
FullArgSpec'
argsЪ
jself
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 0
<
j0
k1
l2
m3"
trackable_list_wrapper
.
j0
k1"
trackable_list_wrapper
 "
trackable_list_wrapper
≤
оnon_trainable_variables
пlayers
рmetrics
 сlayer_regularization_losses
тlayer_metrics
c	variables
dtrainable_variables
eregularization_losses
g__call__
*h&call_and_return_all_conditional_losses
&h"call_and_return_conditional_losses"
_generic_user_object
б
уtrace_0
фtrace_12¶
6__inference_batch_normalization_96_layer_call_fn_21743
6__inference_batch_normalization_96_layer_call_fn_21756≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zуtrace_0zфtrace_1
Ч
хtrace_0
цtrace_12№
Q__inference_batch_normalization_96_layer_call_and_return_conditional_losses_21774
Q__inference_batch_normalization_96_layer_call_and_return_conditional_losses_21792≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zхtrace_0zцtrace_1
 "
trackable_list_wrapper
*:(@2batch_normalization_96/gamma
):'@2batch_normalization_96/beta
2:0@ (2"batch_normalization_96/moving_mean
6:4@ (2&batch_normalization_96/moving_variance
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
≤
чnon_trainable_variables
шlayers
щmetrics
 ъlayer_regularization_losses
ыlayer_metrics
n	variables
otrainable_variables
pregularization_losses
r__call__
*s&call_and_return_all_conditional_losses
&s"call_and_return_conditional_losses"
_generic_user_object
у
ьtrace_02‘
-__inference_activation_96_layer_call_fn_21797Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zьtrace_0
О
эtrace_02п
H__inference_activation_96_layer_call_and_return_conditional_losses_21802Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zэtrace_0
.
z0
{1"
trackable_list_wrapper
.
z0
{1"
trackable_list_wrapper
 "
trackable_list_wrapper
≤
юnon_trainable_variables
€layers
Аmetrics
 Бlayer_regularization_losses
Вlayer_metrics
t	variables
utrainable_variables
vregularization_losses
x__call__
*y&call_and_return_all_conditional_losses
&y"call_and_return_conditional_losses"
_generic_user_object
ш
Гtrace_02ў
2__inference_conv2d_transpose_2_layer_call_fn_21811Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zГtrace_0
У
Дtrace_02ф
M__inference_conv2d_transpose_2_layer_call_and_return_conditional_losses_21844Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zДtrace_0
3:1 @2conv2d_transpose_2/kernel
%:# 2conv2d_transpose_2/bias
і2±Ѓ
£≤Я
FullArgSpec'
argsЪ
jself
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 0
@
Д0
Е1
Ж2
З3"
trackable_list_wrapper
0
Д0
Е1"
trackable_list_wrapper
 "
trackable_list_wrapper
µ
Еnon_trainable_variables
Жlayers
Зmetrics
 Иlayer_regularization_losses
Йlayer_metrics
}	variables
~trainable_variables
regularization_losses
Б__call__
+В&call_and_return_all_conditional_losses
'В"call_and_return_conditional_losses"
_generic_user_object
б
Кtrace_0
Лtrace_12¶
6__inference_batch_normalization_97_layer_call_fn_21857
6__inference_batch_normalization_97_layer_call_fn_21870≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zКtrace_0zЛtrace_1
Ч
Мtrace_0
Нtrace_12№
Q__inference_batch_normalization_97_layer_call_and_return_conditional_losses_21888
Q__inference_batch_normalization_97_layer_call_and_return_conditional_losses_21906≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zМtrace_0zНtrace_1
 "
trackable_list_wrapper
*:( 2batch_normalization_97/gamma
):' 2batch_normalization_97/beta
2:0  (2"batch_normalization_97/moving_mean
6:4  (2&batch_normalization_97/moving_variance
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
Є
Оnon_trainable_variables
Пlayers
Рmetrics
 Сlayer_regularization_losses
Тlayer_metrics
И	variables
Йtrainable_variables
Кregularization_losses
М__call__
+Н&call_and_return_all_conditional_losses
'Н"call_and_return_conditional_losses"
_generic_user_object
у
Уtrace_02‘
-__inference_activation_97_layer_call_fn_21911Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zУtrace_0
О
Фtrace_02п
H__inference_activation_97_layer_call_and_return_conditional_losses_21916Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zФtrace_0
0
Ф0
Х1"
trackable_list_wrapper
0
Ф0
Х1"
trackable_list_wrapper
 "
trackable_list_wrapper
Є
Хnon_trainable_variables
Цlayers
Чmetrics
 Шlayer_regularization_losses
Щlayer_metrics
О	variables
Пtrainable_variables
Рregularization_losses
Т__call__
+У&call_and_return_all_conditional_losses
'У"call_and_return_conditional_losses"
_generic_user_object
ш
Ъtrace_02ў
2__inference_conv2d_transpose_3_layer_call_fn_21925Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zЪtrace_0
У
Ыtrace_02ф
M__inference_conv2d_transpose_3_layer_call_and_return_conditional_losses_21958Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zЫtrace_0
3:1 2conv2d_transpose_3/kernel
%:#2conv2d_transpose_3/bias
і2±Ѓ
£≤Я
FullArgSpec'
argsЪ
jself
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
Є
Ьnon_trainable_variables
Эlayers
Юmetrics
 Яlayer_regularization_losses
†layer_metrics
Ч	variables
Шtrainable_variables
Щregularization_losses
Ы__call__
+Ь&call_and_return_all_conditional_losses
'Ь"call_and_return_conditional_losses"
_generic_user_object
у
°trace_02‘
-__inference_activation_98_layer_call_fn_21963Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 z°trace_0
О
Ґtrace_02п
H__inference_activation_98_layer_call_and_return_conditional_losses_21968Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zҐtrace_0
Z
80
91
R2
S3
l4
m5
Ж6
З7"
trackable_list_wrapper
¶
0
1
2
3
4
5
6
7
	8

9
10
11
12
13
14
15
16
17"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
ДBБ
)__inference_generator_layer_call_fn_20509input_2input_3"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЖBГ
)__inference_generator_layer_call_fn_21073inputs/0inputs/1"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЖBГ
)__inference_generator_layer_call_fn_21131inputs/0inputs/1"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ДBБ
)__inference_generator_layer_call_fn_20809input_2input_3"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
°BЮ
D__inference_generator_layer_call_and_return_conditional_losses_21291inputs/0inputs/1"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
°BЮ
D__inference_generator_layer_call_and_return_conditional_losses_21451inputs/0inputs/1"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЯBЬ
D__inference_generator_layer_call_and_return_conditional_losses_20882input_2input_3"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЯBЬ
D__inference_generator_layer_call_and_return_conditional_losses_20955input_2input_3"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
—Bќ
#__inference_signature_wrapper_21015input_2input_3"Ф
Н≤Й
FullArgSpec
argsЪ 
varargs
 
varkwjkwargs
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
нBк
-__inference_concatenate_2_layer_call_fn_21457inputs/0inputs/1"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ИBЕ
H__inference_concatenate_2_layer_call_and_return_conditional_losses_21464inputs/0inputs/1"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
ўB÷
%__inference_dense_layer_call_fn_21473inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
фBс
@__inference_dense_layer_call_and_return_conditional_losses_21483inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
џBЎ
'__inference_reshape_layer_call_fn_21488inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
цBу
B__inference_reshape_layer_call_and_return_conditional_losses_21502inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
.
80
91"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
ыBш
6__inference_batch_normalization_94_layer_call_fn_21515inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ыBш
6__inference_batch_normalization_94_layer_call_fn_21528inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЦBУ
Q__inference_batch_normalization_94_layer_call_and_return_conditional_losses_21546inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЦBУ
Q__inference_batch_normalization_94_layer_call_and_return_conditional_losses_21564inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
бBё
-__inference_activation_94_layer_call_fn_21569inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ьBщ
H__inference_activation_94_layer_call_and_return_conditional_losses_21574inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
дBб
0__inference_conv2d_transpose_layer_call_fn_21583inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
€Bь
K__inference_conv2d_transpose_layer_call_and_return_conditional_losses_21616inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
.
R0
S1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
ыBш
6__inference_batch_normalization_95_layer_call_fn_21629inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ыBш
6__inference_batch_normalization_95_layer_call_fn_21642inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЦBУ
Q__inference_batch_normalization_95_layer_call_and_return_conditional_losses_21660inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЦBУ
Q__inference_batch_normalization_95_layer_call_and_return_conditional_losses_21678inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
бBё
-__inference_activation_95_layer_call_fn_21683inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ьBщ
H__inference_activation_95_layer_call_and_return_conditional_losses_21688inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
жBг
2__inference_conv2d_transpose_1_layer_call_fn_21697inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
БBю
M__inference_conv2d_transpose_1_layer_call_and_return_conditional_losses_21730inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
.
l0
m1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
ыBш
6__inference_batch_normalization_96_layer_call_fn_21743inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ыBш
6__inference_batch_normalization_96_layer_call_fn_21756inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЦBУ
Q__inference_batch_normalization_96_layer_call_and_return_conditional_losses_21774inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЦBУ
Q__inference_batch_normalization_96_layer_call_and_return_conditional_losses_21792inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
бBё
-__inference_activation_96_layer_call_fn_21797inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ьBщ
H__inference_activation_96_layer_call_and_return_conditional_losses_21802inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
жBг
2__inference_conv2d_transpose_2_layer_call_fn_21811inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
БBю
M__inference_conv2d_transpose_2_layer_call_and_return_conditional_losses_21844inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
0
Ж0
З1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
ыBш
6__inference_batch_normalization_97_layer_call_fn_21857inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ыBш
6__inference_batch_normalization_97_layer_call_fn_21870inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЦBУ
Q__inference_batch_normalization_97_layer_call_and_return_conditional_losses_21888inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЦBУ
Q__inference_batch_normalization_97_layer_call_and_return_conditional_losses_21906inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
бBё
-__inference_activation_97_layer_call_fn_21911inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ьBщ
H__inference_activation_97_layer_call_and_return_conditional_losses_21916inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
жBг
2__inference_conv2d_transpose_3_layer_call_fn_21925inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
БBю
M__inference_conv2d_transpose_3_layer_call_and_return_conditional_losses_21958inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
бBё
-__inference_activation_98_layer_call_fn_21963inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ьBщ
H__inference_activation_98_layer_call_and_return_conditional_losses_21968inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 и
 __inference__wrapped_model_19880√ '(6789FGPQRS`ajklmz{ДЕЖЗФХXҐU
NҐK
IЪF
!К
input_2€€€€€€€€€d
!К
input_3€€€€€€€€€
™ "E™B
@
activation_98/К,
activation_98€€€€€€€€€ґ
H__inference_activation_94_layer_call_and_return_conditional_losses_21574j8Ґ5
.Ґ+
)К&
inputs€€€€€€€€€А
™ ".Ґ+
$К!
0€€€€€€€€€А
Ъ О
-__inference_activation_94_layer_call_fn_21569]8Ґ5
.Ґ+
)К&
inputs€€€€€€€€€А
™ "!К€€€€€€€€€Аґ
H__inference_activation_95_layer_call_and_return_conditional_losses_21688j8Ґ5
.Ґ+
)К&
inputs€€€€€€€€€А
™ ".Ґ+
$К!
0€€€€€€€€€А
Ъ О
-__inference_activation_95_layer_call_fn_21683]8Ґ5
.Ґ+
)К&
inputs€€€€€€€€€А
™ "!К€€€€€€€€€Аі
H__inference_activation_96_layer_call_and_return_conditional_losses_21802h7Ґ4
-Ґ*
(К%
inputs€€€€€€€€€@
™ "-Ґ*
#К 
0€€€€€€€€€@
Ъ М
-__inference_activation_96_layer_call_fn_21797[7Ґ4
-Ґ*
(К%
inputs€€€€€€€€€@
™ " К€€€€€€€€€@і
H__inference_activation_97_layer_call_and_return_conditional_losses_21916h7Ґ4
-Ґ*
(К%
inputs€€€€€€€€€ 
™ "-Ґ*
#К 
0€€€€€€€€€ 
Ъ М
-__inference_activation_97_layer_call_fn_21911[7Ґ4
-Ґ*
(К%
inputs€€€€€€€€€ 
™ " К€€€€€€€€€ і
H__inference_activation_98_layer_call_and_return_conditional_losses_21968h7Ґ4
-Ґ*
(К%
inputs€€€€€€€€€
™ "-Ґ*
#К 
0€€€€€€€€€
Ъ М
-__inference_activation_98_layer_call_fn_21963[7Ґ4
-Ґ*
(К%
inputs€€€€€€€€€
™ " К€€€€€€€€€о
Q__inference_batch_normalization_94_layer_call_and_return_conditional_losses_21546Ш6789NҐK
DҐA
;К8
inputs,€€€€€€€€€€€€€€€€€€€€€€€€€€€А
p 
™ "@Ґ=
6К3
0,€€€€€€€€€€€€€€€€€€€€€€€€€€€А
Ъ о
Q__inference_batch_normalization_94_layer_call_and_return_conditional_losses_21564Ш6789NҐK
DҐA
;К8
inputs,€€€€€€€€€€€€€€€€€€€€€€€€€€€А
p
™ "@Ґ=
6К3
0,€€€€€€€€€€€€€€€€€€€€€€€€€€€А
Ъ ∆
6__inference_batch_normalization_94_layer_call_fn_21515Л6789NҐK
DҐA
;К8
inputs,€€€€€€€€€€€€€€€€€€€€€€€€€€€А
p 
™ "3К0,€€€€€€€€€€€€€€€€€€€€€€€€€€€А∆
6__inference_batch_normalization_94_layer_call_fn_21528Л6789NҐK
DҐA
;К8
inputs,€€€€€€€€€€€€€€€€€€€€€€€€€€€А
p
™ "3К0,€€€€€€€€€€€€€€€€€€€€€€€€€€€Ао
Q__inference_batch_normalization_95_layer_call_and_return_conditional_losses_21660ШPQRSNҐK
DҐA
;К8
inputs,€€€€€€€€€€€€€€€€€€€€€€€€€€€А
p 
™ "@Ґ=
6К3
0,€€€€€€€€€€€€€€€€€€€€€€€€€€€А
Ъ о
Q__inference_batch_normalization_95_layer_call_and_return_conditional_losses_21678ШPQRSNҐK
DҐA
;К8
inputs,€€€€€€€€€€€€€€€€€€€€€€€€€€€А
p
™ "@Ґ=
6К3
0,€€€€€€€€€€€€€€€€€€€€€€€€€€€А
Ъ ∆
6__inference_batch_normalization_95_layer_call_fn_21629ЛPQRSNҐK
DҐA
;К8
inputs,€€€€€€€€€€€€€€€€€€€€€€€€€€€А
p 
™ "3К0,€€€€€€€€€€€€€€€€€€€€€€€€€€€А∆
6__inference_batch_normalization_95_layer_call_fn_21642ЛPQRSNҐK
DҐA
;К8
inputs,€€€€€€€€€€€€€€€€€€€€€€€€€€€А
p
™ "3К0,€€€€€€€€€€€€€€€€€€€€€€€€€€€Ам
Q__inference_batch_normalization_96_layer_call_and_return_conditional_losses_21774ЦjklmMҐJ
CҐ@
:К7
inputs+€€€€€€€€€€€€€€€€€€€€€€€€€€€@
p 
™ "?Ґ<
5К2
0+€€€€€€€€€€€€€€€€€€€€€€€€€€€@
Ъ м
Q__inference_batch_normalization_96_layer_call_and_return_conditional_losses_21792ЦjklmMҐJ
CҐ@
:К7
inputs+€€€€€€€€€€€€€€€€€€€€€€€€€€€@
p
™ "?Ґ<
5К2
0+€€€€€€€€€€€€€€€€€€€€€€€€€€€@
Ъ ƒ
6__inference_batch_normalization_96_layer_call_fn_21743ЙjklmMҐJ
CҐ@
:К7
inputs+€€€€€€€€€€€€€€€€€€€€€€€€€€€@
p 
™ "2К/+€€€€€€€€€€€€€€€€€€€€€€€€€€€@ƒ
6__inference_batch_normalization_96_layer_call_fn_21756ЙjklmMҐJ
CҐ@
:К7
inputs+€€€€€€€€€€€€€€€€€€€€€€€€€€€@
p
™ "2К/+€€€€€€€€€€€€€€€€€€€€€€€€€€€@р
Q__inference_batch_normalization_97_layer_call_and_return_conditional_losses_21888ЪДЕЖЗMҐJ
CҐ@
:К7
inputs+€€€€€€€€€€€€€€€€€€€€€€€€€€€ 
p 
™ "?Ґ<
5К2
0+€€€€€€€€€€€€€€€€€€€€€€€€€€€ 
Ъ р
Q__inference_batch_normalization_97_layer_call_and_return_conditional_losses_21906ЪДЕЖЗMҐJ
CҐ@
:К7
inputs+€€€€€€€€€€€€€€€€€€€€€€€€€€€ 
p
™ "?Ґ<
5К2
0+€€€€€€€€€€€€€€€€€€€€€€€€€€€ 
Ъ »
6__inference_batch_normalization_97_layer_call_fn_21857НДЕЖЗMҐJ
CҐ@
:К7
inputs+€€€€€€€€€€€€€€€€€€€€€€€€€€€ 
p 
™ "2К/+€€€€€€€€€€€€€€€€€€€€€€€€€€€ »
6__inference_batch_normalization_97_layer_call_fn_21870НДЕЖЗMҐJ
CҐ@
:К7
inputs+€€€€€€€€€€€€€€€€€€€€€€€€€€€ 
p
™ "2К/+€€€€€€€€€€€€€€€€€€€€€€€€€€€ –
H__inference_concatenate_2_layer_call_and_return_conditional_losses_21464ГZҐW
PҐM
KЪH
"К
inputs/0€€€€€€€€€d
"К
inputs/1€€€€€€€€€
™ "%Ґ"
К
0€€€€€€€€€~
Ъ І
-__inference_concatenate_2_layer_call_fn_21457vZҐW
PҐM
KЪH
"К
inputs/0€€€€€€€€€d
"К
inputs/1€€€€€€€€€
™ "К€€€€€€€€€~г
M__inference_conv2d_transpose_1_layer_call_and_return_conditional_losses_21730С`aJҐG
@Ґ=
;К8
inputs,€€€€€€€€€€€€€€€€€€€€€€€€€€€А
™ "?Ґ<
5К2
0+€€€€€€€€€€€€€€€€€€€€€€€€€€€@
Ъ ї
2__inference_conv2d_transpose_1_layer_call_fn_21697Д`aJҐG
@Ґ=
;К8
inputs,€€€€€€€€€€€€€€€€€€€€€€€€€€€А
™ "2К/+€€€€€€€€€€€€€€€€€€€€€€€€€€€@в
M__inference_conv2d_transpose_2_layer_call_and_return_conditional_losses_21844Рz{IҐF
?Ґ<
:К7
inputs+€€€€€€€€€€€€€€€€€€€€€€€€€€€@
™ "?Ґ<
5К2
0+€€€€€€€€€€€€€€€€€€€€€€€€€€€ 
Ъ Ї
2__inference_conv2d_transpose_2_layer_call_fn_21811Гz{IҐF
?Ґ<
:К7
inputs+€€€€€€€€€€€€€€€€€€€€€€€€€€€@
™ "2К/+€€€€€€€€€€€€€€€€€€€€€€€€€€€ д
M__inference_conv2d_transpose_3_layer_call_and_return_conditional_losses_21958ТФХIҐF
?Ґ<
:К7
inputs+€€€€€€€€€€€€€€€€€€€€€€€€€€€ 
™ "?Ґ<
5К2
0+€€€€€€€€€€€€€€€€€€€€€€€€€€€
Ъ Љ
2__inference_conv2d_transpose_3_layer_call_fn_21925ЕФХIҐF
?Ґ<
:К7
inputs+€€€€€€€€€€€€€€€€€€€€€€€€€€€ 
™ "2К/+€€€€€€€€€€€€€€€€€€€€€€€€€€€в
K__inference_conv2d_transpose_layer_call_and_return_conditional_losses_21616ТFGJҐG
@Ґ=
;К8
inputs,€€€€€€€€€€€€€€€€€€€€€€€€€€€А
™ "@Ґ=
6К3
0,€€€€€€€€€€€€€€€€€€€€€€€€€€€А
Ъ Ї
0__inference_conv2d_transpose_layer_call_fn_21583ЕFGJҐG
@Ґ=
;К8
inputs,€€€€€€€€€€€€€€€€€€€€€€€€€€€А
™ "3К0,€€€€€€€€€€€€€€€€€€€€€€€€€€€А°
@__inference_dense_layer_call_and_return_conditional_losses_21483]'(/Ґ,
%Ґ"
 К
inputs€€€€€€€€€~
™ "&Ґ#
К
0€€€€€€€€€А1
Ъ y
%__inference_dense_layer_call_fn_21473P'(/Ґ,
%Ґ"
 К
inputs€€€€€€€€€~
™ "К€€€€€€€€€А1ь
D__inference_generator_layer_call_and_return_conditional_losses_20882≥ '(6789FGPQRS`ajklmz{ДЕЖЗФХ`Ґ]
VҐS
IЪF
!К
input_2€€€€€€€€€d
!К
input_3€€€€€€€€€
p 

 
™ "-Ґ*
#К 
0€€€€€€€€€
Ъ ь
D__inference_generator_layer_call_and_return_conditional_losses_20955≥ '(6789FGPQRS`ajklmz{ДЕЖЗФХ`Ґ]
VҐS
IЪF
!К
input_2€€€€€€€€€d
!К
input_3€€€€€€€€€
p

 
™ "-Ґ*
#К 
0€€€€€€€€€
Ъ ю
D__inference_generator_layer_call_and_return_conditional_losses_21291µ '(6789FGPQRS`ajklmz{ДЕЖЗФХbҐ_
XҐU
KЪH
"К
inputs/0€€€€€€€€€d
"К
inputs/1€€€€€€€€€
p 

 
™ "-Ґ*
#К 
0€€€€€€€€€
Ъ ю
D__inference_generator_layer_call_and_return_conditional_losses_21451µ '(6789FGPQRS`ajklmz{ДЕЖЗФХbҐ_
XҐU
KЪH
"К
inputs/0€€€€€€€€€d
"К
inputs/1€€€€€€€€€
p

 
™ "-Ґ*
#К 
0€€€€€€€€€
Ъ ‘
)__inference_generator_layer_call_fn_20509¶ '(6789FGPQRS`ajklmz{ДЕЖЗФХ`Ґ]
VҐS
IЪF
!К
input_2€€€€€€€€€d
!К
input_3€€€€€€€€€
p 

 
™ " К€€€€€€€€€‘
)__inference_generator_layer_call_fn_20809¶ '(6789FGPQRS`ajklmz{ДЕЖЗФХ`Ґ]
VҐS
IЪF
!К
input_2€€€€€€€€€d
!К
input_3€€€€€€€€€
p

 
™ " К€€€€€€€€€÷
)__inference_generator_layer_call_fn_21073® '(6789FGPQRS`ajklmz{ДЕЖЗФХbҐ_
XҐU
KЪH
"К
inputs/0€€€€€€€€€d
"К
inputs/1€€€€€€€€€
p 

 
™ " К€€€€€€€€€÷
)__inference_generator_layer_call_fn_21131® '(6789FGPQRS`ajklmz{ДЕЖЗФХbҐ_
XҐU
KЪH
"К
inputs/0€€€€€€€€€d
"К
inputs/1€€€€€€€€€
p

 
™ " К€€€€€€€€€®
B__inference_reshape_layer_call_and_return_conditional_losses_21502b0Ґ-
&Ґ#
!К
inputs€€€€€€€€€А1
™ ".Ґ+
$К!
0€€€€€€€€€А
Ъ А
'__inference_reshape_layer_call_fn_21488U0Ґ-
&Ґ#
!К
inputs€€€€€€€€€А1
™ "!К€€€€€€€€€Аь
#__inference_signature_wrapper_21015‘ '(6789FGPQRS`ajklmz{ДЕЖЗФХiҐf
Ґ 
_™\
,
input_2!К
input_2€€€€€€€€€d
,
input_3!К
input_3€€€€€€€€€"E™B
@
activation_98/К,
activation_98€€€€€€€€€